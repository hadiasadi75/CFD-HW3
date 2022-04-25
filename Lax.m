function [x,u_exact,u,err,ta,error,h]=Lax(nReng,mReng,tf,xmax,a,x_exact)
answer=questdlg('select condition:','Initial conditon',...
    '1','2','3','1');

for i=1:numel(mReng)
    
    for j=1:numel(nReng)
        nt=nReng(j);  
        mx=mReng(i);
        dt=tf/(nt-1);
        dx=xmax/(mx-1);
        
        x  = 0:dx:xmax;
        t=0:dt:tf;
        
        nu=a*dt/dx;
switch answer
    case '1'
       [u_exact,u]=lax1(x,mx,nt,nu,x_exact);
    case '2'
        [u_exact,u]=lax2(x,mx,nt,nu);
    otherwise
       [u_exact,u]=lax3(x,mx,nt,nu,x_exact); 
end
 err(j)=sum(abs(u(:,j)'-u_exact))/nt;
 ta(j)=dt;
    end

   error(i)=sum(abs(u(:,end)'-u_exact))/mx;
   h(i)=dx;
end