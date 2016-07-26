%Burst at 000,000ft
%Using a 3000g balloon 
%Diameter: 00.00 meters approx.
clear all
close all
%% Data Input Layer 
%This is not a function, conversion handled in functions

LaunchAlt = 180; %meters

LocalTemp = 80.00; %Fahrenheit 78 Dew Point
LocalPres = 991.60; %mbar
LocalDensity = 2400; %feet

AWOSTemp = 27; %Celcius %20 dew point
AWOSPres = 29.98; %inHg
AWOSDensity = 2300; %feet

BalloonTemp = 80; %Fahrenheit
TankData = [2750, 0160, 80, 64; %PSI,PSI,F,F
            2740, 0750, 80, 67]; %PSI,PSI,F,F
HeMass = HeliumMassCalc(TankData(1,1),TankData(1,2),TankData(1,3),TankData(1,4)) + HeliumMassCalc(TankData(2,1),TankData(2,2),TankData(2,3),TankData(2,4));

Diameter = 10.5:.1:14.5; %meters

%All in pounds. Unless you all can give it to me in grams, might be easier
PayloadString = [   3.000   %Balloon 6.62 lbs
                    0.794   %Helios 1.75 lbs
                    0.900   %Parachute 1.98 lbs
                    2.000   %Command 4.5 lbs
                    1.134   %Bach's Box 2.5 lbs
                    0.600   %Cloud 360 1.32 lbs
                    0.755   %IRENE 1.65 lbs
                    0.350   %Ganondorf 0.77 lbs
                    0.454   %Data Pigon 1.00 lbs
                    0.350   %Scorch 0.77 lbs
                    1.600   %HAB Scope 3.63 lbs
                    0.100   %String 3g per 1.5'
                    0.000   %Additional Margin
                    ];  
                
DuctTapeFactor = 1.1; %Weight Margin
TotalWeight = sum(PayloadString)*DuctTapeFactor*9.80665*0.22480894244; %some safety factor for the weight

%% Function Call Layer

LocalData = [LaunchAlt;LocalTemp;LocalPres;LocalDensity;BalloonTemp;TotalWeight];
[LocalLift LocalBurst LocalSpeed LocalDelta] = LocalMethod(LocalData,Diameter,HeMass);

AWOSData = [LaunchAlt;AWOSTemp;AWOSPres;AWOSDensity;BalloonTemp;TotalWeight];
[AWOSLift AWOSBurst AWOSSpeed AWOSDelta] = AWOSMethod(AWOSData,Diameter,HeMass);


%% Results Layer
Lift = [AWOSLift LocalLift]
Delta = [AWOSDelta LocalDelta]
Speed = [AWOSSpeed LocalSpeed]
figure(1)
hold on
grid on 
title 'Burst Diameter vs. Burst Altitude'
xlabel 'meters'
ylabel 'feet'
plot(Diameter,AWOSBurst(:,1),'r')
plot(Diameter,LocalBurst(:,1),'b')
plot(Diameter,AWOSBurst(:,2),'g')
plot(Diameter,LocalBurst(:,2),'k')
legend('AWOS Standard','Local Standard','AWOS Method','Local Method','Location','Southeast')
hold off

figure(2)
hold on
grid on 
title 'Burst Diameter vs. Burst Altitude in meters'
xlabel 'meters'
ylabel 'meters'
plot(Diameter,AWOSBurst(:,3),'r')
plot(Diameter,LocalBurst(:,3),'b')
plot(Diameter,AWOSBurst(:,4),'g')
plot(Diameter,LocalBurst(:,4),'k')
legend('AWOS Standard','Local Standard','AWOS Method','Local Method','Location','Southeast')
hold off