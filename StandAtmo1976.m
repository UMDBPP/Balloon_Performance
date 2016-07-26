%Standard Atmosphere 1976 Table
%Accepts the altitude you're at (in meters), the temperature (kelvin, used
%in calculations), and pressure (Pascals)
%at the altitude you indicated, and generates a standard atmosphere table
%based on the thermal gradiants in the 1976 model.
%Outputs are  [Altitude Temperature Pressure Density]
%Stops at 47 km in altitude. 
%The altitude indicated (you are at) must be below 11 km
function [Alt T P D] = StandAtmo1976(Altat,Temp,Pressure)

g0 = 9.80665;  %Geopotential Acceleration
M = 28.9644; %molecular mass of air
R = 8314.4598; %SI R value
stepalt=100; %step size for the tables. 

Density = (Pressure*M)/(Temp*R); %Calculating air denisty based on ideal gas law

R1 = -1000:stepalt:11000; %Altitude range for 1st thermal region
L1 = -6.5e-3; %thermal gradiant
T1 = Temp+L1*(R1-Altat); %tempurature calculation for altitudes
P1 = Pressure.*((T1)/(Temp)).^-((g0*M)/(R*L1)); %pressure calculation for altitudes
D1 = Density.*(T1/Temp).^(-((g0*M)/(L1*R)) + 1);

R2 = (11000+stepalt):stepalt:20000; %altitude range for 2nd thermal region
L2 = 0.0; %thermal gradiant, isothermal region
T2 = T1(end)+L2.*(R2-R1(end)); %still going through the motions for conistecy
P2 = P1(end)*(exp(-(g0*M*(R2-R1(end)))/(R*T1(end)))); %pressure calculation different for isothermal region
D2 = D1(end)*exp(-(g0*M*R2-R1(end))/(R*T1(end)));

R3 = (20000+stepalt):stepalt:32000; %altitude range for 3rd thermal region
L3 = 1.0e-3; %thermal gradiant
T3 = T2(end)+L3*(R3-R2(end)); %tempurature calculation for altitudes
P3 = P2(end)*((T3)/(T2(end))).^(-(g0*M)/(R*L3));
D3 = D2(end).*(T3/T2(end)).^(-((g0*M)/(L3*R)) + 1);

R4 = (32000+stepalt):stepalt:47000; %altitude range for 4th thermal region
L4 = 2.8e-3; %thermal gradiant
T4 = T3(end)+L4.*(R4-R3(end)); %tempurature calculation for altitudes
P4 = P3(end)*((T4)/(T3(end))).^(-(g0*M)/(R*L4));
D4 = D3(end).*(T4/T3(end)).^(-((g0*M)/(L4*R)) + 1);

Alt = [R1'; R2'; R3'; R4'];
T = [T1'; T2'; T3'; T4'];
P = [P1'; P2'; P3'; P4'];
D = [D1'; D2'; D3'; D4'];

end