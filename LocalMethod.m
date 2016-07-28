%Uses Local On-Site Measurements
%The function expects a Data vector that contains the following information
%1 [Launch Altitude;
%2  Local Tempurature; (F)
%3  Local Dew Point; (F)
%4  Local Pressure; (mbar)
%5  Local Density; (ft)
%6  Balloon Temperature; (F) 
%7  Weight (lbs)
%  
% The next input is a vector for burst diameter in meters
%
% Mass of helium in kg
%
% Using this data the function will generate the lift expected at the
% launch altitude and a vector of altitudes corrisponding to burst diameter
% And ascent rate in meters per second
% the speed is predicted ascent rate at launch altitiude.
% Lift, Speed, and DeltaLift give the "Standard" Value First, Followed by
% the "Custom" Value

function [lift alt Speed liftdelta] = LocalMethod(Data,Dburst,mass)
%% Input Conversion Layer
LaunchAlt_m = Data(1); %expected in meters, no conversion nessisary
Temp_K = (Data(2)-32)*5/9+273.15; %expecting Fahrenheit, converting to Kelvin
Dewpoint_K = (Data(3)-32)*5/9+273.15; %expecting Fahrenheit, converting to Kelvin
Pressure_Pa = Data(4)*100; %expecting milibars, converted to Pascals
DensityAlt_m = Data(5)/3.280839895; %expecting feet, convtered to meters
BT_K = (Data(6)-32)*5/9+273.15; %expecting Fahrenheit, converting to Kelvin
weight_N = Data(7)/0.22480894244; %expecting pounds, converting to Newtons

%Dburst = Dburst; %expected in meters, no conversion nessisary

mass_kg = mass; %expecting kg, no conversion nessisary
%% Math Layer
[A1 T1 P1 D1] = StandAtmo1976(0,288.16,101325); %Standard table
PdT1 = P1./T1;
[A2 T2 P2 D2] = CustomStandAtmo1976(LaunchAlt_m,Temp_K,Pressure_Pa);
PdT2 = P2./T2;
g0 = 9.80665; %m/s^2
MolarHelium = 4.002602;
MolarAir = 28.9645;
MolarWater = 18.01528;
Rbar = 8314.4598;

%lift calculation
pHe = (Pressure_Pa.*MolarHelium)./(BT_K.*Rbar); %M for He and R value
%pAir(1,1) = interp1(A1,D1,DensityAlt_m); %Density Altitude uses humidity, which is best
%Herman Wobus Equation
Dewpoint_C = Dewpoint_K-273.15;
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
p = c0 + Dewpoint_C*(c1 + Dewpoint_C*(c2 + Dewpoint_C*(c3 + Dewpoint_C*(c4 + Dewpoint_C*(c5 + Dewpoint_C*(c6 + Dewpoint_C*(c7 + Dewpoint_C*(c8 + Dewpoint_C*(c9) ) ) ) ) ) ) ) );
Pwater_Pa = (eso / p^8)*100;
Pdryair_Pa  = Pressure_Pa - Pwater_Pa;
pAir(1,1) = ( (Pdryair_Pa / (Rbar/MolarAir * Temp_K)) + (Pwater_Pa / (Rbar/MolarWater * Temp_K)) );
pAir(2,1) = Pressure_Pa*MolarAir/( Temp_K*Rbar); %from Conditions

Pressure_Pa = [Pressure_Pa;Pressure_Pa];

BV = BT_K./Pressure_Pa*mass_kg*(Rbar/MolarHelium); %using temp and press to get volume
lift = BV.*(pAir-pHe)*g0; 

%Burst Calc
Vburst = 4/3*pi*(Dburst/2).^3;
AltBurst_m = zeros(length(Vburst),2); %pre alocating for speed
for n = 1:length(Vburst)
    AltBurst_m(n,1) = interp1(PdT1,A1, ((mass_kg*Rbar)./(MolarHelium*Vburst(n))) ); 
    %interpolating from the table altitdue based on P/T   ^This=P/T
end

for n = 1:length(Vburst)
    AltBurst_m(n,2) = interp1(PdT2,A2, ((mass_kg*Rbar)./(MolarHelium*Vburst(n))) ); 
    %interpolating from the table altitdue based on P/T   ^This=P/T
end

liftdelta = lift-weight_N;
%A lot of other preditiction programs seems to assume that the acsent rate
%is constant, so I will assume that the acsent rate at launch is constant
area = pi*(BV./pi*3/4).^(2/3);
Speed = [5;5]; %m/s second starting value for interative process
for n = 1:10;
    Re = pAir.*Speed.*(BV./pi.*0.75).^(1/3)./(1.85e-5);
    Cd = 24./Re + (2.6*(Re./5))./(1+(Re./5).^1.52) + (.411*(Re./263000).^-7.94)./(1+(Re./263000).^-8.00) + (Re.^0.80)./461000;
    Speed = sqrt((2*(liftdelta))./(pAir.*area.*Cd));
end

%% Output Conversion Layer
lift = lift*0.22480894244; %converting the newtons of lift to pounds
AltBurst_ft = AltBurst_m*3.280839895; %converting altitude in meters to feet
%speed = speed %no conversion needed
liftdelta = liftdelta*0.22480894244; %converting the newtons to pounds

%% Output Additions
alt = [AltBurst_ft AltBurst_m];

end 