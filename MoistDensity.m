%Calculates the Density of Moist Air
%Using the Herman Wobus Equation
%Inputs are Temperature, Dew Point Temperature, Pressure
%Units are SI for use inside functions (Kelvin,Kelvin,Pascals)
function [Density] = MoistDensity(Temp,DewPoint,Pressure)
%% Input Conversion
Temp_K = Temp; %Already in Kelvin
Dewpoint_C = DewPoint-273.15;
Pressure_Pa = Pressure; %Already in Pascals

%% Math Layer

%Constants
MolarAir = 28.9645;
MolarWater = 18.01528;
Rbar = 8314.4598;

eso = 6.1078;
c0 = 0.99999683;
c1 = -0.90826951e-2;
c2 = 0.78736169e-4;
c3 = -0.61117958e-6;
c4 = 0.43884187e-8;
c5 = -0.29883885e-10;
c6 = 0.21874425e-12;
c7 = -0.17892321e-14;
c8 = 0.11112018e-16;
c9 = -0.30994571e-19;

%Calculations
p = c0 + Dewpoint_C.*(c1 + Dewpoint_C.*(c2 + Dewpoint_C.*(c3 + Dewpoint_C.*(c4 + Dewpoint_C.*(c5 + Dewpoint_C.*(c6 + Dewpoint_C.*(c7 + Dewpoint_C.*(c8 + Dewpoint_C.*(c9) ) ) ) ) ) ) ) );
Pwater_Pa = (eso ./ p.^8)*100;
Pdryair_Pa  = Pressure_Pa - Pwater_Pa;
Density = ( (Pdryair_Pa ./ (Rbar/MolarAir * Temp_K)) + (Pwater_Pa ./ (Rbar/MolarWater * Temp_K)) );

%% Output Converstion

%None Needed
end