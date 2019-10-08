function y=myBxorGSA(F_index)


 global bit
 global dim1;
 global N
 global max_it
 global ElitistCheck
 global min_flag
 global Rpower 

 [Fbest,Lbest,BestChart]=BxorGSA(F_index,N,max_it,ElitistCheck,min_flag,Rpower);
% 
y=Fbest;
end

