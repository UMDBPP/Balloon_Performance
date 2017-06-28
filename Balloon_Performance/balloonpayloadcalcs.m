%Loads Data from a launch data text file and performs a more in depth
%analisys
%Todo: 
%encorporate teardrop formula 
%Convert atmo pressures to inHg
%Make the Methods "Dumber" (single output)
%Use Satalite Sounding Data for Atmospheric Tables
%Add Wiiboard Bluetooth capability

function balloonpayloadcalcs()
%% Data Input
%loading data

FileName = uigetfile({'*.txt';'*.m';'*.*'},'File Selector');
File = fopen(FileName,'r');
FileData = fscanf(File,'%f\n',[1 Inf]);
fclose(File);
if (length(FileData) == 22)
        
    %Building data sets
    WeatherData = [FileData(1:3)', FileData(4:6)' ];
    PlotData = FileData(7:9)';
    LaunchData = FileData(10:14)';
    Tank1 = [FileData(15:16)', FileData(17:18)'];
    Tank2 = [FileData(19:20)', FileData(21:22)'];
        
    else
    disp('Invalid File Selected')
end

%File Format Cheat Sheet
%AWOSTemp (C)
%AWOSDewPoint (C)
%AWOSPressure (inHg)
%LocalTemp (C)
%LocalDewPoint (C)
%LocalPres (mbar)
%DiameterStart
%DiameterStep
%DiameterEnd
%LaunchAlt (meters)
%BalloonTemp (Fahrenheit)
%HeliumMass (kg)
%TotalMass (kg)
%DuctTapeFactor
%Tank1PressStart
%Tank1TempStart
%Tank1PressEnd
%Tank1TempEnd
%Tank2PressStart
%Tank2TempStart
%Tank2PressEnd
%Tank2TempEnd

HeMassTank = HeliumMassCalc(Tank1(1,1),Tank1(1,2),Tank1(2,1),Tank1(2,2)) + HeliumMassCalc(Tank2(1,1),Tank2(1,2),Tank2(2,1),Tank2(2,2));

Diameter = PlotData(1):PlotData(2):PlotData(3);

AWOSTemp = WeatherData(1,1); %(C)
AWOSDewPoint = WeatherData(2,1); %(C)
AWOSPress = WeatherData(3,1); %(inHg)
LocalTemp = WeatherData(1,2); %(F)
LocalDewPoint = WeatherData(2,2); %(F)
LocalPress = WeatherData(3,2); %(mbar)

LaunchAlt = LaunchData(1); %(meters)
BalloonTemp = LaunchData(2); %(Fahrenheit)
HeMass = LaunchData(3); %(kg)
TotalMass = LaunchData(4); %(kg)
DuctTapeFactor = LaunchData(5);

TotalMassFactor = TotalMass*DuctTapeFactor;



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

%% Function Call Layer

LocalData = [LaunchAlt;LocalTemp;LocalDewPoint;LocalPress;BalloonTemp;TotalMass];
[LocalLift, LocalBurst, LocalSpeed, LocalDelta,] = LocalMethod(LocalData,Diameter,HeMass);

AWOSData = [LaunchAlt;AWOSTemp;AWOSDewPoint;AWOSPress;BalloonTemp;TotalMass];
[AWOSLift, AWOSBurst, AWOSSpeed, AWOSDelta] = AWOSMethod(AWOSData,Diameter,HeMass);


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
end
