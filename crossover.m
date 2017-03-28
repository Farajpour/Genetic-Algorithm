function  crosspop=crossover(crosspop,pop,data)

ncross=data.ncross;

f=[pop.fit]+1;
f=1./f;
f=f./sum(f);
f=cumsum(f);

for n=1:2:ncross
    
    i1=find(rand<=f,1,'first');
    i2=find(rand<=f,1,'first');
    
    [crosspop(n).x,crosspop(n+1).x]=SinglePointCrossover(pop(i1).x,pop(i2).x);
    
    crosspop(n)=fitness(crosspop(n),data);
    crosspop(n+1)=fitness(crosspop(n+1),data);
    
end

end


function [y1,y2]=SinglePointCrossover(x1,x2)

nvar=numel(x1);

j=randi([1 nvar-1]);
y1=x1;
y2=x2;

y1(1:j)=x2(1:j);
y2(1:j)=x1(1:j);

y1=Unique(y1,1:j);
y2=Unique(y2,1:j);

end


















