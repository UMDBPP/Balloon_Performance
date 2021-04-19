He = zeros(1,3);
He(1) = HeliumMassCalc(2200,0100,73.4,32.9,41.42528122/1000); %200L? Tank 
He(2) = HeliumMassCalc(300,0100,73.4,68.5,48.99/1000); %300L Tank
He(3) = HeliumMassCalc(440,0100,75.02,68.54,48.99/1000); %300L Tank

molarFrac = [0 1 0 0 0 0];
R_He = RCalc(molarFrac);
start1 = GasMassCalc((55.6-32)*5/9,2500,48.99/1000,R_He)
end1 = GasMassCalc((55.6-32)*5/9,100,48.99/1000,R_He)
start2 = GasMassCalc((55.6-32)*5/9,2500,48.99/1000,R_He)
end2 = GasMassCalc((55.6-32)*5/9,2500,48.99/1000,R_He)