function [u_exact,u]=lax1(x,mx,nt,nu,x_exact)
A=coff(nu,mx);
u(:,1)=initial_c(mx);
for j=1:nt-1

u(:,j+1)= A * u(:,j) ; 

end
u_exact = zeros(1,mx);
for j = 1:mx
    if x(j) <= x_exact
    u_exact(j) = 1;
    else
    u_exact(j) = 0;
    end
end
end 
function [A]=coff(nu,mx)
A=sparse([],[],[],mx,mx); 
A(1,1)=1;
for i=2:mx-1 
    A(i,i+1)=0.5*(1-nu) ;
    A(i,i-1)=0.5*(1+ nu);
   
end
end
function u0=initial_c(mx)
u0=zeros(mx,1);
for i=1:(mx)
    if i<round((mx)/4)
        u0(i,1)=1.;
    else
        u0(i,1)=0.;
    end
end
end