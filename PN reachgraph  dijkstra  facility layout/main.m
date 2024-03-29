clc;clear;
tic
Pre=[1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1];
% PN model prematrix
Post=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1;1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1];
% PN model postmatrx
M0=[2;3;2;0;0;0;0;0;0;0;0;0;1;1;1;1;1;1;1];
%initialization = three type  product and numbers
TimeT=[2;2;3;3;4;4;2;2;2;1;1;1;3;3;3;3;3;2;2;1;1];
%process time 
TypeT=[1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1];
%transtion type
PrioT=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
%transtion type
ticks=10000;
%cycle time
[A,RM] = graph11(Pre,Post,M0);	%generate reach graph

[Seq,setM] = playstpnex11(Pre, Post, M0, TimeT, TypeT, ticks)
% generate sequence  
[Seq,M] = playstpn11(Pre, Post, M0, TimeT, TypeT, ticks)

%[XX]=dispgr11(A,RM);
B=A;
RM;
idx=find(A==0);
A(idx)=inf;

for i=1:21
idx=find(A==i);
TT=TimeT(i,1);
A(idx)=TT;
end
for j=1:64
A(j,j)=0;
end
A=triu(A,0)+tril(A',0)
st=1;
e=size(A,1);
w=A;
[distance path] = Dijkstra(w,st,e)% search the optimal sequece
toc
disp(['runtime: ',num2str(toc)]);
%sum(sum(A~=0))

