He = zeros(1,5);
He(1) = HeliumMassCalc(2200,0100,73.4,32.9,41.42528122/1000); %200L Tank 
He(2) = HeliumMassCalc(300,0100,73.4,68.5,48.99/1000); %300L Tank
He(3) = HeliumMassCalc(440,0100,75.02,68.54,48.99/1000); %300L Tank
He(4) = HeliumMassCalc(2700,2100,60.2,30.2,48.99/1000); %300L Tank
He(5) = HeliumMassCalc(2100,0200,60.2,30.2,43.89/1000); %200L Tank

B1 = sum(He(1:3));
B2 = sum(He(3:5));