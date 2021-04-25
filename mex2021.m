% Macroeconomic forecast, scenario generation, fan chart, forecast probability and counterfactual analysis
clear;
clc;
close all;

load ('');
load ('');
load ('');
%-------------- Time format 1 (Quaterly Frecuency)
t1 = datetime(1996,3,31);
t2 = datetime(2022,12,31);
t = (t1 + calquarters(0:25*4))';
t = t(1:100,:);
t_2 = (t1 + calquarters(0:27*4))';  
t_2 = t_2(1:108,:);

%-------------- Time format 2 (Quarterly Frecuency)
time1 = (1996+0/4:1/4:2020+4/4)';
time1 = time1(1:100,:);
time2 = (1996+0/4:1/4:2022+4/4)';
time2 = time2(1:108,:);

%------------- Data transformation
[T,~]=size(###); % Choose a data base

 
 ###= log(###);

###=100*((###(5:T,:)./###(1:T-4,:))-1); % Change it for the variables lables (Year to Year growth rate)

###=100*((###(2:T,:)./###(1:T-1,:))-1); %  Change it for the variables lables (Quarter to Quarter growth rate)

%%-----------------------------------%
%------------ VAR model -------------%
%------------------------------------%

% Generating the Data A Matrix od the data base matrix 

### = [###(##:##) ###(##:##) ....]; %Change it for the variables

# This approach also can work for structural analysis if it is arranged from the most exogenous variables to the most endogenous variable

numseries= #; # Number of variables of the model 
seriesnam={'###','##', ....}; #Lables of the varoables 
VAR=varm(numseries,#); % the lag order
VAR.SeriesNames=seriesnam;
[EstMdl,E1]= estimate(VAR, ##(##:##,:),'Y0',##(##:##,:));
results=summarize(EstMdl);  
np=results.NumEstimatedParameters;
numperiods = #;  % Forecast periods
[FY1,Forecastmse1]=forecast(EstMdl,numperiods,##(##:##:));

%%----------------------------------------------------------------%
%--------- Conditional forecast and conditional scenario ---------%
%-----------------------------------------------------------------%

% Conditional analysis is closely related to stress testing. Specifically, values of a subset of variables are specified in advance, 
% often subjected to adverse conditions or extreme values, in an attempt to assess the effects on the remaining variables during 
% periods of economic crisis.

% The aim of of forecast scenario is to asess the sensitivity of reduce-form VAR-Forecast to hypothetical future events. 
% Forecast scenarios are not designed to characterize the most likely outcomes given past observations, but to characterize the risk assosiated with unlikely possible 
% outcomes in the future in the form of a hypothetical "What-If" question. 
% The sensitivity of a forecast to alternative assumtions about future structural shocks or observables may be captured by probability-weighted conditional forecast densities
% and summarized by formal risk measures. Also, risk analysis along the above lines allowes users of VAR-forecast models to explore by how much and at what forecast horizon 
% downside and upside risks change as a function of the probability weights attached to different scenarios. 


YS  = [###(##:##) ... ... nan(##,1) ... ##(##,1) ...nan(##,##)];

FY_2 = forecast(EstMdl,#,###(##:##,:),'YF',YS);



%-------------------Fan chart---------------------%

% Running the simulation 
rng default
YY = simulate(EstMdl, size(YS2,1), 'Y0', ##, 'YF', YS, 'NumPaths', 1000);

% Re-shaping
z=YY(:,#,1:1000)
z1=reshape(z,[# 1000])
x1 = { time2(##:##,:) ##(##:##,#) };
x2 = { time2(##:##,:) z1 };
x1 = num2cell( ##(##:##,#))
x2 = num2cell( time2(##:##,:) );
x3= [x2 x1]
x4 = num2cell( z1)
x5 = num2cell( time2(##:##,:))
x6 = [x5 x4]

fanplot (x3, x6, 'FanFaceColor',[0 0.4470 0.7410;1 1 1],'ForecastMarker', ...
  'none', 'HistoricalMarker', 'none', 'HistoricalLineColor' , [0.8500 0.3250 0.0980],  ...
  'HistoricalLineStyle', '-', 'HistoricalLineWidth', 3);

%-------Probability Density Function (Forecast)


Yz = permute(squeeze(YY(#,:,:)), [2 1]); #Change it for the number of periods to squeeze
figure
histogram(Yz(:,#), 'Normalization', 'pdf', 'FaceColor',[0 0.4470 0.7410] )
xlabel('#####', 'fontsize', 13)
ylabel('####', 'fontsize', 13);
set(gcf, 'color',  'w');
title('#####' , 'fontsize', 16)

%%-----------------------------------------------------------------------------------------%
%------------------- Counterfactual (sub-sample sensitivity analysis) ---------------------%
%------------------------------------------------------------------------------------------%

 % Sensitivity analysis, compare the estimation results obtained from two
 % distinct subsamples. 
 % Examine the response of a model fitted to data over one period to shocks
 % derived from a model fitted over another. 
 
 % The counterfactual series (or simulated series)  indicates how the variable of interest would have evolved, had one been able to replace all realizations 
 % of shock j by zero,
 % while preserving teh remaining structural shock in the model. The vertical distnace between the actual series and the counterfactual tells us how shock j 
 % affected the observed 
 % observed (past) information at this point in time. 
 
 % A counterfactual refers to a simulation of the path of the model variables under diffrent sequence of structural shocks than observed in thej actual data. 

% For this experiment two estimation sample must be choosen, and it must be assosiated to economic events of or policy changing over the variables. 

% Note: The second Sample must be bigger than the fisrt one. 
 
%-------------- Time format 

time1 = (1996+0/12:1/12:2021+2/12)';

% Endogenous experiment simulation set

Ab1_inf = [###(##:##) ... ... ...] ; % Pre-sample period ( Fist sample)
Ab2_inf = [###(##:##) ... ... ...] ; % Post-sample perios (Second Sample) 

% Exogenous experiment simulation set

Ac1_inf = [ ###(##:##) ... ...] ;  % Pre-sample period ( Fist sample)
Ac2_inf = [ ###(##:##) ... ...] ; % Post-sample perios (Second Sample) 

X_b1 = ###(##:##)
X_b2 = ####(##:##)

numseries=#;
seriesnam={'####','####' ... ....};
Mdl_c=varm(numseries,#);
Mdl_c.SeriesNames=seriesnam;

% Endogenous estimation

[EstMdl,~,~,Ec1]= estimate(Mdl_c,Ab1_inf);
[EstMd2,~,~,Ec2]= estimate(Mdl_c,Ab2_inf);

% Exogenous estimation 

[EstMd3,~,~,Ec3]= estimate(Mdl_c,Ac1_inf, 'X',X_b1);
[EstMd4,~,~,Ec4]= estimate(Mdl_c,Ac2_inf, 'X',X_b2);

% Filtering exogenous

Yc1 = filter(EstMd2, Ec1, 'Y0', Ab2_inf(1:EstMd2.P,:) , 'Scale', false);  % Computing the Simulated values
Yi1 = Ab2_inf((EstMd2.P + 1):(size(Ec1,1) + EstMd2.P),:); % Extracting relevant information, comparation from the observed data

% Filtering endogenous

Yc2 = filter(EstMd4, Ec3, 'Y0', Ac2_inf(1:EstMd4.P,:) , 'Scale', false);  %Computing the Simulated values
Yi2 = Ac2_inf((EstMd4.P + 1):(size(Ec3,1) + EstMd4.P),:); % Extracting relevant information comparation from the observed data











