%Calculates the specific gas constant of a gas mixture
%Input the molar mixture  as a vector with the molar/volume fractions 
%of gas as follows:
% [H2 He H2O N2 Air O2]
%Air is treated as standard Dry Air
function R = RCalc(GasFractions)
%Constants
 M_H2 = 2.01588/1000; %kg/mol
 M_He = 4.002602/1000; %kg/mol
 M_H2O = 18.01528/1000; %kg/mol
 M_N2 = 28.01340/1000; %kg/mol
 M_Air = 28.9647/1000; %kg/mol
 M_O2 = 31.99880/1000; %kg/mol

 Rbar = 8.31446261815324; %m^3*Pa/(K*mol)
 
 
 
 %% Calculation Layer
 Gases = [M_H2 M_He M_H2O M_N2 M_Air M_O2];
 if sum(GasFractions) ~= 1
     error('invalid gas mixture')
 end
 R = Rbar/sum(GasFractions.*Gases); %m^3*Pa/(K*kg)
 

end