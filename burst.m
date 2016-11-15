%Calculates current volume and diameter of balloon using ideal gas law and
%assuming balloon is spherical. Units must be in SI: Kelvin, Pascals,
%kilograms, meters.
%Output is volume in the first vector then diameter in the second with the 
%second entry in the vector the ratio to burst volume/diameter
 
function [volume, diameter] = burst(temperature,pressure,mass,burstdiameter)
Rbar = 8314.4598;
MolarHelium = 4.002602;

volume(1,1) = mass * temperature/pressure * Rbar/MolarHelium;
Vburst = 4/3*pi*(burstdiameter/2)^3;
volume(2,1) = volume(1,1)/Vburst;


diameter(1,1) = (3/(4*pi)*volume(1,1))^(1/3)*2;
diameter(2,1) = diameter(1,1)/burstdiameter;




