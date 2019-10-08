% XOR BGSA
% Modified by M. Ahmadieh Khanesar as per paper: 
% "	Mojtaba Ahmadieh Khanesar, David Branson,
%“ 'XOR Binary Gravitational Search Algorithm', IEEE conference on System
%Man Cybernetics, 2019, Bari, Italy

% Adapted from original version of BGSA by Esmat Rashedi et al.
% available at https://uk.mathworks.com/matlabcentral/fileexchange/47112-binary-gravitational-search-algorithm-bgsa-zip

function a=BGfield(M,X,G,Rpower,ElitistCheck,iteration,max_it)

[N,dim]=size(X);
final_per=2; 

if ElitistCheck==1
    kbest=final_per+(1-iteration/max_it)*(100-final_per); 
    kbest=round(N*kbest/100);
else
    kbest=N;
end
[Ms ds]=sort(M,'descend');

for i=1:N
    E(i,:)=zeros(1,dim);
    for ii=1:kbest
        j=ds(ii);
        if j~=i
            R=sum(abs(X(i,:)~=X(j,:))); R=R/dim; 
            for k=1:dim
                E(i,k)=E(i,k)+rand*(M(j))*(xor1((X(j,k)-X(i,k)))/(R^Rpower+1/dim));
            end
        end
    end
end

a=E.*G; 