function varargout = grabando(varargin)
% GRABANDO MATLAB code for grabando.fig
%      GRABANDO, by itself, creates a new GRABANDO or raises the existing
%      singleton*.
%
%      H = GRABANDO returns the handle to a new GRABANDO or the handle to
%      the existing singleton*.
%
%      GRABANDO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRABANDO.M with the given input arguments.
%
%      GRABANDO('Property','Value',...) creates a new GRABANDO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before grabando_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to grabando_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help grabando

% Last Modified by GUIDE v2.5 25-May-2017 16:58:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @grabando_OpeningFcn, ...
                   'gui_OutputFcn',  @grabando_OutputFcn, ...
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


% --- Executes just before grabando is made visible.
function grabando_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to grabando (see VARARGIN)

% Choose default command line output for grabando
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes grabando wait for user response (see UIRESUME)
% uiwait(handles.figure1);
disp('se abrio ventana')
times= get(handles.text3,'String' );
pause(1);
disp(1)
set(handles.text3,'String',1 );
pause(1);
disp(0)
set(handles.text3,'String',0 );

% --- Outputs from this function are returned to the command line.
function varargout = grabando_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


