function varargout = controlPanel(varargin)
% CONTROLPANEL MATLAB code for controlPanel.fig
%      CONTROLPANEL, by itself, creates a new CONTROLPANEL or raises the existing
%      singleton*.
%
%      H = CONTROLPANEL returns the handle to a new CONTROLPANEL or the handle to
%      the existing singleton*.
%
%      CONTROLPANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROLPANEL.M with the given input arguments.
%
%      CONTROLPANEL('Property','Value',...) creates a new CONTROLPANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before controlPanel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to controlPanel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help controlPanel

% Last Modified by GUIDE v2.5 10-Apr-2018 13:15:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @controlPanel_OpeningFcn, ...
                   'gui_OutputFcn',  @controlPanel_OutputFcn, ...
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


% --- Executes just before controlPanel is made visible.
function controlPanel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to controlPanel (see VARARGIN)

% Choose default command line output for controlPanel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes controlPanel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = controlPanel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



clc;
    
% --- Executes on button press in partAbutton.
function partAbutton_Callback(hObject, eventdata, handles)
% hObject    handle to partAbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    model = 'questionA';
    open_and_load_system(model)
    %thetaValue = guidata('ThetaInput');
    %phiValue = guidata('PhiInput');
    phiValue = handles.PhiInput;
    thetaValue = handles.ThetaInput;
    guidata(hObject, handles);

    %thetaValue = str2double(thetaVal);
    %phiValue = str2double(phiVal);
    set_param('questionA/Constant1', 'value', num2str(thetaValue));
    set_param('questionA/Constant', 'value', num2str(phiValue));
    %uisave({thetaValue,phiValue},'coordinateValues');
    
    %getting user inputs for PID values and Time delayed
    p=get(handles.Pvalue,'String');
    i=get(handles.Ivalue,'String');
    d=get(handles.Dvalue,'String');
    t=get(handles.Tvalue,'String');
    %determining which controller to use
    if(and(str2double(p)~=0, str2double(i)~=0))
        if(str2double(d)~=0)
            blk = tunablePID('pidblock','PID', str2double(t));
            set_param('questionA/PID Controller','P', p);
            set_param('questionA/PID Controller1','P', p);
            set_param('questionA/PID Controller','I', i);
            set_param('questionA/PID Controller1','I', i);
            set_param('questionA/PID Controller','D', d);
            set_param('questionA/PID Controller1','D', d);
        else
            blk = tunablePID('piblock','PI', str2double(t));
            set_param('questionA/PID Controller','P', p);
            set_param('questionA/PID Controller1','P', p);
            set_param('questionA/PID Controller','I', i);
            set_param('questionA/PID Controller1','I', i);
        end
    end
    
    if(and(str2double(p)~=0, str2double(d)~=0))
        if(str2double(i)==0)
            blk = tunablePID('pdblock','PD', str2double(t));
            set_param('questionA/PID Controller','P', p);
            set_param('questionA/PID Controller1','P', p);
            set_param('questionA/PID Controller','D', d);
            set_param('questionA/PID Controller1','D', d);
        end
    end
    if(and(str2double(p)~=0, str2double(i)==0))
        if(str2double(d)==0)
            blk = tunablePID('pblock','P', str2double(t));
            set_param('questionA/PID Controller','P', p);
            set_param('questionA/PID Controller1','P', p);
        end
    end
    sim(model);

% --- Executes on button press in partBbutton.
function partBbutton_Callback(hObject, eventdata, handles)
% hObject    handle to partBbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    model = 'questionB';
    open_and_load_system(model)
    %thetaValue = guidata('ThetaInput');
    %phiValue = guidata('PhiInput');
    phiValue = handles.PhiInput;
    thetaValue = handles.ThetaInput;
    guidata(hObject, handles);

    %thetaValue = str2double(thetaVal);
    %phiValue = str2double(phiVal);
    set_param('questionB/Constant1', 'value', num2str(thetaValue));
    set_param('questionB/Constant', 'value', num2str(phiValue));
    %uisave({thetaValue,phiValue},'coordinateValues');
    
    %getting user inputs for PID values and Time delayed
    p=get(handles.Pvalue,'String');
    i=get(handles.Ivalue,'String');
    d=get(handles.Dvalue,'String');
    t=get(handles.Tvalue,'String');
    %determining which controller to use
    if(and(str2double(p)~=0, str2double(i)~=0))
        if(str2double(d)~=0)
            blk = tunablePID('pidblock','PID', str2double(t));
            set_param('questionB/PID Controller','P', p);
            set_param('questionB/PID Controller2','P', p);
            set_param('questionB/PID Controller','I', i);
            set_param('questionB/PID Controller2','I', i);
            set_param('questionB/PID Controller','D', d);
            set_param('questionB/PID Controller2','D', d);
        else
            blk = tunablePID('piblock','PI', str2double(t));
            set_param('questionB/PID Controller','P', p);
            set_param('questionB/PID Controller2','P', p);
            set_param('questionB/PID Controller','I', i);
            set_param('questionB/PID Controller2','I', i);
        end
    end
    
    if(and(str2double(p)~=0, str2double(d)~=0))
        if(str2double(i)==0)
            blk = tunablePID('pdblock','PD', str2double(t));
            set_param('questionB/PID Controller','P', p);
            set_param('questionB/PID Controller2','P', p);
            set_param('questionB/PID Controller','D', d);
            set_param('questionB/PID Controller2','D', d);
        end
    end
    if(and(str2double(p)~=0, str2double(i)==0))
        if(str2double(d)==0)
            blk = tunablePID('pblock','P', str2double(t));
            set_param('questionB/PID Controller','P', p);
            set_param('questionB/PID Controller2','P', p);
        end
    end
    sim(model);
    

% --- Executes on button press in partCbutton.
function partCbutton_Callback(hObject, eventdata, handles)
% hObject    handle to partCbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    model = 'questionC';
    open_and_load_system(model)
    %thetaValue = guidata('ThetaInput');
    %phiValue = guidata('PhiInput');
    phiValue = handles.PhiInput;
    thetaValue = handles.ThetaInput;
    guidata(hObject, handles);

    %thetaValue = str2double(thetaVal);
    %phiValue = str2double(phiVal);
    set_param('questionC/Constant1', 'value', num2str(thetaValue));
    set_param('questionC/Constant', 'value', num2str(phiValue));
    %uisave({thetaValue,phiValue},'coordinateValues');
    
    %getting user inputs for PID values and Time delayed
    p=get(handles.Pvalue,'String');
    i=get(handles.Ivalue,'String');
    d=get(handles.Dvalue,'String');
    t=get(handles.Tvalue,'String');
    %determining which controller to use
    if(and(str2double(p)~=0, str2double(i)~=0))
        if(str2double(d)~=0)
            blk = tunablePID('pidblock','PID', str2double(t));
            set_param('questionC/PID Controller1','P', p);
            set_param('questionC/PID Controller2','P', p);
            set_param('questionC/PID Controller1','I', i);
            set_param('questionC/PID Controller2','I', i);
            set_param('questionC/PID Controller1','D', d);
            set_param('questionC/PID Controller2','D', d);
        else
            blk = tunablePID('piblock','PI', str2double(t));
            set_param('questionC/PID Controller1','P', p);
            set_param('questionC/PID Controller2','P', p);
            set_param('questionC/PID Controller1','I', i);
            set_param('questionC/PID Controller2','I', i);
        end
    end
    
    if(and(str2double(p)~=0, str2double(d)~=0))
        if(str2double(i)==0)
            blk = tunablePID('pdblock','PD', str2double(t));
            set_param('questionC/PID Controller1','P', p);
            set_param('questionC/PID Controller2','P', p);
            set_param('questionC/PID Controller1','D', d);
            set_param('questionC/PID Controller2','D', d);
        end
    end
    if(and(str2double(p)~=0, str2double(i)==0))
        if(str2double(d)==0)
            blk = tunablePID('pblock','P', str2double(t));
            set_param('questionC/PID Controller1','P', p);
            set_param('questionC/PID Controller2','P', p);
        end
    end
    sim(model);





function Pvalue_Callback(hObject, eventdata, handles)
% hObject    handle to Pvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pvalue as text
pValue = str2double(get(hObject,'String')); % returns contents of Pvalue as a double

% --- Executes during object creation, after setting all properties.
function Pvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ivalue_Callback(hObject, eventdata, handles)
% hObject    handle to Ivalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ivalue as text
iValue = str2double(get(hObject,'String')); % returns contents of Ivalue as a double

% --- Executes during object creation, after setting all properties.
function Ivalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ivalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Dvalue_Callback(hObject, eventdata, handles)
% hObject    handle to Dvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Dvalue as text
dValue = str2double(get(hObject,'String')); % returns contents of Dvalue as a double


% --- Executes during object creation, after setting all properties.
function Dvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tvalue_Callback(hObject, eventdata, handles)
% hObject    handle to Tvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tvalue as text
tValue = str2double(get(hObject,'String')); % returns contents of Tvalue as a double


% --- Executes during object creation, after setting all properties.
function Tvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function open_and_load_system(model)
    open_system(model);
    load_system(model);
    




function ThetaInput_Callback(hObject, eventdata, handles)
% hObject    handle to ThetaInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ThetaInput as text
ThetaVal= str2double(get(hObject,'String')); % returns contents of ThetaInput as a double

% Save the new theta value
handles.ThetaInput = ThetaVal;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function ThetaInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ThetaInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PhiInput_Callback(hObject, eventdata, handles)
% hObject    handle to PhiInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PhiInput as text
phiValue = str2double(get(hObject,'String')); % returns contents of PhiInput as a double

% Save the new theta value
handles.PhiInput = phiValue;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function PhiInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PhiInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
