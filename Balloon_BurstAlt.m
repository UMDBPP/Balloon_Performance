%Returns an Altitude based on a 
function AltBurst_m = Balloon_BurstAlt(DBurst)

Vburst = 4/3*pi*(Dburst/2).^3;
AltBurst_m = zeros(length(Vburst),2); %pre alocating for speed
for n = 1:length(Vburst)
    AltBurst_m(n,1) = interp1(PdT1,A1, ((mass_kg*Rbar)./(MolarHelium*Vburst(n))) ); 
    %interpolating from the table altitdue based on P/T   ^This=P/T
end
AltBurst_m = AltBurst_m+(altadjust_m); %adjustment for pressure altitude

for n = 1:length(Vburst)
    AltBurst_m(n,2) = interp1(PdT2,A2, ((mass_kg*Rbar)./(MolarHelium*Vburst(n))) ); 
    %interpolating from the table altitdue based on P/T   ^This=P/T
end