function data=InsertData()

Dis=xlsread('data.xlsx');
nvar=size(Dis,1);
M=10^10*nvar;
Dis(isnan(Dis))=M;

data.nvar=nvar;
data.Dis=Dis;
data.M=M;

 end