function [A,RM] = graph11(Pre,Post,M0)

%function [A,RM] = graph(Pre,Post,M0)
% function graph finds a graph of reachable markings to given marked bounded Petri Net
% A - 	Adjacency matrix (A(i,j) means oriented arc from vertex i to vertex j)
%	value of A(i,j) means index of fired transition
% RM - 	Matrix of reachable states (each column represents marking of one state)

RM=M0;
A=[0];
[nofp,noft]=size(Pre);

C=Post-Pre

i=0;
while i < size(RM,2)	%main loop - while (number of alredy inspected states)<(number of existing states)
	i=i+1;
	sprintf('--------inspecting state %i',i)
	%generation of vector of  enabled transitions
	for k=1:noft% qian zhi lie xiang liang  xun huan T
	    	x(k)=all(RM(:,i) >= Pre(:,k));  			% x - enabled transition
	end
	fx=find(x);%zhao dao le dui ying de T weizhi
	
	for k=1:size(fx,2)%zhao dao lie de chi cun jin xing xun huan 
		bb = RM(:,i)+C(:,fx(k));%jin xing  bian qian ji fa ,chan sheng xin de biao shi 
		mat_bb=[];%chu shi hua zhong jian biao wei kong 
		for j=1:size(RM,2) %jisuan RM duo shao lie ?
			mat_bb=[mat_bb,bb];% jinxing pin jie 
		end;
		v=all(mat_bb == RM);% find xiangtong biaoshi 
		j=find(v);%zhaodao Vzhong lie 
		if size(j,2)>1%ru guo wei zhen, na me cun zai xiang tong de biaoshi  
                    sprintf('!!!!!!!!!!11State is duplicated')
		end
		if any(v)					%%%state already exists
			A(i,j)=	fx(k);          %lin jie ju zhen fuzhi ,jiang i he j xiang lian fu yu Tzhi 
		else						%%%state does not exist
			RM=[RM,bb];             %fuyuxin de RM
			A(size(A,1)+1,size(A,2)+1)=0;%linjiejuzhen qita wei 0
			A(i,size(A,2))=fx(k);   %jiang xin de wei zhi fu yu xin de T
		end;
		
	end;

RM;
A;

end	%main loop