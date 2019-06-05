%function [outputArg1,outputArg2] = untitled2(inputArg1,inputArg2)
%shuru wuliuliang shuchu min cost de juli
clc;
clear;
tic

wll=[1,2,1,1,0,2,2,0,2,0,0,3];             %production logistic quantity

 %sym S1F1S2F1;
 %sym S1F2S2F2;
% sym S1F1S2F1;
 %sym S1F2S2F2;
% sym totalDistance;

%--------------------------------------------------------------------------
Lworkshop=100;      % the length of the workshop                   
Wworkshop=50;       % the width  of the workshop
Row=3;              % width of the road
Lrow1=0;            %Partition area 1 along the length
Lrow2=Lworkshop/3;  %Partition area 2 along the length
Lrow3=2*Lworkshop/3;%Partition area 3 along the length
Radius=2;           % the radius of MC
tongdao=2;          % the wedth of AGV
mintotaldistance=Inf;%initilization the distance
 Output=[];         %initilization the output 
 
 % Incomplete Traversal calculation
for x11=4:10:Lrow2-4
    for y11=4:10:25-4
        
        for x12=4:10:Lrow2-4
            for y12=26:10:50-4
                
                for x21=Lrow2:10:Lrow3
                    for y21=4:10:16.6
                        
                        for x22=Lrow2:10:Lrow3
                            for y22=16.6:10:33.2
                                
                                for x23=Lrow2:10:Lrow3
                                    for y23=33.2:10:50-4
                                        
                                        for x31=Lrow3:10:Lworkshop-4
                                            for y31=4:10:25
                                                
                                                for x32=Lrow3:10:Lworkshop-4
                                                    for y32=26:10:50-4
                    % calculate the vertical(perpendicular) distance ofevery the center (MC)to the
                    % center line of road 
                [juli1] = geometricformula(x12,y12,x23,y23,x22,y22);
                [juli2] = geometricformula(x11,y11,x23,y23,x22,y22);
                [juli3] = geometricformula(x31,y12,x23,y23,x22,y22);
                [juli4] = geometricformula(x32,y12,x23,y23,x22,y22);
                
                [juli5] = geometricformula(x11,y12,x21,y21,x22,y22);
                [juli6] = geometricformula(x12,y12,x21,y21,x22,y22);
                [juli7] = geometricformula(x32,y32,x21,y21,x22,y22);
                [juli8] = geometricformula(x31,y31,x21,y21,x22,y22);
                
                [juli9] = geometricformula(x11,y11,x22,y22,x23,y23);
                [juli10] = geometricformula(x12,y12,x22,y22,x23,y23);
                [juli11] = geometricformula(x31,y31,x22,y22,x23,y23);
                [juli12] = geometricformula(x32,y32,x22,y22,x23,y23);
                
                [juli13] = geometricformula(x11,y11,x22,y22,x21,y21);
                [juli14] = geometricformula(x12,y12,x22,y22,x21,y21);
                [juli15] = geometricformula(x31,y31,x22,y22,x21,y21);
                [juli16] = geometricformula(x32,y32,x22,y22,x21,y21);
                ju=[juli1,juli2,juli3,juli4,juli5,juli6,juli7,juli8,juli9,juli10,juli11,juli12,juli13,juli14,juli15,juli16];                                       
               
               c=[];
               c=find(ju<4); % Determine if the safe distance is satisfied
              if  isempty(c) 
                  
                    %  Euclidean distance between the MC
                S1F1S2F1=sqrtm((x11-x21)^2+(y11-y21)^2);
                S1F1S2F2=sqrtm((x11-x22)^2+(y11-y22)^2);
                S1F2S2F1=sqrtm((x12-x21)^2+(y12-y21)^2);
                S1F2S2F2=sqrtm((x12-x21)^2+(y12-y21)^2); 
                S1F1S2F3=sqrtm((x11-x23)^2+(y11-y23)^2);
                S1F2S2F3=sqrtm((x11-x23)^2+(y11-y23)^2);
                
                S2F1S3F1=sqrtm((x21-x31)^2+(y21-y31)^2);
                S2F1S3F2=sqrtm((x21-x32)^2+(y21-y32)^2); 
                S2F2S3F1=sqrtm((x22-x31)^2+(y22-y31)^2);
                S2F2S3F2=sqrtm((x22-x32)^2+(y22-y32)^2);
                S2F3S3F1=sqrtm((x23-x31)^2+(y23-y31)^2);
                S2F3S3F2=sqrtm((x23-x32)^2+(y23-y32)^2); 
                
                S1F1S1F2=sqrtm((x11-x12)^2+(y11-y12)^2);
                S2F1S2F2=sqrtm((x21-x22)^2+(y21-y22)^2);
                S2F2S2F3=sqrtm((x22-x23)^2+(y22-y23)^2);
                S3F1S3F2=sqrtm((x31-x32)^2+(y31-y32)^2);
                
 adjacencydistance=[S1F1S2F1,S1F1S2F2,S1F2S2F1,S1F2S2F2,S1F1S2F3,S1F2S2F3,S2F1S3F1,S2F1S3F2,S2F2S3F1,S2F2S3F2,S2F3S3F1,S2F3S3F2,S1F1S1F2,S2F1S2F2,S2F2S2F3,S3F1S3F2]; 
                  
                  b=[];
               b=find(adjacencydistance<4);
                  if isempty(b)  
                 
                totaldistance=[S1F1S2F1,S1F1S2F2,S1F2S2F1,S1F2S2F2,S1F1S2F3,S1F2S2F3,S2F1S3F1,S2F1S3F2,S2F2S3F1,S2F2S3F2,S2F3S3F1,S2F3S3F2].*wll;
                sumdistance=sum(totaldistance);
                if  sumdistance<=mintotaldistance
                    mintotaldistance=sumdistance %target value
                     
        Output=[x11,y11;
                x12,y12;
                x21,y21;
                x22,y22;
                x23,y23;
                x31,y31;
                x32,y32;]
                end   
              end
             end   
            
             
                      end                                          
                  end                                                     
              end
           end                                                     
       end                                          
   end                                                     
end
                          end                                                     
                      end                                          
                  end                                                     
              end
           end                                                     
       end                                          
end                                                     
 scatter(Output(:,1),Output(:,2),2000,'r')   

toc
disp(['runtime: ',num2str(toc)])

%end

