clc;clear;close all
% access the SSVEP performances in different window length
lowstimNo=[7.06 	7.50 	8.00 	8.57 	9.23 	10.00 	10.91 	12.00 	13.33 	15.00];
highstimNo=17:2:35;
winlen=4;
% accuracy in different window length:1s,2s,3s,4s
load('accuracyCOM_low_before.mat');
load('accuracyCOM_low_after.mat');
load('SNRCOM_low_before.mat');
load('SNRCOM_low_after.mat');
load('accuracyCOM_high_before.mat');
load('accuracyCOM_high_after.mat');
load('SNRCOM_high_before.mat');
load('SNRCOM_high_after.mat');

figure(1) % accuracy
% refline
for timelen=1:winlen % second
    for nbexp=1:2 % 1 for low; 2 for high
        subplot(2,winlen,4*(nbexp-1)+timelen)
        if (4*(nbexp-1)+timelen)==1
            text(0.02,0.7,'paired-T: p <0.05','units','normalized')
        end
        
        x1 = [0 1];
        y1 = [0 1];
        pl = line(x1,y1);
        pl.Color = 'black';
        pl.LineWidth=2;
        hold on
        switch nbexp
            case 1
                scatter (accuracyCOM_low_before(:,timelen),accuracyCOM_low_after(:,timelen),'filled' )
                text(0.125,0.875,[num2str(round(length(find(accuracyCOM_low_after(:,timelen)>accuracyCOM_low_before(:,timelen)))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',12)
                text(0.7,0.125,[num2str(round(length(find(accuracyCOM_low_after(:,timelen)<accuracyCOM_low_before(:,timelen)))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',12)
                xlabel('Low-rate SSVEP 1','fontsize',12)
                ylabel('Low-rate SSVEP 2','fontsize',12)
                title(['Win. Length = ', num2str(timelen),'.0s'],'fontsize',10)
                hold off
            case 2
                scatter (accuracyCOM_high_before(:,timelen),accuracyCOM_high_after(:,timelen),'filled' )
                text(0.125,0.875,[num2str(round(length(find(accuracyCOM_high_after(:,timelen)>accuracyCOM_high_before(:,timelen)))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',12)
                text(0.7,0.125,[num2str(round(length(find(accuracyCOM_high_after(:,timelen)<accuracyCOM_high_before(:,timelen)))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',12)
                xlabel('High-rate SSVEP 1','fontsize',12)
                ylabel('High-rate SSVEP 2','fontsize',12)
                title(['Win. Length = ', num2str(timelen),'.0s'],'fontsize',10)
                hold off
        end
    end
end

figure(2) % SNR
for timelen=1:winlen % second
    for nbexp=1:2 % 1 for low; 2 for high
        subplot(2,winlen,4*(nbexp-1)+timelen)
        if (4*(nbexp-1)+timelen)==1
            text(0.02,0.7,'paired-T: p <0.001','units','normalized')
        end
        if (4*(nbexp-1)+timelen)==2
            text(0.02,0.7,'paired-T: p <0.001','units','normalized')
        end
        if (4*(nbexp-1)+timelen)==3
            text(0.02,0.7,'paired-T: p <0.001','units','normalized')
        end
        if (4*(nbexp-1)+timelen)==4
            text(0.02,0.7,'paired-T: p <0.05','units','normalized')
        end
        
        switch nbexp
            case 1
                x1 = [0 4];
                y1 = [0 4];
                p1 = line(x1,y1);
                p1.Color = 'black';
                p1.LineWidth=2;
                hold on
                scatter (SNRCOM_low_before(:,timelen),SNRCOM_low_after(:,timelen),'filled' )
                text(0.125,0.875,[num2str(round(length(find(SNRCOM_low_after(:,timelen)>SNRCOM_low_before(:,timelen)))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',12)
                text(0.7,0.125,[num2str(round(length(find(SNRCOM_low_after(:,timelen)<SNRCOM_low_before(:,timelen)))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',12)
                xlabel('Low-rate SSVEP 1','fontsize',12)
                ylabel('Low-rate SSVEP 2','fontsize',12)
                xlim = [0 4];
                ylim = [0 4];
                title(['Win. Length = ', num2str(timelen),'.0s'],'fontsize',10)
                hold off
            case 2
                x2 = [0 4];
                y2 = [0 4];
                p2 = line(x2,y2);
                p2.Color = 'black';
                p2.LineWidth=2;
                hold on
                scatter (SNRCOM_high_before(:,timelen),SNRCOM_high_after(:,timelen),'filled' )
                text(0.125,0.875,[num2str(round(length(find(SNRCOM_high_after(:,timelen)>SNRCOM_high_before(:,timelen)))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',12)
                text(0.7,0.125,[num2str(round(length(find(SNRCOM_high_after(:,timelen)<SNRCOM_high_before(:,timelen)))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',12)
                xlabel('High-rate SSVEP 1','fontsize',12)
                ylabel('High-rate SSVEP 2','fontsize',12)
                xlim = [0 4];
                ylim = [0 4];
                title(['Win. Length = ', num2str(timelen),'.0s'],'fontsize',10)
                hold off
        end
    end
end
% ax2=subplot(2,2,2)
% x2 = [1 1.8];
% y2 = [1 1.8];
% p2 = line(x2,y2);
% p2.Color = 'black';
% p2.LineWidth=2;
% hold on
% scatter(low_bef_snr,low_aft_snr,'filled' )
% text(0.125,0.875,[num2str(round(length(find(low_aft_snr>low_bef_snr))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',14)
% text(0.7,0.125,[num2str(round(length(find(low_aft_snr<low_bef_snr))/14,1)*100),'%'],'Units','Normalized','Color','r','fontsize',14)
% xlabel('SNR(%) of SSVEP 1, low-rate ')
% ylabel('SNR(%) of SSVEP 2, low-rate ')
% hold off
%
% ax3=subplot(2,2,3)
% x3 = [0 1];
% y3 = [0 1];
% p3 = line(x1,y1);
% p3.Color = 'black';
% p3.LineWidth=2;
% hold on
% scatter (high_bef_acc,high_aft_acc,'filled' )
% %text( 0.5,0.5,'Hi','Units','Normalized' )
% text(0.125,0.875,[num2str(round(length(find(high_aft_acc>high_bef_acc))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',14)
% text(0.7,0.125,[num2str(round(length(find(high_aft_acc<high_bef_acc))/14,1)*100),'%'],'Units','Normalized','Color','r','fontsize',14)
% xlabel('Accuracy(%) of SSVEP 1, high-rate ')
% ylabel('Accuracy(%) of SSVEP 2, high-rate ')
% hold off
%
% ax4=subplot(2,2,4)
% x4 = [1 1.8];
% y4 = [1 1.8];
% p4 = line(x4,y4);
% p4.Color = 'black';
% p4.LineWidth=2;
% hold on
% scatter (high_bef_snr,high_aft_snr,'filled' )
% text(0.125,0.875,[num2str(round(length(find(high_aft_snr>high_bef_snr))/14,4)*100),'%'],'Units','Normalized','Color','r','fontsize',14)
% text(0.7,0.125,[num2str(round(length(find(high_aft_snr<high_bef_snr))/14,1)*100),'%'],'Units','Normalized','Color','r','fontsize',14)
% xlabel('SNR of SSVEP 1, high-rate ')
% ylabel('SNR of SSVEP 2, high-rate ')
