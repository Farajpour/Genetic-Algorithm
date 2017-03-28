function [pop,emp]=CreateInitialPopulation(data)

npop=data.npop;
nvar=data.nvar;

emp.x=[];
emp.fit=[];
emp.info=[];
pop=repmat(emp,npop,1);



for i=1:npop
pop(i).x=randperm(nvar);
pop(i)=fitness(pop(i),data);
end


end