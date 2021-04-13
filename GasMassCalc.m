%Calculates the mass of a gas based on Ideal Gas law
%Uses Temperature, Pressure, Volume, and individual R value for the gas 
%Units are PSI, Celcius, Cubic Meters, and m^3*Pa/(K*kg)
function Mass_kg = GasMassCalc(Temp,Pressure,Volume,R_ind)

%Constants

%none needed

%% Input Converstion Layer

Pressure_Pa = Pressure*6894.75728; %PSI to Pa
Temp_K = Temp+273.15; %C to K
Volume_m3 = Volume; %m^3
R = R_ind; %%m^3*Pa/(K*kg)

%% Math Layer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
Mass_kg = (Pressure_Pa./Temp_K).*Volume_m3./R;

%% Output Conversion Layer

% none needed
end