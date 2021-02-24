% plot SSVEP SNR & accuracy, in 3s
% plot low
clc;close all; 
SNR_low=[...
    2.958 	2.451 	1.086 	1.836 	1.864 	1.688 	1.732 	1.482 	1.533 	1.473 	1.320 	1.277 	1.193;
    3.091 	2.594 	1.289 	2.054 	1.941 	1.695 	1.878 	1.622 	1.830 	1.404 	1.359 	1.569 	1.243 ];
accuracy_low=100*[...
    0.980 	0.980 	0.820 	0.800 	0.940 	0.800 	0.820 	0.600 	0.560 	0.340 	0.340 	0.720 	0.520;
    1.000 	1.000 	0.660 	0.980 	0.900 	0.840 	0.940 	0.760 	0.920 	0.280 	0.600 	0.440 	0.280];
SNR_high=[...
    1.467 	1.607 	1.770 	1.855 	1.325 	1.523 	1.554 	1.602 	1.345 	1.294 	1.063 	1.801 	2.385 	1.567;
    1.358 	1.289 	1.868 	1.546 	1.512 	1.448 	1.934 	1.343 	1.427 	1.276 	1.022 	1.907 	2.098 	1.397];
accuracy_high=100*[...
    0.720 	0.820 	0.680 	0.680 	0.660 	0.740 	0.700 	0.500 	0.640 	0.520 	0.540 	0.800 	0.820 	0.720;
    0.660 	0.660 	0.720 	0.900 	0.620 	0.720 	0.840 	0.640 	0.640 	0.340 	0.340 	0.780 	0.720 	0.700 ];

figure
subplot(1,2,1) % LOW relation;
scatter(SNR_low(1,:),accuracy_low(1,:),55)
xlim([0.5,3]);
hold on
b1=polyfit(SNR_low(1,:),accuracy_low(1,:),1);
x= 0.5:0.01:3;
y=polyval(b1,x);
plot(x,y,'r--','Linewidth',3)
ylim([30,100])
% calculate R squared
yy = polyval(b1, SNR_low(1,:));
OADbar= mean(accuracy_low(1,:));
SStot = sum((accuracy_low(1,:) - OADbar).^2);
SSreg = sum((yy - OADbar).^2);
SSres = sum((accuracy_low(1,:) - yy).^2);
R2 = 1 - SSres/SStot;
R = corrcoef(SNR_low(1,:),accuracy_low(1,:));
Rsq = R(1,2).^2;
text(2, 40,{['{\ity}=',num2str(round(b1(2),2)),'+',num2str(round(b1(1),2)),'{\itx}'];'{\itr}= 0.646';'{\itp}= 0.017'},'Fontsize',10,'Color','r')
set(gca,'linewidth',1,'fontsize',15,'fontname','Times');
hold off
%xlabel({'t(s)','a'});
xlabel({'SNR','(a)'},'Fontsize',15);
ylabel(['Accuracy (%)'],'Fontsize',15);
% title(['{\itr}= 0.646, {\itp}= 0.017'],'Fontsize',20)
box on;
% plot high
subplot(1,2,2) % LOW relation;
scatter(SNR_high(1,:),accuracy_high(1,:),55)
xlim([0.5,3]);
hold on
b2=polyfit(SNR_high(1,:),accuracy_high(1,:),1);
x= 0.5:0.01:3;
y=polyval(b2,x);
 plot(x,y,'r--','Linewidth',3)
ylim([30,100])
% calculate R squared
yy = polyval(b2, SNR_high(1,:));
OADbar= mean(accuracy_high(1,:));
SStot = sum((accuracy_high(1,:) - OADbar).^2);
SSreg = sum((yy - OADbar).^2);
SSres = sum((accuracy_high(1,:) - yy).^2);
R2 = 1 - SSres/SStot;
R = corrcoef(SNR_high(1,:),accuracy_high(1,:));
Rsq = R(1,2).^2;
% text(1, 40, ['R^2 = ',num2str(round(Rsq,2))],'Fontsize',15)
text(2, 40, {['{\ity}=',num2str(round(b2(2),2)),'+',num2str(round(b2(1),2)),'{\itx}'];'{\itr}= 0.616';'{\itp}= 0.019'},'Fontsize',10,'Color','r')
set(gca,'linewidth',1,'fontsize',15,'fontname','Times');
hold off
%xlabel({'t(s)','a'});
xlabel({'SNR','(b)'},'Fontsize',15);
ylabel(['Accuracy (%)'],'Fontsize',15);
% title(['{\itr}= 0.616, {\itp}= 0.019'],'Fontsize',20)
box on;