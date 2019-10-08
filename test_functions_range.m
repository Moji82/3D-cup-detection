% XOR BGSA
% Modified by M. Ahmadieh Khanesar as per paper: 
% "	Mojtaba Ahmadieh Khanesar, David Branson,
%“ 'XOR Binary Gravitational Search Algorithm', IEEE conference on System
%Man Cybernetics, 2019, Bari, Italy

% Adapted from original version of BGSA by Esmat Rashedi et al.
% available at https://uk.mathworks.com/matlabcentral/fileexchange/47112-binary-gravitational-search-algorithm-bgsa-zip
function [down,up,dim]=test_functions_range(F_index)
global dim1;
%If lower bounds of the dimensions are the same, then 'down' is a value.
%Otherwise, 'down' is a vector that shows the lower bound of each dimension.
%This is also true for upper bounds of the dimensions.
% down=-10;up=10;dim=dim1;
% %Insert your own boundaries with a new F_index.
% switch F_index
%  case 1 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 2 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 3 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 4 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 5 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 6 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 7 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 8 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 9 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 10 %max_ones
%     down=-10;up=10;dim=dim1;
%  case 10 %max_ones
%     down=-10;up=10;dim=dim1; 
%     case 11 %max_ones
%     down=-10;up=10;dim=dim1; case 12 %max_ones
%     down=-10;up=10;dim=dim1; case 13 %max_ones
%     down=-10;up=10;dim=dim1; case 14 %max_ones
%     down=-10;up=10;dim=dim1; case 15 %max_ones
%     down=-10;up=10;dim=dim1; case 16 %max_ones
%     down=-10;up=10;dim=dim1; case 17 %max_ones
%     down=-10;up=10;dim=dim1; case 18 %max_ones
%     down=-10;up=10;dim=dim1; case 19 %max_ones
%     down=-10;up=10;dim=dim1; case 20 %max_ones
%     down=-10;up=10;dim=dim1; case 21 %max_ones
%     down=-10;up=10;dim=dim1; case 22 %max_ones
%     down=-10;up=10;dim=dim1; case 23 %max_ones
%     down=-10;up=10;dim=dim1; case 24 %max_ones
%     down=-10;up=10;dim=dim1; 
%     
%     case 25 %max_ones
%     down=0;up=1;dim=160;
% 
% 
%     case 26 %Royal road
%     down=0;up=1;dim=160;
%     
%         
% end
down=-10;up=10;dim=dim1; 