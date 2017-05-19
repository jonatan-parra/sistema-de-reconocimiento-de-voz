%load('variables.mat');

function varargout = sesion(varargin)
% SESION MATLAB code for sesion.fig
%      SESION, by itself, creates a new SESION or raises the existing
%      singleton*.
%
%      H = SESION returns the handle to a new SESION or the handle to
%      the existing singleton*.
%
%      SESION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SESION.M with the given input arguments.
%
%      SESION('Property','Value',...) creates a new SESION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sesion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sesion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sesion

% Last Modified by GUIDE v2.5 19-May-2017 12:02:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sesion_OpeningFcn, ...
                   'gui_OutputFcn',  @sesion_OutputFcn, ...
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


% --- Executes just before sesion is made visible.
function sesion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sesion (see VARARGIN)

% Choose default command line output for sesion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sesion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sesion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

 % Graba segunda senal
        tiempo_grabacion = 2;

        frecuencia_sonido = 44100;
        
        % Preparando para grabar sonido. 
grabacion = audiorecorder(frecuencia_sonido, 24, 1); %  audiorecorder(Fs,nBits,nChannels)
                                                 
% Mensajes por consola para marcar inicio y final de la grabacion

grabacion.StartFcn = 'disp('' iniciando grabaci�n '')';
grabacion.StopFcn = 'disp('' grabaci�n finalizada '')';

        
        
        input (' Presione enter para grabar la segunda senal')  
        
        recordblocking(grabacion, tiempo_grabacion);
        sonido2 = grabacion.getaudiodata();

        % Guarda el sonido en formato wav
        audiowrite ( 'grabaciones/grabacion2.wav', sonido2, frecuencia_sonido );    
        input ( 'Senal 2 capturada' );

        % temporalmente se estan leyendo los audios
        sonido1 = audioread('grabaciones/grabacion1.wav');
        sonido2 = audioread('grabaciones/grabacion2.wav');

        %sonido1 = audioread('grabaciones/grabacion1.wav');
        input ( 'Presione enter para escuchar la primera grabacion' );
        sound ( sonido1, frecuencia_sonido );


        input ( 'Presione enter para escuchar la segunda grabacion' );
        sound ( sonido2, frecuencia_sonido );
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 sonido1 = normalizar(sonido1);
        voz1 = abs(fft (sonido1)); % Se obtiene la transforma de fourier de la primera grabacion
        voz1 = voz1.*conj(voz1); % Se obtiene el conjugado
        voz1f = voz1 (1:100); % Solo acepta las frecuencia arriba de 100Hz
        voz1fn = voz1f/sqrt(sum (abs (voz1f).^2)); % Se normaliza el vector

        sonido2 = normalizar(sonido2);
        voz2 = abs(fft (sonido2)); % Se obtiene la transforma de fourier de la primera grabacion
        voz2 = voz2.*conj(voz2); % Se obtiene el conjugado
        voz2f = voz2 (1:100); % Solo acepta las frecuencia arriba de 100Hz
        voz2fn = voz2f/sqrt(sum (abs (voz2f).^2)); % Se normaliza el vector

        disp('Diferencia fft (transformada de fourier)');
        disp(mean(abs(voz1-voz2)));

        % Correlacion de pearson  http://www.monografias.com/trabajos85/coeficiente-correlacion-karl-pearson/coeficiente-correlacion-karl-pearson.shtml
        disp('Correlacion de Pearson');
        disp(corr(voz1, voz2 ));

        disp('Coeficiente de error entre ambas grabaciones:')
        error(1) = mean(abs(voz2-voz1));
        disp(error(1))

        disp('entrandod graficas')
        figure(1)   
        
        subplot(2,4,1),plot(sonido1); % Relacion de posicion de la grafica
        title ('Grabacion 1')

        subplot(2,4,2), plot(voz1fn); % Espectro de la grabacion 1
        title ('Espectro de la grabacion 1');

        subplot(2,4,3),plot(sonido2); % Relacion de posicion de la grafica
        title ('Grabacion 2')

        subplot(2,4,4), plot(voz2fn); % Espectro de la grabacion 1
        title ('Espectro de la grabacion 2');
        
        
        subplot(2,4,5), title('algo') ; % Espectro de la grabacion 1
        title ('Login');
        
        
        disp('salio graficas')
        
        if corr(voz1, voz2 )< 0.4
            disp('No se pudo iniciar sesion')
        else
            disp('Se pudo iniciar')
        end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
