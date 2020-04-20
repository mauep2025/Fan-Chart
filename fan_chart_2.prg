
pageselect fan_chart_2

'Forecast Assessment sample
%fasmpl="2008q1 2018q4"

'Complete Sample 
%csmpl="1994q1 2021q4"

'Sample for estimation
%esmpl="1996q1 2019q4"

'Sample for graph variables 
%gsmpl="2016q1 2019q3"

' Sample for forecasting
%fsmpl="2019q3 2021q4"

' Sample for Fan Chart
%fcsmpl="2017q1 2021q4"



'Bootstrap errors? 1=yes, 0=no, use normal distribution
!boot=1

'Coefficient uncertainty? 1=yes, 0=no coefficient uncertanty
!coefu=1

'Number of bands in fanchart starting from 90%. 
'For example, !numb=1 plots 90% band and the mode, 
'!numb=2 plots 90% band, 45% band and the mode 
!numb=3

'Do not change the 2 parameters below unless you are adapting the code
' for your own model
'Name of the model to be used for constructing a fan chart
%modname="model01"

'Variable to forecast (has to be one of the model variables)
%varname="gdp"



smpl {%esmpl}
'=========== Model specification =========
'replace the two lines below with your model of inflation if you want
 var var_gdp.ls 1 2 gdp indusa tcr pp_import_usa m2 tiie_28  @ c dum_2 dum1_2 dum2_2 dum3_2 dum5_2 dum6_2 dum4_2 dum7_2 @seas(4) @seas(2) dum8_2 @seas(1)  @trend

var_gdp.makemodel({%modname})
'=============== Main Fan Chart Program==============
%quant_array="90 "
!quant_step=90/!numb
!k=90-!quant_step
while !k>5 
%quant_array=%quant_array+@str(@round(!k))+" "
!k=!k-!quant_step
wend
%quant_array=%quant_array+"1"


delete(noerr) g2
group g2

for %quant {%quant_array}  
	!alfa={%quant} 'current confidence level
	smpl {%fsmpl}
	!alfa_ratio=!alfa/100 
	
	!num_simul=1000

	if @abs(!boot-1)<0.0001 then 'boot strap errors
		if @abs(!coefu-1)<0.0001 then 'coefficient uncertainty
			{%modname}.stochastic(i=b, b=!alfa_ratio,c=t,r=!num_simul)
		else 'no coefficient uncertainty
			{%modname}.stochastic(i=b, b=!alfa_ratio,r=!num_simul)
		endif
	else 'normal errors
		if @abs(!coefu-1)<0.0001 then 'coefficient uncertainty
			{%modname}.stochastic(i=n, b=!alfa_ratio,c=t,r=!num_simul)
		else 'no coefficient uncertainty
			{%modname}.stochastic(i=n, b=!alfa_ratio,r=!num_simul)
		endif
	endif	
	
     {%modname}.scenario "scenario 1"
     {%modname}.exclude indusa m2 
	{%modname}.solveopt(s=a)
     '{%modname}.stochastic(p=df)
	{%modname}.solve
	
	%first_elem_fsmpl=@wleft(%fsmpl,1)
	%second_elem_fsmpl=@wright(%fsmpl,1)
	
	smpl {%first_elem_fsmpl} {%first_elem_fsmpl}
	{%varname}_1h={%varname}
	{%varname}_1l={%varname}
	
	'delete(noerr) smpl_gr
	'sample smpl_gr {%first_elem_fsmpl}-6 {%second_elem_fsmpl}
	smpl {%first_elem_fsmpl}-6 {%second_elem_fsmpl}
	if !alfa<3 then
		%quant="0"
	endif
	series {%varname}_{%quant}h_1={%varname}_1h
	series {%varname}_{%quant}l_1={%varname}_1l
	g2.add {%varname}_{%quant}l_1 {%varname}_{%quant}h_1

next
series gdp1={%varname}
g2.add {%varname} gdp1
freeze(fanchart, mode=overwrite) g2.band(o="modern")

fanchart.legend -display
for !i=1 to !numb+1
	!r=@round(0.2*255)
	!b=0
	!g=@round((1-0.175*@sqrt(!i) )*255)
	fanchart.setelem(!i) fcolor(@rgb(!r,!g,!b))
next
!numline=!numb+2
fanchart.setelem(!numline) fcolor(blue) lwidth(10)

fanchart.draw(shade,b, gray) {%fsmpl}
show fanchart

smpl @all



'--------------------------------------------------------------------------------------------

smpl {%csmpl}

genr gdp_o        =exp(gdp)
genr gdp_mo     =exp(gdp_1m)
genr gdp_30ho  =exp(gdp_30h_1)
genr gdp_30lo   =exp(gdp_30l_1)
genr gdp_60ho  =exp(gdp_60h_1)
genr gdp_60lo   =exp(gdp_60l_1)
genr gdp_90ho  =exp(gdp_90h_1)
genr gdp_90lo   =exp(gdp_90l_1)

smpl {%gsmpl}
genr gdp_30ho  =gdp_o 
genr gdp_30lo   =gdp_o 
genr gdp_60ho  =gdp_o
genr gdp_60lo   =gdp_o 
genr gdp_90ho  =gdp_o 
genr gdp_90lo   =gdp_o
genr gdp_mo     =gdp_o

smpl {%csmpl}
genr gdp_30ho_g  =@pcy(gdp_30ho)
genr gdp_30lo_g   =@pcy(gdp_30lo) 
genr gdp_60ho_g  =@pcy(gdp_60ho)
genr gdp_60lo_g   =@pcy(gdp_60lo)
genr gdp_90ho_g  =@pcy(gdp_90ho)
genr gdp_90lo_g   =@pcy(gdp_90lo)
genr gdp_o_g       = @pcy(gdp_o)
genr PIB =@pcy(gdp_mo)

delete(noerr) g3
group g3

g3.add  gdp_90lo_g  gdp_90ho_g  gdp_60lo_g  gdp_60ho_g  gdp_30lo_g  gdp_30ho_g  PIB

   
smpl {%fcsmpl}

'delete fanchart_o_g

freeze(fanchart_o_g) g3.mixed  band(1,2,3,4,5,6) line(7) 

' Modify colors for each band
fanchart_o_g.setelem(1) axis(right) legend(Intervalo de Confianza al 90% ) fillcolor(143,202,250) 
fanchart_o_g.setelem(2) axis(right) legend()  fillcolor(26,140,255)
fanchart_o_g.setelem(3) axis(right) legend(Intervalo de Confianza al 60%) fillcolor(20,80,220)
fanchart_o_g.setelem(4) axis(right) legend()
fanchart_o_g.setelem(5) axis(right) legend(Intervalo de Confianza al 30%) 
fanchart_o_g.setelem(6) axis(right) legend() 
fanchart_o_g.axis(right)
'fanchart_o_g.setelem(7) linecolor(255,160,160) fillcolor(255,160,160) linewidth(2)
fanchart_o_g.setelem(7) axis(right) linewidth(1.5)
'fanchart_o_g.setelem(8) axis(right) linewidth(1.5) linecolor(255,160,160) fillcolor(255,160,160)
'fanchart_o_g.setelem(8) linecolor(0,64,128) linewidth(2)
'fanchart_o_g.setelem(7) legend(PIB en cifras originales)  linewidth(1.5)
'fanchart_o_g.setelem(8) legend(Mediana)
fanchart_o_g.legend -inbox position(0.10,1.85)
fanchart_o_g.addtext(t, textcolor(0,64,128), font(Calibri, 14, b)) "Gráfica de Abanico: Actividad Económica (%Anual, c.o.)" 
fanchart_o_g.addtext(.10, 3.53, x, textcolor(white), fillcolor(0,64,128), framecolor(0,64,128), font(Calibri, 8, b)) "Elaborado por EAnálisis Consultores con información de INEGI y BANXICO " 
fanchart_o_g.options backcolor(white)
fanchart_o_g.draw(shade,b, gray) {%fsmpl}
show fanchart_o_g
'fanchart.setelem(!i) fcolor(@rgb(!r,!g,!b))

smpl @all




