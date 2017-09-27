%_____________________________________________________________________

clear all
close all

%_________________________Reading Data__________________________

data = xlsread('DataTestRevb.xlsx','Quarterly','b11:bk214');
code = xlsread('DataTestRevb.xlsx','Quarterly','b5:bk5');

datalevel = data(2:end,:);

for o = 1:length(code);
 if code(o) == 2
     datalevel(:,o) = log(data(2:end,o));

elseif code(o) == 3
     datalevel(:,o) = diff(data(:,o));
 end
end

%__________________Principal Components Estimation__________________

r=100; t=100;
maxnpc = 6;
pc = principalcomponents(standardize(datalevel),maxnpc);


%_______________________________VAR3_________________________________


%VAR3 is a bivariate system. TFPadjusted at the first place 
%and 5year michigan index survey expectation next

var3 = [datalevel(:,62) datalevel(:,55)];

%_________________________Best Number of Lags with AICBIC__________________________

for i = 1:6

k3(i) = aicbic([var3 pc(:,1:i)],4);

end

k0 = aicbic(var3,8);

%_________________________VAR3 Estimation___________________________


[irf, chi, sh] = FAVARCholImp(var3, var3, 1:2, k0, 40);
irfboot = FAVARCholBoot(var3, var3, 1:2, k0, 40, 500);
cumirf = CumImp(irf, [0 0]);
cumirfboot = CumImp(irfboot, [0 0]);


%__________________________VAR3 Plots__________________________
 

DoPlotsBis(cumirf,cumirfboot,2,1,2);



