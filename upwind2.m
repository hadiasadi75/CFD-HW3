function [u_exact,u]=upwind2(x,mx,nt,nu)
A=coff1(nu,mx);
u(:,1)=initial_c1(x);
u_exact=sin(4*pi*x);
for j=1:(nt-1) 
    u(:,j+1)= A * u(:,j) ; 
    u(1,j+1)=u(1,j)-nu*(u(1,j)-u(end,j));
 
end

end 
function [A]=coff1(nu,mx)
A=sparse([],[],[],mx,mx); 
A(1,1)=0;
for i=2:mx  
    A(i,i)= 1-nu ;
    A(i,i-1)= nu;
   
end
end
function u0=initial_c1(x)

u0=sin(4*pi*(x));
end
