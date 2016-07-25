%Calculates the mass of the Helium from a K sized tank
%PressureTankStart (PTS) in PSI
%PressureTankEnd (PTE) in PSI
%TempuratureTankStart (TTS) in Fahrenheit
%TempuratureTankEnd (TTE) in Fahrenheit
%All internal Caluclations in SI units
%Accepts Vector input for all values, must be same lenght

function Mass_kg = HeliumMassCalc(PTS,PTE,TTS,TTE)

%Constants
VolumeTank = 43.61/1000; %Liters to Cubic meters
M = 4.002602;
Rbar = 8314.4598;

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