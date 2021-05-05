%Takes the Balloon Volume (cubuc meters), density of air (kg/m^3), free
%lift (N), and air temperature (K) to calculate the ascent rate of the
%balloon based on a spherical drag model
function Speed = Balloon_AscentRate(BV,pAir,freelift,airtemp) 
% Constants
mu0 = 1.716e-5; %N·s/m2 for air
T0 = 273; %Kelvin for air
Smu = 111; %Kelvin for air

%% Conversions
T = airtemp; %Kelvin 

%% Calculations
mu = mu0*( (T./T0).^(3/2) .* (T0+Smu)./(T+Smu) ); %Sutherland's Law to get viscosty
area = (pi*(BV./pi*3/4).^(2/3));
diameter = 2*(BV./pi.*0.75).^(1/3);
Speed = 5*ones(size(BV)); %m/s starting value for iterative process
 
for n = 1:10
    Re = pAir.*Speed.*diameter./(mu); %Reynolds Number Calculation
    Cd = 24./Re + (2.6*(Re./5))./(1+(Re./5).^1.52) + (.411*(Re./263000).^-7.94)./(1+(Re./263000).^-8.00) + (Re.^0.80)./461000;
    Speed = sqrt((2*(freelift))./(pAir.*area.*Cd)); %reversed Cd calculation to get speed
end

end