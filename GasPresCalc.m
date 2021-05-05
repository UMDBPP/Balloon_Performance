%Calculates the Pressure of a gas based on Ideal Gas law
%Uses Temperature, Mass, Volume, and individual R value for the gas 
%Units are kg, Celcius, Liters, and m^3*Pa/(K*kg)
function Pressure_PSI = GasPresCalc(R_ind,Volume,Mass,Temp)
%Constants
%none needed

%% Input Converstion Layer

Mass_kg = Mass; %No conv needed
Temp_K = Temp+273.15; %C to K
Volume_m3 = Volume/1000; %Liters to m^3
R = R_ind; %m^3*Pa/(K*kg)

%% Math Layer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
Pressure_Pa = (Mass_kg.*R.*Temp_K)./Volume_m3;

%% Output Conversion Layer
Pressure_PSI = unitconverter(Pressure_Pa,'Pa','psi');

end