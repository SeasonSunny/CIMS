function [juli] = geometricformula(x1,y1,x2,y2,x3,y3)

juli=abs((y3-(y2-y1)*x3/(x2-x1)+x1*(y2-y1)/(x2-x1)-y1)/sqrtm((y2-y1)^2/(x2-x1)^2+1));

end

