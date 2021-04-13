%Calculates the mass of the Helium from a tank
%PressureTankStart (PTS) in PSI
%PressureTankEnd (PTE) in PSI
%TempuratureTankStart (TTS) in Fahrenheit
%TempuratureTankEnd (TTE) in Fahrenheit
%V is the internal volume of the tank in cubic meters. 
%All internal Caluclations in SI units
%Accepts Vector input for all values, must be same length
%300 Tanks are 48.99, airgas says 49.8, use the more conservative option
function Mass_kg = HeliumMassCalc(PTS,PTE,TTS,TTE,VolumeTank)

%Constants
M = 4.002602/1000;% kg/mol
Rbar = 8.31446261815324; %m^3*Pa/(K*mol)

%% Input Converstion Layer

PressureTankStart_Pa = PTS*6894.75728; %PSI to Pa
PressureTankEnd_Pa = PTE*6894.75728 ; %PSI to Pa
TempTankStart_K = (TTS-32)*5/9+273.15; %F to K
TempTankEnd_K = (TTE-32)*5/9+273.15; %F to K

%% Math Layer
Mass_kg = (PressureTankStart_Pa./TempTankStart_K - PressureTankEnd_Pa./TempTankEnd_K)*VolumeTank*M/Rbar;

%% Output Conversion Layer

%no output conversion needed

end