clc
close all
clear all
dimension=[8 8 8 8 8 12 12 12 12 12 16 16 16 16 16 20 20 20 20 20 24 24 24 24 24];
global bit
global dim1;
global N
global max_it
global ElitistCheck
global min_flag
global G0
global Rpower
global p
global W
global c
bit=20;
dim1=3;

G0=1;

N=15;
max_it=1000;
ElitistCheck=1;
Rpower=1;
min_flag=1; 
result1=zeros(3,10);
result2=zeros(3,10);
NNN=10;
for i=1:10
        
    
    for j=1:NNN
        [i j]
        temp1(j)=myBxorGSA(i);
    end
    result1(1,i,1:NNN)=(temp1);
    save 'result_HIGH_home.mat'
end

for k=1:1
    for l=1:10
        result2(k,l)=mean(result1(k,l,:));
    end
end