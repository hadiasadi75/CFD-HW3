function [u_exact,u]=mac3(x,mx,nt,nu,x_exact)
A=coff2(nu,mx);
u(:,1)=initial_c2(mx,x);
for j=1:(nt-1) 

u(:,j+1)= A * u(:,j) ; 


end
u_exact = zeros(1,mx);
for j = 1:mx
    if x(j) < (x_exact-0.05)|| x(j) >= (x_exact+0.05)
    u_exact(j) = 0;
    else
    u_exact(j) = 1;
    end
end
end 
function [A]=coff2(nu,mx)
A=sparse([],[],[],mx,mx); 
A(1,1)=0;
for i=2:mx-1 
    A(i,i)=(1-nu^2) ;
    A(i,i+1)=0.5*(nu^2-nu) ;
    A(i,i-1)=0.5*(nu^2+ nu);
end
end
function u0=initial_c2(mx,x)
u0=zeros(mx,1);
for i=1:(mx)
    if x(i)<(0.2)|| ((0.3)<=x(i))
        u0(i,1)=0;
    else 
        u0(i,1)=1;
    end
end
end