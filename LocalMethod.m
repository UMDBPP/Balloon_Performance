%Uses Local On-Site Measurements
%The function expects a Data vector that contains the following information
%1 [Launch Altitude;
%2  Local Tempurature; (C)
%3  Local Dew Point; (C)
%4  Local Pressure; (mbar)
%5  Balloon Temperature; (F) 
%6  Weight (lbs)
%  
% The next input is a vector for burst diameter in meters
%
% Mass of helium in kg
%
% Using this data the function will generate the lift expected at the
% launch altitude and a vector of altitudes corrisponding to burst diameter
% And ascent rate in meters per second
% the speed is predicted ascent rate at launch altitiude.
% Lift, Speed, and DeltaLift give a Moist Air Value First, Followed by
% Dry Air Value
%
%Depedencies:
% StandAtmo1976, CustomStandAtmo1976, MoistDensity

function [lift, alt, Speed, liftdelta] = LocalMethod(Data,Dburst,mass)
%% Input Conversion Layer
LaunchAlt_m = Data(1); %expected in meters, no conversion nessisary
Temp_K = (Data(2))+273.15; %expecting Fahrenheit, converting to Kelvin
Dewpoint_K = (Data(3))+273.15; %expecting Fahrenheit, converting to Kelvin
Pressure_Pa = Data(4)*100; %expecting milibars, converted to Pascals
BT_K = (Data(5)-32)*5/9+273.15; %expecting Fahrenheit, converting to Kelvin
payloadmass_kg = Data(6); %expecting kg no converting needed

%Dburst = Dburst; %expected in meters, no conversion nessisary

mass_kg = mass; %expecting kg, no conversion nessisary
%% Math Layer
[A1, T1, P1, ~] = StandAtmo1976(0,288.15,101325); %Standard table
%If the density table is needed, use D1
PdT1 = P1./T1;
[A2, T2, P2, ~] = CustomStandAtmo1976(LaunchAlt_m,Temp_K,Dewpoint_K,Pressure_Pa);
%If the density table is needed, use D2
PdT2 = P2./T2;
g0 = 9.80665; %m/s^2
MolarHelium = 4.002602;
MolarAir = 28.9645;
%MolarWater = 18.01528;
Rbar = 8314.4598;

weight_N = payloadmass_kg*g0;

%lift calculation
pHe = (Pressure_Pa.*MolarHelium)./(BT_K.*Rbar); %M for He and R value
%pAir(1,1) = interp1(A1,D1,DensityAlt_m); %Density Altitude uses humidity, which is best
pAir(1,1) = MoistDensity(Temp_K,Dewpoint_K,Pressure_Pa);
pAir(2,1) = Pressure_Pa*MolarAir/( Temp_K*Rbar); %from Conditions

Pressure_Pa = [Pressure_Pa;Pressure_Pa];

BV = BT_K./Pressure_Pa*mass_kg*(Rbar/MolarHelium); %using temp and press to get volume
lift = BV.*(pAir-pHe)*g0; 

%Burst Calc

% sigma = 5.6703*10^(-8);% (W/m^2K^4)
% emis = .86;
% SpHe = 2.01/1000;
% travel = launchalt:100:47000;
% BalloonTemp = ones(length(travel),1);
% BalloonTemp(1) = BT;
% for i = 1:length(travel)
%     Tair = interp(A2,T2,travel(i));
%     P = interp(A2,P2,travel(i));
%     V = mass*Rbar/MolarHelium*BalloonTemp(i)/P;
%     SA = 4*pi*((3*V)/(4*pi))^(2/3);
%     BalloonTemp(i+1) = (sigma*emis*(BalloonTemp(i)^4-Tair^4)*SA*25/(mass*SpHe))-BalloonTemp(i);
% end

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
Speed = [5;5]; %m/s second starting value for interative process
hamburgerFactor = 0.4; %Balloon flattens in flow, increaseing area
for n = 1:10
    area = (pi*(BV./pi*3/4).^(2/3)) .* hamburgerFactor .* Speed; %drag area of balloon
    Re = pAir.*Speed.*(BV./pi.*0.75).^(1/3)./(1.85e-5);
    Cd = 24./Re + (2.6*(Re./5))./(1+(Re./5).^1.52) + (.411*(Re./263000).^-7.94)./(1+(Re./263000).^-8.00) + (Re.^0.80)./461000;
    Speed = sqrt((2*(liftdelta))./(pAir.*((area.*Cd)+((.09*weight_N/g0)*1.05))));
end

%% Output Conversion Layer
lift = lift*0.22480894244; %converting the newtons of lift to pounds
alt = AltBurst_m; %outputing altitude in meters
%speed = speed %no conversion needed
liftdelta = liftdelta*0.22480894244; %converting the newtons to pounds

end 