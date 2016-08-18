function varargout = BalloonGUI(varargin)
% BALLOONGUI MATLAB code for BalloonGUI.fig
%      BALLOONGUI, by itself, creates a new BALLOONGUI or raises the existing
%      singleton*.
%
%      H = BALLOONGUI returns the handle to a new BALLOONGUI or the handle to
%      the existing singleton*.
%
%      BALLOONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BALLOONGUI.M with the given input arguments.
%
%      BALLOONGUI('Property','Value',...) creates a new BALLOONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BalloonGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BalloonGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BalloonGUI

% Last Modified by GUIDE v2.5 18-Aug-2016 17:26:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BalloonGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @BalloonGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BalloonGUI is made visible.
function BalloonGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BalloonGUI (see VARARGIN)

% Choose default command line output for BalloonGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes BalloonGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BalloonGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function DuctTapeFactor_Callback(hObject, eventdata, handles)
% hObject    handle to DuctTapeFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DuctTapeFactor as text
%        str2double(get(hObject,'String')) returns contents of DuctTapeFactor as a double
DuctTapeFactor = str2double(get(hObject, 'String'));
if isnan(DuctTapeFactor)
    set(hObject, 'String', 1.1);
    errordlg('Input must be a number','Error');
end

% Save the value
handles.DuctTapeFactor = DuctTapeFactor;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function DuctTapeFactor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DuctTapeFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PayloadMass_Callback(hObject, eventdata, handles)
% hObject    handle to PayloadMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PayloadMass as text
%        str2double(get(hObject,'String')) returns contents of PayloadMass as a double
PayloadMass = str2double(get(hObject, 'String'));
if isnan(PayloadMass)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.PayloadMass = PayloadMass;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function PayloadMass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PayloadMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HeliumMass_Callback(hObject, eventdata, handles)
% hObject    handle to HeliumMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HeliumMass as text
%        str2double(get(hObject,'String')) returns contents of HeliumMass as a double
HeliumMass = str2double(get(hObject, 'String'));
if isnan(HeliumMass)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.HeliumMass = HeliumMass;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function HeliumMass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HeliumMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LocalTemp_Callback(hObject, eventdata, handles)
% hObject    handle to LocalTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LocalTemp as text
%        str2double(get(hObject,'String')) returns contents of LocalTemp as a double
LocalTemp = str2double(get(hObject, 'String'));
if isnan(LocalTemp)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.LocalTemp = LocalTemp;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function LocalTemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LocalTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LocalDewPoint_Callback(hObject, eventdata, handles)
% hObject    handle to LocalDewPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LocalDewPoint as text
%        str2double(get(hObject,'String')) returns contents of LocalDewPoint as a double
LocalDewPoint = str2double(get(hObject, 'String'));
if isnan(LocalDewPoint)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.LocalDewPoint = LocalDewPoint;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function LocalDewPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LocalDewPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LocalPress_Callback(hObject, eventdata, handles)
% hObject    handle to LocalPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LocalPress as text
%        str2double(get(hObject,'String')) returns contents of LocalPress as a double
LocalPress = str2double(get(hObject, 'String'));
if isnan(LocalPress)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.LocalPress = LocalPress;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function LocalPress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LocalPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AWOSTemp_Callback(hObject, eventdata, handles)
% hObject    handle to AWOSTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AWOSTemp as text
%        str2double(get(hObject,'String')) returns contents of AWOSTemp as a double
AWOSTemp = str2double(get(hObject, 'String'));
if isnan(AWOSTemp)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.AWOSTemp = AWOSTemp;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function AWOSTemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AWOSTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AWOSDewPoint_Callback(hObject, eventdata, handles)
% hObject    handle to AWOSDewPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AWOSDewPoint as text
%        str2double(get(hObject,'String')) returns contents of AWOSDewPoint as a double
AWOSDewPoint = str2double(get(hObject, 'String'));
if isnan(AWOSDewPoint)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.AWOSDewPoint = AWOSDewPoint;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function AWOSDewPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AWOSDewPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AWOSPress_Callback(hObject, eventdata, handles)
% hObject    handle to AWOSPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AWOSPress as text
%        str2double(get(hObject,'String')) returns contents of AWOSPress as a double
AWOSPress = str2double(get(hObject, 'String'));
if isnan(AWOSPress)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.AWOSPress = AWOSPress;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function AWOSPress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AWOSPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RangeStart_Callback(hObject, eventdata, handles)
% hObject    handle to RangeStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RangeStart as text
%        str2double(get(hObject,'String')) returns contents of RangeStart as a double
RangeStart = str2double(get(hObject, 'String'));
if isnan(RangeStart)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.RangeStart = RangeStart;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function RangeStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RangeStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RangeStep_Callback(hObject, eventdata, handles)
% hObject    handle to RangeStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RangeStep as text
%        str2double(get(hObject,'String')) returns contents of RangeStep as a double
RangeStep = str2double(get(hObject, 'String'));
if isnan(RangeStep)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.RangeStep = RangeStep;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function RangeStep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RangeStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RangeEnd_Callback(hObject, eventdata, handles)
% hObject    handle to RangeEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RangeEnd as text
%        str2double(get(hObject,'String')) returns contents of RangeEnd as a double
RangeEnd = str2double(get(hObject, 'String'));
if isnan(RangeEnd)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.RangeEnd = RangeEnd;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function RangeEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RangeEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on Lift and none of its controls.
function Lift_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Lift (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Title_1_Callback(hObject, eventdata, handles)
% hObject    handle to Title_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function LaunchAlt_Callback(hObject, eventdata, handles)
% hObject    handle to LaunchAlt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LaunchAlt as text
%        str2double(get(hObject,'String')) returns contents of LaunchAlt as a double
LaunchAlt = str2double(get(hObject, 'String'));
if isnan(LaunchAlt)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.LaunchAlt = LaunchAlt;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function LaunchAlt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LaunchAlt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BalloonTemp_Callback(hObject, eventdata, handles)
% hObject    handle to BalloonTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BalloonTemp as text
%        str2double(get(hObject,'String')) returns contents of BalloonTemp as a double
BalloonTemp = str2double(get(hObject, 'String'));
if isnan(BalloonTemp)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.BalloonTemp = BalloonTemp;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function BalloonTemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BalloonTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes when entered data in editable cell(s) in Tank1.
function Tank1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Tank1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

data = get(hObject, 'data');
TankMass = HeliumMassCalc(data(1,1),data(1,2),data(2,1),data(2,2));
handles.Tank1 = TankMass;
guidata(hObject,handles)

% --- Executes when entered data in editable cell(s) in Tank2.
function Tank2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Tank2 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

data = get(hObject, 'data');
TankMass = HeliumMassCalc(data(1,1),data(1,2),data(2,1),data(2,2));
handles.Tank2 = TankMass;
guidata(hObject,handles)

% --- Executes on button press in RunCalcs.
function RunCalcs_Callback(hObject, eventdata, handles)
% hObject    handle to RunCalcs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


LaunchAlt = handles.LaunchAlt;
Diameter = handles.RangeStart:handles.RangeStep:handles.RangeEnd;
HeMass = handles.HeliumMass;
BalloonTemp = handles.BalloonTemp;
TotalMass = handles.PayloadMass * handles.DuctTapeFactor;
AWOSData = [LaunchAlt;handles.AWOSTemp;handles.AWOSDewPoint;handles.AWOSPress;BalloonTemp;TotalMass];
[AWOSLift AWOSBurst AWOSSpeed AWOSDelta] = AWOSMethod(AWOSData,Diameter,HeMass);
LocalData = [LaunchAlt;handles.AWOSTemp;handles.AWOSDewPoint;handles.LocalPress;BalloonTemp;TotalMass];
[LocalLift LocalBurst LocalSpeed LocalDelta] = LocalMethod(LocalData,Diameter,HeMass);

Weight = [handles.PayloadMass;TotalMass]*2.2046226218;

handles.AWOSBurst = AWOSBurst;
handles.LocalBurst = LocalBurst;

set(handles.Lift,'data',[AWOSLift, LocalLift])
set(handles.Delta,'data',[AWOSDelta, LocalDelta])
set(handles.Speed,'data',[AWOSSpeed, LocalSpeed])
set(handles.Weight,'data',[Weight])

guidata(hObject,handles)


% --- Executes on button press in GenPlots.
function GenPlots_Callback(hObject, eventdata, handles)
% hObject    handle to GenPlots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Diameter = handles.RangeStart:handles.RangeStep:handles.RangeEnd;
AWOSBurst = handles.AWOSBurst;
LocalBurst = handles.LocalBurst;

axes(handles.FeetAltDiameter)
cla;
hold on
grid on 
title 'Burst Diameter vs. Burst Altitude'
xlabel 'meters'
ylabel 'feet'
plot(Diameter,AWOSBurst(:,1),'r')
plot(Diameter,LocalBurst(:,1),'b')
plot(Diameter,AWOSBurst(:,2),'g')
plot(Diameter,LocalBurst(:,2),'k')
legend('AWOS Standard','Local Standard','AWOS Method','Local Method','Location','Southeast')
hold off

axes(handles.MeterAltDiameter)
cla;
hold on
grid on 
title 'Burst Diameter vs. Burst Altitude in meters'
xlabel 'meters'
ylabel 'meters'
plot(Diameter,AWOSBurst(:,3),'r')
plot(Diameter,LocalBurst(:,3),'b')
plot(Diameter,AWOSBurst(:,4),'g')
plot(Diameter,LocalBurst(:,4),'k')
legend('AWOS Standard','Local Standard','AWOS Method','Local Method','Location','Southeast')
hold off

% --- Executes on button press in HeliumTankCalc.
function HeliumTankCalc_Callback(hObject, eventdata, handles)
% hObject    handle to HeliumTankCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

TankMass1 = handles.Tank1;
TankMass2 = handles.Tank2;
HeliumTankMass = TankMass1 + TankMass2;
set(handles.HeliumTankMass, 'String', HeliumTankMass )


% --- Executes on key press with focus on Tank1 and none of its controls.
function Tank1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Tank1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on Tank2 and none of its controls.
function Tank2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Tank2 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
