function varargout = mensaje_confirmacion(varargin)
% MENSAJE_CONFIRMACION MATLAB code for mensaje_confirmacion.fig
%      MENSAJE_CONFIRMACION, by itself, creates a new MENSAJE_CONFIRMACION or raises the existing
%      singleton*.
%
%      H = MENSAJE_CONFIRMACION returns the handle to a new MENSAJE_CONFIRMACION or the handle to
%      the existing singleton*.
%
%      MENSAJE_CONFIRMACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENSAJE_CONFIRMACION.M with the given input arguments.
%
%      MENSAJE_CONFIRMACION('Property','Value',...) creates a new MENSAJE_CONFIRMACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mensaje_confirmacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mensaje_confirmacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mensaje_confirmacion

% Last Modified by GUIDE v2.5 19-May-2017 12:45:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mensaje_confirmacion_OpeningFcn, ...
                   'gui_OutputFcn',  @mensaje_confirmacion_OutputFcn, ...
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


% --- Executes just before mensaje_confirmacion is made visible.
function mensaje_confirmacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mensaje_confirmacion (see VARARGIN)

% Choose default command line output for mensaje_confirmacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mensaje_confirmacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mensaje_confirmacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
