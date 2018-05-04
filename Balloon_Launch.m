%
%Still Experimental, in development
classdef Balloon_Launch
    properties
        Designation
        Date
        Balloon
        TotalMass
        
    end
    methods
        function NS00 = Balloon_Launch(NameData,Payloads)
            NS00.Designation = NameData(1);
            NS00.Date = NameData(2);
            NS00.Balloon = Payloads(1);
            totalmass = 0;
            for i = 1:length(Payloads)
                
            end
            
            NS00.TotalMass = totalmass;
        end
    end
    
end

