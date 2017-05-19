


function varargout = registro(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @registro_OpeningFcn, ...
                   'gui_OutputFcn',  @registro_OutputFcn, ...
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


% --- Executes just before registro is made visible.
function registro_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes registro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = registro_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% Preparando para grabar sonido. 
tiempo_grabacion = 2;

frecuencia_sonido = 44100;

grabacion = audiorecorder(frecuencia_sonido, 24, 1); %  audiorecorder(Fs,nBits,nChannels)
                                                 
% Mensajes por consola para marcar inicio y final de la grabacion

grabacion.StartFcn = 'disp('' iniciando grabaci�n '')';
grabacion.StopFcn = 'disp('' grabaci�n finalizada '')';

input ('Presione enter para grabar la primera senal');
        recordblocking(grabacion, tiempo_grabacion);
        sonido1 = grabacion.getaudiodata();
        % Guarda el sonido en formato wav
        audiowrite ('grabaciones/grabacion1.wav', sonido1, frecuencia_sonido );
        %which 'grabacion1.wav'; % Muestra la ubicacion del archivo
        input ('Senal capturada');

        
