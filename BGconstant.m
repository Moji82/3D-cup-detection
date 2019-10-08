% XOR BGSA
% Modified by M. Ahmadieh Khanesar as per paper: 
% "	Mojtaba Ahmadieh Khanesar, David Branson,
%“ 'XOR Binary Gravitational Search Algorithm', IEEE conference on System
%Man Cybernetics, 2019, Bari, Italy

% Adapted from original version of BGSA by Esmat Rashedi et al.
% available at https://uk.mathworks.com/matlabcentral/fileexchange/47112-binary-gravitational-search-algorithm-bgsa-zip

function G=BGconstant(iteration,max_it)

global G0 

 G=G0*(1-(iteration/max_it));
