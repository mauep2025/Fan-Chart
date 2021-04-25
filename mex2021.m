% Macroeconomics GDP forecast México
clear;
clc;
close all

load ('data');
load ('cbo');
load ('inflation');
%-------------- Time format 1
t1 = datetime(1996,3,31);
t2 = datetime(2022,12,31);
t = (t1 + calquarters(0:25*4))';
t = t(1:100,:);
t_2 = (t1 + calquarters(0:27*4))';  
t_2 = t_2(1:108,:);

%-------------- Time format 2
time1 = (1996+0/4:1/4:2020+4/4)';
time1 = time1(1:100,:);
time2 = (1996+0/4:1/4:2022+4/4)';
time2 = time2(1:108,:);

%------------- Data transformation
[T,~]=size(matlabdatabase);

gdp_m = matlabdatabase.gdp;
ex = matlabdatabase.ex;
gdp_re = matlabdatabase.gdp_retail;
m2 = matlabdatabase.m2;
pp = matlabdatabase.pp;
i_rate = matlabdatabase.i_rate;
t_b = matlabdatabase.t_bill_usa;
gdp_usa = matlabdatabase.gdp_usa;
effr = matlabdatabase.effr;

gdp_cbo = cbo.gdp_cbo; 
gdp_cbo1 = cbo.gdp_cbo1; 
gdp_cbo2 = cbo.gdp_cbo2;
gdp_cbo3 = cbo.gdp_cbo3;
wti_cbo = cbo.wti_cbo;
wti_cbo1_1 = cbo.wti_cbo1;
effr_cbo = cbo.effr_cbo;
ex_b= cbo.ex;

i_rate_s(1:2,:) = i_rate(64:65) - i_rate(64:65)*.14;
i_rate_s(3:6,:)= i_rate(66:69) - i_rate(66:69)*.2;
i_rate_s(7:8,:) = i_rate(70:71) - i_rate(70:71)*.16;




gdp_m_l = log(gdp_m);
ex_l = log(ex);
gdp_r_l = log(gdp_re);
m2_l = log(m2);
pp_l = log(pp);
i_rate_l = log(i_rate);
t_b_l = log(t_b);
gdp_usa_l = log(gdp_usa);
effr_l = log(effr);

gdp_r=100*((gdp_m(5:T,:)./gdp_m(1:T-4,:))-1);
ex_r=100*((ex(5:T,:)./ex(1:T-4,:))-1);
gdpr_r=100*((gdp_re(5:T,:)./gdp_re(1:T-4,:))-1);
m2_r=100*((m2(5:T,:)./m2(1:T-4,:))-1);
pp_r=100*((pp(5:T,:)./pp(1:T-4,:))-1);
i_rate_r=100*((i_rate(5:T,:)./i_rate(1:T-4,:))-1);
t_b_r=100*((t_b(5:T,:)./t_b(1:T-4,:))-1);
gdpusa_r=100*((gdp_usa(5:T,:)./gdp_usa(1:T-4,:))-1);
effr_r=100*((effr(5:T,:)./effr(1:T-4,:))-1);

gdp_r1=100*((gdp_m(2:T,:)./gdp_m(1:T-1,:))-1);
ex_r1=100*((ex(2:T,:)./ex(1:T-1,:))-1);
gdpr_r1=100*((gdp_re(2:T,:)./gdp_re(1:T-1,:))-1);
m2_r1=100*((m2(2:T,:)./m2(1:T-1,:))-1);
pp_r1=100*((pp(2:T,:)./pp(1:T-1,:))-1);
i_rate_r1=100*((i_rate(2:T,:)./i_rate(1:T-1,:))-1);
t_b_r1=100*((t_b(2:T,:)./t_b(1:T-1,:))-1);
gdpusa_r1=100*((gdp_usa(2:T,:)./gdp_usa(1:T-1,:))-1);
effr_r1=100*((effr(2:T,:)./effr(1:T-1,:))-1);


[T1,~]=size(cbo);  %  1=1997q1, 140 =2031q4 and 2020q4=92, thus: 2021q1_to_2022q4 = 93:100
gdpcbo_r=100*((gdp_cbo(5:T1,:)./gdp_cbo(1:T1-4,:))-1);
gdpcbo1_r=100*((gdp_cbo1(5:T1,:)./gdp_cbo1(1:T1-4,:))-1);
gdpcbo2_r=100*((gdp_cbo2(5:T1,:)./gdp_cbo2(1:T1-4,:))-1);
gdpcbo3_r=100*((gdp_cbo3(5:T1,:)./gdp_cbo3(1:T1-4,:))-1);

wti_r = 100*((wti_cbo(5:T1,:)./wti_cbo(1:T1-4,:))-1);
wti2_r_1 = 100*((wti_cbo1_1(5:T1,:)./wti_cbo1_1(1:T1-4,:))-1);

effrcbo_r = 100*((effr_cbo(5:T1,:)./effr_cbo(1:T1-4,:))-1);  % but effr must be 2021q1 =
exb_cbo = NaN(140,1);
exb_cbo(1:101,:) =100*((ex_b(5:105,:)./ex_b(1:105-4,:))-1);

gdpcbo_r1=100*((gdp_cbo(2:T1,:)./gdp_cbo(1:T1-1,:))-1);
%gdpcbo1_r=100*((gdp_cbo1(2:T1,:)./gdp_cbo1(1:T1-1,:))-1);
%gdpcbo2_r=100*((gdp_cbo2(2:T1,:)./gdp_cbo2(1:T1-1,:))-1);

wti_r1 = 100*((wti_cbo(2:T1,:)./wti_cbo(1:T1-1,:))-1);
wti_r2 = 100*((wti_cbo1_1(2:T1,:)./wti_cbo1_1(1:T1-1,:))-1);
effrcbo_r1 = 100*((effr_cbo(2:T1,:)./effr_cbo(1:T1-1,:))-1);  % but effr must be 2021q1 =
exb_cbo1 = NaN(140,1);
exb_cbo1(1:104,:) =100*((ex_b(2:105,:)./ex_b(1:105-1,:))-1);

%------------ VAR model

A1 = [effr(5:100) gdpusa_r(1:96)  pp_r(1:96) ex_r(1:96) gdpr_r(1:96) gdp_r(1:96)];
A2 = [effr(5:100) gdpusa_r(1:96)  pp_r(1:96) ex_r(1:96) i_rate(5:100) gdpr_r(1:96) gdp_r(1:96)];
A3 = [effr(5:100) gdpusa_r1(1:96)  pp_r1(1:96) ex_r1(1:96) i_rate(5:100) gdpr_r1(1:96) gdp_r1(1:96)];
%A4 = [effr(5:100) gdpusa_r1(1:96)  pp_r1(1:96) ex_r1(1:96) i_rate(5:100) gdpr_r1(1:96) gdp_r1(1:96)];


numseries=7;
seriesnam={'i_usa','gdp_usa','pp','ex', 'i_rate' , 'gdp_r' , 'gdp'};

VAR=varm(numseries,2); % the number is the lag or 8


VAR.SeriesNames=seriesnam;
[EstMdl,E1]= estimate(VAR,A2(30:96,:),'Y0',A2(30:96,:));
%[EstMdl,E1]= estimate(VAR,A2(60:96,:),'Y0',A2(60:96,:));

results=summarize(EstMdl);  
np=results.NumEstimatedParameters;
numperiods = 8;
[FY1,Forecastmse1]=forecast(EstMdl,numperiods,A2(55:96,:));
%[FY1,Forecastmse1]=forecast(EstMdl,numperiods,A2(55:96,:));
% --- Conditional forecast

YS  = [effr_cbo(101:108) gdpcbo_r(97:104) wti_r(97:104) exb_cbo(97:104) i_rate_s nan(8,1) nan(8,1)];
YS1 = [effr_cbo(101:108) gdpcbo_r(97:104) wti_r(97:104) exb_cbo(97:104) nan(8,1) nan(8,1)];
YS2 = [effr_cbo(101:108) gdpcbo2_r(97:104) wti_r(97:104) exb_cbo(97:104) i_rate_s nan(8,1) nan(8,1)]; % averagre  goldman sachs and cbo
YS3 = [effr_cbo(101:108) gdpcbo1_r(97:104) wti2_r_1(97:104) exb_cbo(97:104) i_rate_s nan(8,1) nan(8,1)]; % averagre  goldman sachs and cbo
YS4 = [effr_cbo(101:108) gdpcbo3_r(97:104) wti_r(97:104) exb_cbo(97:104) i_rate_s nan(8,1) nan(8,1)]; % averagre  goldman sachs and cbo

   %  YS=[nan(12,1) A2(13:24,2) A2(13:24,3) A2(13:24,4) A2(13:24,5) nan(12,1)];
   % YS_2=[nan(12,1) nan(12,1) nan(12,1) nan(12,1)   repmat(A2(98,2),12,1) nan(12,1)];
FY_2 = forecast(EstMdl,8,A2(55:96,:),'YF',YS);

horizon = 4
numForecasts = 8
yForecast = nan(numForecasts, horizon, numseries);

% Fan chart

rng default
YY = simulate(EstMdl, size(YS2,1), 'Y0', A2, 'YF', YS, 'NumPaths', 1000);


figure
for i = 1:200
    plot(t_2(101:108,:), YY(:,7,i))
    hold on
end
title('Real GDP Sample Paths')
ylabel('Y-o-Y')

z=YY(:,7,1:1000)
z1=reshape(z,[8 1000])

x1 = { time2(93:100,:) A1(89:96,6) };
x2 = { time2(97:108,:) z1 };
x1 = num2cell( A1(85:96,6))
x2 = num2cell( time2(89:100,:) );
x3= [x2 x1]
x4 = num2cell( z1)
x5 = num2cell( time2(101:108,:))
x6 = [x5 x4]

fanplot (x3, x6, 'FanFaceColor',[0 0.4470 0.7410;1 1 1],'ForecastMarker', ...
  'none', 'HistoricalMarker', 'none', 'HistoricalLineColor' , [0.8500 0.3250 0.0980],  ...
'HistoricalLineStyle', '-', 'HistoricalLineWidth', 3);



gdp_r4 = gdp_r(85:97) 
gdp_r4(13,:)= -.4353

figure
h1 = plot(time2(89:101), gdp_r4,'linewidth',2, 'color',   [0.8500 0.3250 0.0980])
hold on 
 fanChart(time2(101:108), z1,  'mean', 10:10:90, ...
    'alpha', .9, 'colormap', {'shadesOfColor', [0 .3 .9]}) ;
set(gcf, 'color',  'w');
title('México: Pronóstico PIB (2021-2022)', 'fontsize', 16)
%xlabel('Nota: Variación anual con datos de ajuste estacional');
box off
hold off


figure

fanChart(time2(101:108), z1,  'mean', 10:10:90, ...
    'alpha', .5, 'colormap', {'shadesOfColor', [0 0 1]}) ;
set(gcf, 'color',  'w');
title('Pronóstico 2021-2022 (trimestres)')


figure

fanChart(1:size(z1,1), z1,  'mean', 10:10:90, ...
    'alpha', .5, 'colormap', {'shadesOfColor', [0 0 1]}) ;
set(gcf, 'color',  'w');
title('Pronóstico 2021-2022 (trimestres)')

%Probability density function
Yz = permute(squeeze(YY(8,:,:)), [2 1]);
figure
histogram(Yz(:,7), 'Normalization', 'pdf')
xlabel('Real GDP (Anual)')
ylabel('Probability');
title('2-Year-Ahead Density of Real GDP')

Yz = permute(squeeze(YY(2:2,:,:)), [2 1]);
figure
histogram(Yz(:,7), 'Normalization', 'pdf')
xlabel('Real GDP (Anual)', 'fontsize', 20)
ylabel('Probability', 'fontsize', 20);
set(gcf, 'color',  'w');
title('1-Year-Ahead Density of Real GDP', 'fontsize', 20)


YY = simulate(EstMdl, size(YS,1), 'Y0', A2, 'YF', YS, 'NumPaths', 1000);
Yz = permute(squeeze(YY(4,:,:)), [2 1]);
figure
histogram(Yz(:,7), 'Normalization', 'pdf', 'FaceColor',[0 0.4470 0.7410] )
xlabel('Real GDP (Anual)', 'fontsize', 13)
ylabel('Probability', 'fontsize', 13);
set(gcf, 'color',  'w');
title('2021 Density of Real GDP' , 'fontsize', 16)


YY = simulate(EstMdl, size(YS,1), 'Y0', A2, 'YF', YS, 'NumPaths', 1000);
Yz = permute(squeeze(YY(4,:,:)), [2 1]);
figure
histogram(Yz(:,7), 'Normalization', 'pdf', 'FaceColor',[0 0.4470 0.7410] )
xlabel('Crecimiento Anual', 'fontsize', 13)
ylabel('Probabilidad', 'fontsize', 13);
set(gcf, 'color',  'w');
title('Densidad del PIB para 2021' , 'fontsize', 16)

%//////////
YY = simulate(EstMdl, size(YS2,1), 'Y0', A2, 'YF', YS4, 'NumPaths', 1000);
Yz = permute(squeeze(YY(4,:,:)), [2 1]);
figure
histogram(Yz(:,7), 'Normalization', 'pdf', 'FaceColor',[0 0.4470 0.7410] )
xlabel('Crecimiento Anual', 'fontsize', 13)
ylabel('Probabilidad', 'fontsize', 13);
set(gcf, 'color',  'w');
title('Densidad del PIB para 2021' , 'fontsize', 16)
%////////////////////////////////////////////////////////

Yz1 = permute(squeeze(YY(8,:,:)), [1:7]);
figure
histogram(Yz1(:,7), 'Normalization', 'pdf')
xlabel('Real GDP (Anual)')
title('25-Year-Ahead Density of Real GDP')

%%
%%%%////////////////////// Inflación

% Genereal Inflation, food prices,, commoditie prices, oil prices, m2,
% exchange rate, interest rate, GDP or M2

inpc = inflation.inpc;
food = inflation.imf_food;

inpc_r=100*((inpc(5:T,:)./inpc(1:T-4,:))-1);
food_r=100*((food(5:T,:)./food(1:T-4,:))-1);

%------------ VAR model

A4 = [pp_r(1:96) ex_r(1:96) food_r(1:96) i_rate(5:100) gdp_r(1:96) inpc_r(1:96)];
%A5 = [pp_r(1:96) food_r ex_r(1:96) i_rate(5:100) gdp_r(1:96) inpc()];

numseries=6;
seriesnam={'pp','food','ex', 'i_rate' , 'gdp_r' , 'inpc'};

VAR3=varm(numseries,1); % the number is the lag or  1 or 5


VAR3.SeriesNames=seriesnam;
[EstMd3,E1]= estimate(VAR3,A4(55:96,:),'Y0',A4(55:96,:));
results=summarize(EstMd3);  
np=results.NumEstimatedParameters;
numperiods = 8;
[FY3,Forecastmse1]=forecast(EstMd3,numperiods,A4(1:96,:));

YS5 =[nan(8,1) nan(8,1) nan(8,1) nan(8,1) nan(8,1) nan(8,1)];

YY4 = simulate(EstMd3, size(YS5,1), 'Y0', A4, 'YF', YS5, 'NumPaths', 1000); %normal trend


z4=YY4(:,6,1:1000)
z5=reshape(z4,[8 1000])

x6 = num2cell( A4(85:96,6))
x7 = num2cell( time2(89:100,:) );
x8= [x7 x6]
x9 = num2cell( z5)
x10 = num2cell( time2(101:108,:))
x11 = [x10 x9]

fanplot (x8, x11, 'FanFaceColor',[0 0.4470 0.7410;1 1 1],'ForecastMarker', ...
  'none', 'HistoricalMarker', 'none', 'HistoricalLineColor' , [0.8500 0.3250 0.0980],  ...
'HistoricalLineStyle', '-', 'HistoricalLineWidth', 3);




inpc_r4 = inpc_r(85:97) 
inpc_r4(13,:)= 3.6280

figure
h1 = plot(time2(89:101), inpc_r4,'linewidth',2, 'color',   [0.8500 0.3250 0.0980])
hold on 
 fanChart(time2(101:108), z5,  'mean', 10:10:90, ...
    'alpha', .5, 'colormap', {'shadesOfColor', [0 .3 .9]}) ;
set(gcf, 'color',  'w');
title('México: Pronóstico Inflación (2021-2022)', 'fontsize', 16)
%xlabel('Nota: Variación anual con datos de ajuste estacional');
box off
hold off



Yz2 = permute(squeeze(YY4(4,:,:)), [2 1]);
figure
histogram(Yz2(:,6), 'Normalization', 'pdf', 'FaceColor',[0 0.4470 0.7410] )
xlabel('Crecimiento Anual', 'fontsize', 13)
ylabel('Probabilidad', 'fontsize', 13);
set(gcf, 'color',  'w');
title('Densidad de la Inflación para 2021' , 'fontsize', 16)



ex_e1 = cbo.ex_e1;
ex_e1 =100*((ex_e1(5:108,:)./ex_e1(1:108-4,:))-1);
ex_e1(105:108) = NaN(4,1);
%wti_cbo1= cbo.wti_cbo1;
%wti_cbo1 =100*((wti_cbo1(5:108,:)./wti_cbo1(1:108-4,:))-1);
%wti_cbo1(105:108) = NaN(4,1);


% exchange rate increase and commoditie increase

i_rate_s(1:2,:) = i_rate(64:65) - i_rate(64:65)*.14;
i_rate_s(3:6,:)= i_rate(66:69) - i_rate(66:69)*.2;
i_rate_s(7:8,:) = i_rate(70:71) - i_rate(70:71)*.16;

ex_e2 = cbo.ex_e1;
ex_e2(101:108,:) = ex_e2(101:108) + ex_e2(101:108)*.06
%ex_e2 = cbo.ex_e1;
ex_e2(104:104,:) = ex_e2(104:104) + ex_e2(104:104)*.1
ex_e2 =100*((ex_e2(5:108,:)./ex_e2(1:108-4,:))-1);

food_1 = inflation.imf_food;
food_1(101:101,:) = food_1(92:92) + food_1(92:92)*.9;
food_1(102:108,:) = food_1(94:100) + food_1(94:100)*.9;
foodr_1 =100*((food_1(5:108,:)./food_1(1:108-4,:))-1);

% --- Conditional forecast
%A4 = [pp_r(1:96) ex_r(1:96) food_r(1:96) i_rate(5:100) gdp_r(1:96) inpc_r(1:96)];
YS4 =[wti_r(97:104) ex_e1(97:104) nan(8,1) i_rate_s FY_2(:,7) nan(8,1)]; %escenario central 
 
YS6 =[nan(8,1) nan(8,1) nan(8,1) i_rate_s FY_2(:,7) nan(8,1)]; %escenario 1
YS7 =[wti_r2(97:104) ex_e2(97:104) nan(8,1) i_rate_s   FY_2(:,7) nan(8,1)];  % escenario 2
YS8 =[wti2_r_1(97:104) ex_e2(97:104) nan(8,1) i_rate_s FY_2(:,7) nan(8,1)]; %escenario central


FY_4 = forecast(EstMd3,8,A4,'YF',YS4); %escenario central
FY_5 = forecast(EstMd3,8,A4,'YF',YS6); %escenario 2
FY_6 = forecast(EstMd3,8,A4,'YF',YS7); %escenario 2
FY_7 = forecast(EstMd3,8,A4,'YF',YS8); %escenario 2
%scenario 1: oil prices fall and exchange rate increase
%scemario 2 : oil prices rise and exchange rate drops 
%scenario 3: interest rate fall below 3.5% in the second half of 2021

YY5 = simulate(EstMd3, size(YS4,1), 'Y0', A4, 'YF', YS8, 'NumPaths', 1000); %escenario central 

%YY5 = simulate(EstMd3, size(YS5,1), 'Y0', A4, 'YF', YS5, 'NumPaths', 1000) % scenario 2, oil prices and exchange rate 

% wti > 60 usd and excgange rate below < 19


z4=YY5(:,6,1:1000)
z5=reshape(z4,[8 1000])

x6 = num2cell( A4(85:96,6))
x7 = num2cell( time2(89:100,:) );
x8= [x7 x6]
x9 = num2cell( z5)
x10 = num2cell( time2(101:108,:))
x11 = [x10 x9]

fanplot (x8, x11, 'FanFaceColor',[0 0.4470 0.7410;1 1 1],'ForecastMarker', ...
  'none', 'HistoricalMarker', 'none', 'HistoricalLineColor' , [0.8500 0.3250 0.0980],  ...
'HistoricalLineStyle', '-', 'HistoricalLineWidth', 3);


inpc_r4 = inpc_r(85:97) 
inpc_r4(13,:)= 3.6280

figure
h1 = plot(time2(89:101), inpc_r4,'linewidth',2, 'color',   [0.8500 0.3250 0.0980])
hold on 
 fanChart(time2(101:108), z5,  'mean', 10:10:90, ...
    'alpha', .5, 'colormap', {'shadesOfColor', [0 .3 .9]}) ;
set(gcf, 'color',  'w');
title('México: Pronóstico Inflación (2021-2022)', 'fontsize', 16)
%xlabel('Nota: Variación anual con datos de ajuste estacional');
box off
hold off

YY5 = simulate(EstMd3, size(YS4,1), 'Y0', A4, 'YF', YS8, 'NumPaths', 1000); %escenario central 


Yz3 = permute(squeeze(YY5(4,:,:)), [2 1]);
figure
histogram(Yz3(:,6), 'Normalization', 'pdf', 'FaceColor',[0 0.4470 0.7410] )
xlabel('Crecimiento Anual', 'fontsize', 13)
ylabel('Probabilidad', 'fontsize', 13);
set(gcf, 'color',  'w');
title('Densidad de la Inflación para 2021' , 'fontsize', 16)

YY5 = simulate(EstMd3, size(YS4,1), 'Y0', A4, 'YF', YS4, 'NumPaths', 1000); %escenario central 

Yz3 = permute(squeeze(YY5(4,:,:)), [2 1]);
figure
histogram(Yz3(:,6), 'Normalization', 'pdf', 'FaceColor',[0 0.4470 0.7410] )
xlabel('Headline Inflation (Annual)', 'fontsize', 13)
ylabel('Probability', 'fontsize', 13);
set(gcf, 'color',  'w');
title('2021 Density of Headline Inflation' , 'fontsize', 16)



%//////////////--- Counterfactual (sub-sample sensitivity analysis)
 % Sensitivity analysis, compare the estimation results obtained from two
 % distinct subsamples. 
 %Examine the response of a model fitted to data over one period to shocks
 %derived from a model fitted over another. 
 
 %-/  Inflation counterfactual (international oil prices-fiscal stimulus)
 
 % Note: Since 2017m1 the gasolines prices are free and should follow the
 % international prices from Texas' refineries. 
 
%-------------- Time format 
time1 = (1996+0/12:1/12:2021+2/12)';
%time1 = time1(1:100,:);

%------------- Data transformation
load ('infla_c');
load ('gasoline_p');
[Tc,~]=size(infla_c); 
[Tc1,~]=size(gasoline_p); 


inpc_m    = infla_c.inpc;
igae_m    = infla_c.igae;
ex_r_m    = infla_c.ex_r;
i_rate_m  = infla_c.i_rate;
mag_ga    = infla_c.mag_gasoline;
coun_1    = infla_c.counter1;
coun_2    = infla_c.counter2;
g_ref     = infla_c.g_refineria;


r_g = gasoline_p.r_gasoline;
h_g = gasoline_p.h_gasoline;
g_r = gasoline_p.g_refineria;
g_u = gasoline_p.g_usa;
 
inpc_mr = 100*((inpc_m(2:Tc,:)./inpc_m(1:Tc-1,:))-1);
igae_mr = 100*((igae_m(2:Tc,:)./igae_m(1:Tc-1,:))-1);
ex_r_mr = 100*((ex_r_m(2:Tc,:)./ex_r_m(1:Tc-1,:))-1);
rate_mr = 100*((i_rate_m(2:Tc,:)./i_rate_m(1:Tc-1,:))-1);
magn_mr = 100*((mag_ga(2:Tc,:)./mag_ga(1:Tc-1,:))-1);
con1_mr = 100*((coun_1(2:Tc,:)./coun_1(1:Tc-1,:))-1);
con2_mr = 100*((coun_2(2:Tc,:)./coun_2(1:Tc-1,:))-1);
g_ref_r = 100*((g_ref(2:Tc,:)./g_ref(1:Tc-1,:))-1);


r_g_r = 100*((r_g(2:Tc1,:)./r_g(1:Tc1-1,:))-1); % given this the series will start in 2017m2
h_g_r = 100*((h_g(2:Tc1,:)./h_g(1:Tc1-1,:))-1); 
g_r_r = 100*((g_r(2:Tc1,:)./g_r(1:Tc1-1,:))-1);
g_u_r = 100*((g_u(2:Tc1,:)./g_u(1:Tc1-1,:))-1);


idxCom = 1:Tc-3 %From Aug 2002 to Dec 2020 (321)
idxPre = 1:12; %(From Aug 2002 to Aug 2003)
idxEst = Tc-111:Tc-63 %(From Aug 2003 to Dec 2015)
[tz,~] = size(igae_mr(1:Tc-3))
idxEst2 = Tc+1-51:Tc-3 %From Jan 2017 to DEc 2020
 
%--1--First estimation Exogenous estimation 

Ac_inf = [ i_rate_m(2:end) ex_r_mr igae_mr inpc_mr ] ;
%Ac_inf(253:301,5) = [r_g_r] ;

Xc_in = nan(301,1);
Xc_in(253:301) = [g_r_r]; 

% Model Counterfactial experiment (complete data set)

numseries=4;
seriesnam={'i_rate','ex','gdp_r','infla'};
Mdl_c=varm(numseries,3);
Mdl_c.SeriesNames=seriesnam;

[EstMdl,~,~,Ec1]= estimate(Mdl_c,Ac_inf,'X',Xc_in); %exogenous variable
%XLAG = lagmatrix(Xc_in,[0:4])


%Gasoline price liberation data ( a 3% control variable)

Xc_an = nan(301,1);
Xc_an(253:301) = [r_g_r]; 

[EstMd2,~,~,Ec2]= estimate(Mdl_c,Ac_inf,'X',Xc_an); % 

% Filtering 

YYc = filter(EstMd2, Ec1, 'Y0', Ac_inf , 'Scale', false);  
YYo = inpc_mr (256:299,:)

%--1.1----Endogenous 


%-------- Endogenous estimation: counterfactual experiment 
% ---- Mex real gasoline vs wholesale refinery gasoline price (From Aug
% 2002 to Dec 2020)
Ab1_inf = [magn_mr(114:Tc-61) i_rate_m(114:161) ex_r_mr(114:Tc-61) igae_mr(114:Tc-61) inpc_mr(114:Tc-61) ] ;
Ab2_inf = [g_ref_r(Tc-51:end) i_rate_m(Tc-50:end) ex_r_mr(Tc-51:end) igae_mr(Tc-51:end) inpc_mr(Tc-51:end)] ;

Ac1_inf = [ i_rate_m(114:161) ex_r_mr(114:Tc-61) igae_mr(114:Tc-61) inpc_mr(114:Tc-61) ] ;
Ac2_inf = [ i_rate_m(Tc-50:end) ex_r_mr(Tc-51:end) igae_mr(Tc-51:end) inpc_mr(Tc-51:end)] ;

X_b1 = magn_mr(114:Tc-61)
X_b2 = g_ref_r(Tc-51:end)


numseries=4;
seriesnam={'i_rate','ex','gdp_r','infla'};
Mdl_c=varm(numseries,2);
Mdl_c.SeriesNames=seriesnam;
[EstMdl,~,~,Ec1]= estimate(Mdl_c,Ac1_inf, 'X',Xc_in); %Agu 2002 to Dec 2015
[EstMd2,~,~,Ec2]= estimate(Mdl_c,Ac2_inf, 'X',Xc_in); % 2017 to 2020
% Filtering 
Yc1 = filter(EstMd2, Ec1, 'Y0', Ac2_inf(1:EstMd2.P,:) , 'Scale', false);  %simulated values
Yi1 = Ac2_inf((EstMd2.P + 1):(size(Ec1,1) + EstMd2.P),:); % Extracting relevant information comparacion from the real data

%///////-----Endogenous: Magna Gasoline vs Magna Gasoline  (from Aug 2002 to Dec 2015) 

idxCom = 1:Tc-3 %From Aug 2002 to Dec 2020 (321)
idxPre = 1:12; %(From Aug 2002 to Aug 2003)
idxEst = Tc-111:Tc-63 %(From Aug 2003 to Dec 2015)
[tz,~] = size(igae_mr(1:Tc-3))
idxEst2 = Tc+1-51:Tc-3 %From Jan 2017 to DEc 2020
Bc1_inf = [magn_mr(114:Tc-61) i_rate_m(114:161) ex_r_mr(114:Tc-61) igae_mr(114:Tc-61) inpc_mr(114:Tc-61) ] ; 
Bc2_inf = [magn_mr(Tc-51:end) i_rate_m(Tc-50:end) ex_r_mr(Tc-51:end) igae_mr(Tc-51:end) inpc_mr(Tc-51:end) ] ; 

Bb1_inf = [ i_rate_m(114:161) ex_r_mr(114:Tc-61) igae_mr(114:Tc-61) inpc_mr(114:Tc-61)] ; 
Bb2_inf = [ i_rate_m(Tc-50:end) ex_r_mr(Tc-51:end) igae_mr(Tc-51:end) inpc_mr(Tc-51:end)] ; 

X_b1 = magn_mr(114:Tc-61);
X_b2 = magn_mr(Tc-51:end);

numseries=5;
seriesnam={'gas','i_rate','ex','gdp_r','infla'};
fit1_c=varm(numseries,2);
fit1_c.SeriesNames=seriesnam;
[f1,~,~,err1]= estimate(fit1_c,Bc1_inf);
%-- Gasoline liberation policy
[f2,~,~,err2]= estimate(fit1_c,Bc2_inf); 

YYc1 = filter(f2, err1, 'Y0', Bc2_inf(1:f2.P,:) , 'Scale', false);  %simulated values
YYi1 = Bc2_inf((f2.P + 1):(size(err1,1) + f2.P),:); % Extracting relevant information 
 

%---Magna Gasoline Mex vs  Counter2 (3% increase along the series)

%----Endogenous 
Cc1_inf = [magn_mr(114:Tc-61) i_rate_m(114:161) ex_r_mr(114:Tc-61) igae_mr(114:Tc-61) inpc_mr(114:Tc-61) ] ;
Cc2_inf = [con2_mr(Tc-51:end) i_rate_m(Tc-50:end) ex_r_mr(Tc-51:end) igae_mr(Tc-51:end) inpc_mr(Tc-51:end)] ;

Cb1_inf = [i_rate_m(114:161) ex_r_mr(114:Tc-61) igae_mr(114:Tc-61) inpc_mr(114:Tc-61) ] ;
Cb2_inf = [i_rate_m(Tc-50:end) ex_r_mr(Tc-51:end) igae_mr(Tc-51:end) inpc_mr(Tc-51:end)] ;
X_b1 = magn_mr(114:Tc-61);
X_b2 = con2_mr(Tc-50:end);
numseries=5;
seriesnam={'gas','i_rate','ex','gdp_r','infla'};
fit1_c=varm(numseries,2);
fit1_c.SeriesNames=seriesnam;
[f1,~,~,err1]= estimate(fit1_c,Cc1_inf);
%-- Gasoline liberation policy
[f2,~,~,err2]= estimate(fit1_c,Cc2_inf); 

YYc1 = filter(f2, err1, 'Y0', Cc2_inf(1:f2.P,:) , 'Scale', false);  %simulated values
YYi1 = Cc2_inf((f2.P + 1):(size(err1,1) + f2.P),:); % Extracting relevant information


%---Magna Gasoline Mex vs  USA gasoline (3% increase along the series)

%----Endogenous 
Cc1_inf = [magn_mr(114:Tc-61) i_rate_m(114:161) ex_r_mr(114:Tc-61) igae_mr(114:Tc-61) inpc_mr(114:Tc-61) ] ;
Cc2_inf = [con2_mr(Tc-51:end) i_rate_m(Tc-50:end) ex_r_mr(Tc-51:end) igae_mr(Tc-51:end) inpc_mr(Tc-51:end)] ;

Cb1_inf = [i_rate_m(114:161) ex_r_mr(114:Tc-61) igae_mr(114:Tc-61) inpc_mr(114:Tc-61) ] ;
Cb2_inf = [i_rate_m(Tc-50:end) ex_r_mr(Tc-51:end) igae_mr(Tc-51:end) inpc_mr(Tc-51:end)] ;
X_b1 = magn_mr(114:Tc-61);
X_b2 = con2_mr(Tc-50:end);
numseries=5;
seriesnam={'gas','i_rate','ex','gdp_r','infla'};
fit1_c=varm(numseries,2);
fit1_c.SeriesNames=seriesnam;
[f1,~,~,err1]= estimate(fit1_c,Cc1_inf);
%-- Gasoline liberation policy
[f2,~,~,err2]= estimate(fit1_c,Cc2_inf); 

YYc1 = filter(f2, err1, 'Y0', Cc2_inf(1:f2.P,:) , 'Scale', false);  %simulated values
YYi1 = Cc2_inf((f2.P + 1):(size(err1,1) + f2.P),:); % Extracting relevant information





 %////////Counterfactual GDP (Elections stimulus shock)









