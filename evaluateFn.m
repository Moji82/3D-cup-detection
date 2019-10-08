% XOR BGSA
% Modified by M. Ahmadieh Khanesar as per paper: 
% "	Mojtaba Ahmadieh Khanesar, David Branson,
%“ 'XOR Binary Gravitational Search Algorithm', IEEE conference on System
%Man Cybernetics, 2019, Bari, Italy

% Adapted from original version of BGSA by Esmat Rashedi et al.
% available at https://uk.mathworks.com/matlabcentral/fileexchange/47112-binary-gravitational-search-algorithm-bgsa-zip
function   fitness=evaluateFn(X,F_index,up,low);

[N,dim]=size(X);
for i=1:N 
    L=X(i,:);
    %calculation of objective function
    
    fitness(i)=test_functions_benchmark(L,F_index,dim,up,low);
end