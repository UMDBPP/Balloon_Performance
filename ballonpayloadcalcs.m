%Burst at 100,000ft
%Using a 3000g balloon 
%Diameter: 00.00 meters approx.
clear all
close all
%% Data Input Layer 
%This is not a function, conversion handled in functions

LaunchAlt = 180; %meters

LocalTemp = 75.80; %Fahrenheit
LocalDewPoint = 68.77;
LocalPres = 991.60; %mbar

AWOSTemp = 23; %Celcius 
AWOSDewPoint = 21;
AWOSPres = 29.97; %inHg


BalloonTemp = 75.3; %Fahrenheit
TankData = [2750, 0100, 75.5, 53.2; %PSI,PSI,F,F
            1600, 0050, 74.5, 57.3]; %PSI,PSI,F,F
HeMass = HeliumMassCalc(TankData(1,1),TankData(1,2),TankData(1,3),TankData(1,4)) + HeliumMassCalc(TankData(2,1),TankData(2,2),TankData(2,3),TankData(2,4));
%HeMass = 1.90;

Diameter = 10.5:.1:14.5; %meters

%In Grams now
PayloadString = [   3.000   %Balloon 6.62 lbs
                    0.794   %Helios 1.75 lbs
                    0.900   %Parachute 1.98 lbs
                    2.100   %Command 
                    0.650   %Cloud 360 
                    0.400   %Mini Bach's Box
                    0.300   %IRENE .66 lbs
                    0.350   %Scorch .66 lbs
                    1.130   %HAB Scope 2.5 lbs
                    0.200   %String 3g per 1.5'
                    0.000   %Additional Margin
                    ];  
                
DuctTapeFactor = 1.1; %Weight Margin
TotalMass = sum(PayloadString)*DuctTapeFactor; %some safety factor for the weight

%% Function Call Layer

LocalData = [LaunchAlt;LocalTemp;LocalDewPoint;LocalPres;BalloonTemp;TotalMass];
[LocalLift LocalBurst LocalSpeed LocalDelta] = LocalMethod(LocalData,Diameter,HeMass);

AWOSData = [LaunchAlt;AWOSTemp;AWOSDewPoint;AWOSPres;BalloonTemp;TotalMass];
[AWOSLift AWOSBurst AWOSSpeed AWOSDelta] = AWOSMethod(AWOSData,Diameter,HeMass);


%% Results Layer
Lift = [AWOSLift LocalLift]
Delta = [AWOSDelta LocalDelta]
Speed = [AWOSSpeed LocalSpeed]
figure(1)
axes
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

axes
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