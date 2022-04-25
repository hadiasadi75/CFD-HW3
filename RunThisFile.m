clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin=0;
xmax=1;
t0=0;
tf=1;
n=15;
nt=n+1;
nReng=[1,2,4,8,16,32,64].*(nt-1)+1;
m=15;
mx=m+1;
mReng=[1,2,4,8,16,32,64].*(mx-1)+1;
a=0.5;
x_exact = 0.25+a*tf ;
fig = uifigure;

selection = uiconfirm(fig,'select method:','Hw3',...
           'Options',{'upwind' ,'Lax','Lax-Wendroff','Maccormack'},...
           'DefaultOption',2,'CancelOption',3);
       
switch selection
    case 'upwind'
        [x,u_exact1,u1,err1,ta1,error1,h1]=Upwindd(nReng,mReng,tf,xmax,a,x_exact);
     
        slop=(log(max(error1))-log(min(error1)))/((log(max(h1))-(log(min(h1)))));
        figure;
        loglog(ta1,err1,'or','LineWidth',3);
        xlabel('dt');
        ylabel('error');
        figure
        loglog(h1,error1,'or','LineWidth',3);
        xlabel('h');
        ylabel('error');
        figure;
        plot(x,u1(:,end),'.','LineWidth',10);
        hold on
        plot(x,u_exact1,'k');
        xlabel('X-Coordinate [-]');
        ylabel('U-state [-]'); ylim([-1.5,1.5]);
        title 'Upwind'; 

    case 'Lax'
        [x,u_exact2,u2,err2,ta2,error2,h2]=Lax(nReng,mReng,tf,xmax,a,x_exact);
        slop=(log(max(error2))-log(min(error2)))/((log(max(h2))-(log(min(h2)))));
             figure;
        loglog(ta2,err2,'or','LineWidth',3);
        xlabel('dt');
        ylabel('error');
        figure
        loglog(h2,error2,'or','LineWidth',3);
        xlabel('h');
        ylabel('error');
        figure;
        plot(x,u2(:,end),'.','LineWidth',10);
        hold on
        plot(x,u_exact2,'k');
        xlabel('X-Coordinate [-]');
        ylabel('U-state [-]'); ylim([-1.5,1.5]);
        title 'Lax'; 

    case 'Lax-Wendroff'
       [x,u_exact3,u3,err3,ta3,error3,h3]=Lax_W(nReng,mReng,tf,xmax,a,x_exact);
       slop=(log(max(error3))-log(min(error3)))/((log(max(h3))-(log(min(h3)))));
         figure;
        loglog(ta3,err3,'or','LineWidth',3);
        xlabel('dt');
        ylabel('error');
        figure
        loglog(h3,error3,'or','LineWidth',3);
        xlabel('h');
        ylabel('error');
        figure;
        plot(x,u3(:,end),'.','LineWidth',10);
        hold on
        plot(x,u_exact3,'k');
        xlabel('X-Coordinate [-]');
        ylabel('U-state [-]'); ylim([-1.5,1.5]);
        title 'Lax-Wendroff'; 
    otherwise
       [x,u_exact4,u4,err4,ta4,error4,h4]=Maccormack(nReng,mReng,tf,xmax,a,x_exact);
       slop=(log(max(error4))-log(min(error4)))/((log(max(h4))-(log(min(h4)))));
         figure;
        loglog(ta4,err4,'or','LineWidth',3);
         xlabel('dt');
        ylabel('error');
        figure
        loglog(h4,error4,'or','LineWidth',3);
        xlabel('h');
        ylabel('error');
        figure;
        plot(x,u4(:,end),'.','LineWidth',10);
        hold on
        plot(x,u_exact4,'k');
        xlabel('X-Coordinate [-]');
        ylabel('U-state [-]'); ylim([-1.5,1.5]);
        title 'Maccormack'; 
end



