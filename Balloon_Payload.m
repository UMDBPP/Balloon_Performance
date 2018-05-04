%if the payload ns a parent, position is zero and the parent field should
%be left as 'none', 'zero', or 'n/a'.
%the ready field is used in some mass calcations to incldue (true) or 
%exclude (false) in totaling calculations. 
classdef Balloon_Payload
    properties
        name
        ready
        mass
        parent
        position
        %properties
    end
    methods
        function Module = Balloon_Payload(name,ready,mass,parent,position)
            %Since character vectors and strings are acceptable for names
            %and parents, current checking is diabled
            %if isstring(name) == true 
                Module.name = name;
            %else
            %    disp('name must be a string')
            %end
                  
            assert(islogical(ready),'Balloon_Payload:ReadyNotLogical','ready must be a logical')
            
            Module.mass = mass;
            
            %if isstring(parent) == true 
                Module.parent = parent; %if parent, use 'none', 'zero', or 'n/a'
            %else
            %    disp('parent must be a string')
            %end
            
            Module.position = position; %if parent, use zero
        end
        %methods
    end
end
