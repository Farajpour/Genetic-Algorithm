function  mutpop=mutation(mutpop,pop,data)

nmut=data.nmut;
npop=data.npop;


for n=1:nmut
    
    i1=randi([1 npop]);
    mutpop(n).x=Swap(pop(i1).x);
    mutpop(n)=fitness(mutpop(n),data);
    
end


end





function y=Swap(x)

n=numel(x);

i=randsample(n,2);
i1=i(1);
i2=i(2);

y=x;
y([i1 i2])=x([i2 i1]);

end


