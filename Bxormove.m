% XOR BGSA
% Modified by M. Ahmadieh Khanesar as per paper: 
% "	Mojtaba Ahmadieh Khanesar, David Branson,
%“ 'XOR Binary Gravitational Search Algorithm', IEEE conference on System
%Man Cybernetics, 2019, Bari, Italy

% Adapted from original version of BGSA by Esmat Rashedi et al.
% available at https://uk.mathworks.com/matlabcentral/fileexchange/47112-binary-gravitational-search-algorithm-bgsa-zip

function [X,V]=Bxormove(X,a,V)

%movement.
[N,n]=size(X);

Vn=rand(N,n).*V+a;

temp=a.*V;

V=Vn;
Vmax=6;
for i=1:size(X,1)
    for j=1:size(X,2)
        if abs(V(i,j))>Vmax
            V(i,j)=Vmax*sign(V(i,j));
        end   
    end
end

S=0.5+0.5*tanh(V/2);
temp=rand(N,n)<S;
moving=find(temp==1);

X(moving)=~X(moving);   %eq. 14     