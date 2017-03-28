function sol=fitness(sol,data)

%% Calling Data
Ns=data.Ns;
Ne=data.Ne;
Dis=data.Dis;
M=data.M;
%% Calling Sol
x=sol.x;

%% Repair
x(x==Ns)=[];
% x(x==Ne)=[];

CH=0;
y=Ns;
while true
    
    i=y(end);
    
    for j=x
        
        if  Dis(i,j)~=M
            [y]=[y j];
            x(x==j)=[];
            break
        end
        
    end
    
    if y(end)==i;CH=M;break;end
    if y(end)==Ne;CH=0;break;end
    
%     if Dis(y(end),Ne)~=M;break;end
    
end

% y=[y Ne];
nip=numel(y);
Z=0;
for i=1:nip-1
    j=i+1;
    Z=Z+Dis(y(i),y(j));
end

if Dis(Ns,Ne)~=M && Dis(Ns,Ne)<Z
    y=[Ns,Ne];
    Z=Dis(Ns,Ne);
    CH=0;
end


%% Export Sol
sol.fit=Z*(1+CH);
sol.info.y=y;



end
