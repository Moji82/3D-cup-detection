% XOR BGSA
% Modified by M. Ahmadieh Khanesar as per paper: 
% "	Mojtaba Ahmadieh Khanesar, David Branson,
%“ 'XOR Binary Gravitational Search Algorithm', IEEE conference on System
%Man Cybernetics, 2019, Bari, Italy

% Adapted from original version of BGSA by Esmat Rashedi et al.
% available at https://uk.mathworks.com/matlabcentral/fileexchange/47112-binary-gravitational-search-algorithm-bgsa-zip
function [M]=massCalculation(fit,min_flag);
Fmax=max(fit); Fmin=min(fit); Fmean=mean(fit); 
[i N]=size(fit);

if Fmax==Fmin
   M=ones(N,1);
else
    
   if min_flag==1 
      best=Fmin;worst=Fmax; % minimization problem
   else 
      best=Fmax;worst=Fmin; % maximization problem
   end
  
   M=(fit-worst)./(best-worst); 

end

M=M./sum(M); 