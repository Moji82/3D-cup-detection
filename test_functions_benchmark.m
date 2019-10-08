% XOR BGSA
% Modified by M. Ahmadieh Khanesar as per paper: 
% "	Mojtaba Ahmadieh Khanesar, David Branson,
%“ 'XOR Binary Gravitational Search Algorithm', IEEE conference on System
%Man Cybernetics, 2019, Bari, Italy

% Adapted from original version of BGSA by Esmat Rashedi et al.
% available at https://uk.mathworks.com/matlabcentral/fileexchange/47112-binary-gravitational-search-algorithm-bgsa-zip
function y=test_functions_benchmark(L,F_index,dim,up,low)
global bit
global N
global dim1
%Insert your own objective function with a new F_index.
%
%
% switch F_index;
%     case 1%max ones
%     fitness=sum((L).^2);
%     case 24%max ones
%     fitness=sum(L);
%
%     case 25%Royal road
%         for i=1:8:dim-7
%         s(fix(i/8)+1)=sum(L(i:i+7));
%         end
%         fitness=sum(s==8);
% end
%

n=F_index;
x=L;
upb=mybin2dec(ones(1,bit));
lowb=0;
xn=[];

for j=1:dim1
    x1=x(1+(j-1)*bit:j*bit);
    x1=mybin2dec(x1)/(upb-lowb)*(up-low)+low;
    xn=[xn x1];
end

x=xn;

if n==1
    y=sum((x).^2);
elseif n==2
    y=1;
    for i=1:length(x)
        y=y*i*x(i)^2;
    end
elseif n==3
    y=0;
    for i=1:length(x)-1
        y=y+100*(x(i+1)-x(i)^2)^2+(1-x(i))^2;
    end
elseif n==4
    y=10*length(x);
    for i=1:length(x)
        y=y+x(i)^2-10*cos(2*pi*x(i));
    end
elseif n==5
    y=sum(-x.*sin(sqrt(abs(x))));
elseif n==6
    y1=1/4000*sum(x.^2);
    y2=1;
    for i=1:length(x)
        y2=y2*cos(cos(x(i))/sqrt(i));
    end
    y=y1+y2+1;
    if y<0
        x
    end
elseif n==7
    y=0;
    for i=1:length(x)
        y=abs(x(i)).^(i+1)+y;
    end
elseif n==8
    a=20;b=0.2;c=2*pi;
    y1=sum(x.^2);
    y1=-20*exp(0.2*1/length(x)*sqrt(y1));
    y=y1+exp(1/length(x)*sum(cos(c*x)))+a+exp(1);
elseif n==9
    y=0;
    for i=1:length(x)
        y=y-sin(x(i))*(sin(i*x(i)^2/pi))^(2*10);
    end
    
elseif n==10 %Shekel's foxholes
    y=0;
    a=[1 2 3 4 5];
    c=repmat(a,1,6);
    a=repmat(a,30,6);
    m11=30;n11=length(x);
    for i=1:m11
        y1=0;
        for j=1:n11
            y1=y1+(x(j)-a(i,j))^2+c(j);
        end
        y=y+y1^-1;
    end
    y=-y;
end

