%Calculates the air density based on indicated density altitude

function rho = DenAltDen(DensityAlt,CurrentAlt)

% Constant Generation
[A, ~, ~, D] = StandAtmo1976(0,288.15,101325);

end