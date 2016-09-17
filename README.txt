README for BalloonGUI and BalloonGUI2

Both programs generate a GUI for balloon perfomance calculations.
Both programs require additional functions that are called. The 
dependency is as follows:
AWOSMethod
	MoistDensity
	StandardAtmo1976
	CustomStandardAtmo1976
		MoistDensity
LocalMethod
	MoistDensity
	StandardAtmo1976
	CustomStandardAtmo1976
		MoistDensity
HeliumMassCalc

BalloonGUI is a Matlab GUIDE GUI, and must use both the .fig file 
and the .m file. It is not recommended for use
BalloonGUI2 is programmatically implemented, and is recommended for use.
Besides the functions it calls, only it is needed.

Tank Mass Calculator uses HeliumMassCalc for mass of helium. In the field,
it appears that the calculation is more than what is measured by a 
physical scale, so it should only be used as a check. 

AWOS Data is from an airport's Automated Weather Observing Station, 
usually the one closest to the launch site broadcast from the station can 
be heard by calling the phone number of the station usually listed online.

Airports and their Phones and Freqs

Hagerstown Airport
HGR 
ASOS: 126.375 (301-745-3497)

College Park Airport
CGS
AWOS: 121.225 (301-864-5497)

Montgomery Country Airpark
GAI
AWOS: 128.275 (301-977-2971)

Tipton Airport
FME
AWOS: 123.925

Baltimore Washington Thurgood Marshall Airport
BWI
ASOS: 410-691-1278

Local Data is measurements taken on-site with on-site equipment. The 
pressure reading must be absolute/station pressure, not adjusted to be sea
level pressure. Weather apps do usually give sea level pressure, so do not
use those. Commonly, a cell phone with barometer should be used. I use a 
cell phone and it's app to get pressure, temperature, and dewpoint.

Payload Weight is given in pounds

The Burst Diameter is dependent on the kind of balloon.
1600g seem to burst at 10.5, but can exceed performance and be just short of 11m
2000g are predicted to burst between 10.5m to 11.25m
3000g are predicted to burst at 12m, but actually seem to burst at 11.5m