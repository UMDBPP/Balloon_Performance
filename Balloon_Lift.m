%Calculates the lift of the balloon based on 
function lift = Balloon_Lift()
% constants
g0 = 9.80665; %m/s^2

%lift calculation AWOS
pHe = (PressureAt_Pa.*MolarHelium)./(BT_K.*Rbar); %M for He and R value
pAir(1,1) = MoistDensity(Temp_K,Dewpoint_K,PressureAt_Pa,"DP");
pAir(2,1) = PressureAt_Pa.*MolarAir./(Temp_K.*Rbar); %from information
%pAir(1,1) = interp1(A1,D1,DensityAlt_m); %Pulling out density based on Altitude Density
BV = BT_K./PressureAt_Pa*mass_kg*(Rbar/MolarHelium); %using temp and press to get volume
lift = BV.*(pAir-pHe)*g0; 


%lift calculation LOCAL
pHe = (Pressure_Pa.*MolarHelium)./(BT_K.*Rbar); %M for He and R value
%pAir(1,1) = interp1(A1,D1,DensityAlt_m); %Density Altitude uses humidity, which is best
pAir(1,1) = MoistDensity(Temp_K,Dewpoint_K,Pressure_Pa,'DP');
pAir(2,1) = Pressure_Pa*MolarAir/( Temp_K*Rbar); %from Conditions

Pressure_Pa = [Pressure_Pa;Pressure_Pa];

BV = BT_K./Pressure_Pa*mass_kg*(Rbar/MolarHelium); %using temp and press to get volume
lift = BV.*(pAir-pHe)*g0; 
end
