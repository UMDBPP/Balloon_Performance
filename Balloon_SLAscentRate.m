%Takes the Balloon Volume (cubuc meters), density of air (kg/m^3), lift
%delta (N), and weight (N) to calculate the sea level ascent rate of the
%balloon.
function Speed = Balloon_SLAscentRate(BV,pAir,liftdelta,weight_N) 

%A lot of other preditiction programs seems to assume that the acsent rate
%is constant, so I will assume that the acsent rate at launch is constant
Speed = [5;5]; %m/s second starting value for interative process
hamburgerFactor = 0.4; %Balloon flattens in flow, increaseing area
for n = 1:10
    area = (pi*(BV./pi*3/4).^(2/3)) .* hamburgerFactor .* Speed; %drag area of balloon
    Re = pAir.*Speed.*(BV./pi.*0.75).^(1/3)./(1.85e-5);
    Cd = 24./Re + (2.6*(Re./5))./(1+(Re./5).^1.52) + (.411*(Re./263000).^-7.94)./(1+(Re./263000).^-8.00) + (Re.^0.80)./461000;
    Speed = sqrt((2*(liftdelta))./(pAir.*((area.*Cd)+((.09*weight_N/g0)*1.05)))); %adding addtional drag area+Cd from payload mass
end

end
