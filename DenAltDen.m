%Calculates the air density based on indicated density altitude
%Input is in meters MSL
%Uses 1976 Standard Atmosphere Model
function rho = DenAltDen(DensityAlt)

% Constant Generation
[A, ~, ~, D] = StandAtmo1976(0,288.15,101325);

%interpolating to find the density
rho = interp1(A,D,DensityAlt);
end