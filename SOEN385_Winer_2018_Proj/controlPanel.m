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

% Last Modified by GUIDE v2.5 06-Apr-2018 20:49:01

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



function load_a_model(model)
    load_system(model)
    open(model);
    sim(model)

% --- Executes on button press in partA.
function partA_Callback(hObject, eventdata, handles)
% hObject    handle to partA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    model = 'questionA';
    load_a_model(model)

% --- Executes on button press in partB.
function partB_Callback(hObject, eventdata, handles)
% hObject    handle to partB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    model = 'questionB';
    load_a_model(model)

% --- Executes on button press in partC.
function partC_Callback(hObject, eventdata, handles)
% hObject    handle to partC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    model = 'questionC';
    load_a_model(model);