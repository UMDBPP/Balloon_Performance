%Converts from one unit type to another. Unit types:
%meters = m, feet = ft, 
%Celcius = C, Fahrenheit = F, Kelvin = K, Rankin = R,
%Pascals = Pa, pounds per square inch = psi,
%pounds(force only) = lb, newtons = N 
function newNumber = unitconverter(number,oldUnit,newUnit)
%%distance
if strcmp(oldUnit,'m') && strcmp(newUnit,'ft')
    newNumber = number./0.3048;
end

if strcmp(oldUnit,'ft') && newUnit == 'm'
    newNumber = number.*0.3048;
end

%% temperature
if oldUnit == 'F'
    if newUnit == 'C'
        newNumber = (number-32).*5/9;
    elseif newUnit == 'K'
        newNumber = (number-32).*5/9+273.15;
    elseif newUnit == 'R'
        newNumber = number + 459.67;
    end
end

if oldUnit == 'C'
    if newUnit == 'F'
        newNumber = (number.*9/5)+32;
    elseif newUnit == 'K'
        newNumber = number+273.15;
    elseif newUnit == 'R'
        newNumber = (number.*9/5)+32 + 459.67;
    end
end

if oldUnit == 'K'
    if newUnit == 'F'
        newNumber = ((number-273.15).*9/5)+32;
    elseif newUnit == 'C'
        newNumber = number-273.15;
    elseif newUnit == 'R'
        newNumber = (number.*9/5);
    end
end

if oldUnit == 'R'
    if newUnit == 'F'
        newNumber = number + 459.67;
    elseif newUnit == 'C'
        newNumber = (number.*5/9)+273.15;
    elseif newUnit == 'K'
        newNumber = (number.*5/9);
    end
end

%% Pressure
if strcmp(oldUnit,'Pa') && strcmp(newUnit,'psi')
    newNumber = number/6894.75728;
end

if strcmp(oldUnit,'psi') && strcmp(newUnit,'Pa')
    newNumber = number*6894.75728;
end

%% Force
if strcmp(oldUnit,'lb') && newUnit == 'N'
    newNumber = number.*4.4482216;
end

if strcmp(oldUnit,'N') && strcmp(newUnit,'lb')
    newNumber = number./4.4482216;
end


%% Check to see if got converted
if exist('newNumber','var') == 0
    newNumber = number;
    disp('Invalid or Unsupported Conversion')
elseif exist('newNumber','var') == 1
end
%end of function
end
