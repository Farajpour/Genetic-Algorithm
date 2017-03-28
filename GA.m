clc
clear
close all
format shortG


%% Insert Data

data=InsertData();
data.Ns=input(' Start Node = ');
data.Ne=input(' Final Node = ');

%% parametres setting


npop=10;     % number of population

pc=0.8;       % percent of crossover
ncross=2*round(npop*pc/2);  % number of crossover offspring

pm=0.2;        %  percent of mutation
nmut=round(npop*pm);  % number of mutation offspring

maxiter=100;



data.npop=npop;
data.ncross=ncross;
data.nmut=nmut;
data.maxiter=maxiter;

%% initialization
tic

[pop,emp]=CreateInitialPopulation(data);


%% main loop
BEST=zeros(maxiter,1);
MEAN=zeros(maxiter,1);

for iter=1:maxiter
    
    % crossover
    crosspop=repmat(emp,ncross,1);
    crosspop=crossover(crosspop,pop,data);
    
    % mutation
    mutpop=repmat(emp,nmut,1);
    mutpop=mutation(mutpop,pop,data);
    
    
    % Merged
    [pop]=[pop;crosspop;mutpop];
    
    
   

    % Sorting
    [value,index]=sort([pop.fit]);
    pop=pop(index);
    gpop=pop(1);
    
    % Select
    pop=pop(1:npop);
    

    
    BEST(iter)=gpop.fit;
    MEAN(iter)=mean([pop.fit]);
    
    disp([' Iter = ' num2str(iter)  ' BEST = ' num2str(BEST(iter))])
    

    
    
end

%% results

disp([ ' Best x = '  num2str(gpop.info.y)])
disp([ ' Best Fitness = '  num2str(gpop.fit)])
disp([ ' Time = '  num2str(toc)])






figure
semilogy(BEST,'r')
hold on
semilogy(MEAN,'b')
xlabel('Iteration')
ylabel('Fitness')
legend('BEST','MEAN')
title('GA')




