% XOR BGSA
% Modified by M. Ahmadieh Khanesar as per paper:
% "	Mojtaba Ahmadieh Khanesar, David Branson,
% “ 'XOR Binary Gravitational Search Algorithm', IEEE conference on System
% Man Cybernetics, 2019, Bari, Italy

% Adapted from original version of BGSA by Esmat Rashedi et al.
% available at https://uk.mathworks.com/matlabcentral/fileexchange
%  /47112-binary-gravitational-search-algorithm-bgsa-zip


function [Fbest,Lbest,Best_fitness]=BxorGSA(F_index,N,max_it,ElitistCheck,min_flag,Rpower)
global dim1
global bit


[low,up,m]=test_functions_range(F_index); % The range associated with data
n=dim1*bit;

X=Binitialization(n,N); % Initializing the agents 

V=zeros(N,n);

for iteration=1:max_it
    %     iteration
    
    % Evaluation of agents
    fitness=evaluateFn(X,F_index,up,low);
    
    % keep the best result
    if iteration>1
        if min_flag==1   % minimization problem
            afit=find(fitness>fitnessold);
        else             % maximization problem
            afit=find(fitness<fitnessold);
        end
        X(afit,:)=Xold(afit,:);
        fitness(afit)=fitnessold(afit);
    end
    %%%
    
    if min_flag==1
        [best best_X]=min(fitness); %minimization problem
        overall_best(iteration)=best;
    else
        [best best_X]=max(fitness); %maximization problem
        overall_best(iteration)=best;
    end
    
    if iteration==1
        Fbest=best; 
        Lbest=X(best_X,:);
    end
    if min_flag==1
        if best<Fbest  % minimization problem
            Fbest=best;
            Lbest=X(best_X,:);
        end
    else
        if best>Fbest  %maximization problem
            Fbest=best;
            Lbest=X(best_X,:);
        end
    end
    
    Best_fitness(iteration)= Fbest;
    
    M=massCalculation(fitness,min_flag);
    
    G=BGconstant(iteration,max_it);
    
    a=BGfield(M,X,G,Rpower,ElitistCheck,iteration,max_it);
    
    Xold=X;
    fitnessold=fitness;
    
    [X,V]=Bxormove(X,a,V);
    
end 