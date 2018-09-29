%Calculates the Density of Moist Air
%Uses the Herman Wobus Equation w/ DewPoint, Relative, or Absolute Humidity
%Inputs are Temperature, Dew Point Temperature, Pressure, and the method
%'DP' uses Dew Point (Kelvin), 'RH' uses Relative Humidity (Percentage), and 'AH' uses Absolute
%Humidity (g/m^3)

function [Density] = MoistDensity(Temp,Humidity,Pressure,Method)
%% Input Conversion
if strcmp(Method,'DP') == 1
    Dewpoint_C = Humidity-273.15;
elseif strcmp(Method,'RH') == 1 
    RelHumid = Humidity/100;
elseif strcmp(Method,'AH') == 1
    %AbsHumid_kgPm3  = Humidity./1000;
    error("Currently Unsupported");
else 
    error('Unspecified Method');
end


Temp_K = Temp; %Already in Kelvin

Pressure_Pa = Pressure; %Already in Pascals

%% Math Layer

%Constants
MolarAir = 28.9645;
MolarWater = 18.01528;
Rbar = 8314.4598;



%Calculations
if exist('Dewpoint_C','var') == 1
    %getting partial pressure of water from DP and Herman Wobus
    Pwater_Pa = HermanWobus(Dewpoint_C); 
elseif exist('RelHumid','var') == 1
    %gettingpartial pressure of water by taking Herman Wobus of Temp (100% humidity) and multiplying by RelHumidity
    Pwater_Pa = RelHumid*HermanWobus(Temp); 
elseif exist('AbsHumid_kgPm3','var') == 1
%    AbsHumid_kgPm3;
else
    error('Humidity Value Not Created');
end
    Pdryair_Pa  = Pressure_Pa - Pwater_Pa;
    Density = ( (Pdryair_Pa ./ (Rbar/MolarAir * Temp_K)) + (Pwater_Pa ./ (Rbar/MolarWater * Temp_K)) );

%% Output Converstion

%None Needed
end

function Pwater_Pa = HermanWobus(temp_C)
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
    p = c0 + temp_C.*(c1 + temp_C.*(c2 + temp_C.*(c3 + temp_C.*(c4 + temp_C.*(c5 + temp_C.*(c6 + temp_C.*(c7 + temp_C.*(c8 + temp_C.*(c9) ) ) ) ) ) ) ) );
    Pwater_Pa = (eso ./ p.^8)*100;

end