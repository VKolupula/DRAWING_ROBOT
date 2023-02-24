function xy = countsToXY(counts,Z_i,Base)
% Define constants
countsPerRevolution = 1200;
countsPerRadian = countsPerRevolution/(2*pi);
r_spool = 0.0045;   
theta = counts/countsPerRadian;
dStringLength = r_spool*theta;
dZ = dStringLength/2;
Z = Z_i + dZ;
x = (Base^2 + Z(1)^2 - Z(2)^2)/(2*Base);
y = sqrt(Z(1)^2-x^2);
xy = [x y];
end