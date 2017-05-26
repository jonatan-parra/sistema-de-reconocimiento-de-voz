function varargout = sesion(varargin)

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
% Choose default command line output for sesion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sesion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sesion_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    user= get(handles.edit1,'String' );
    if isempty(user)
        warndlg('Ingrese el nombre del usuario ', 'Mensaje');
    else
        ruta = strcat('grabaciones/',user, '.wav') 
        ruta
        if exist(ruta) == 0 % Verifica que el usuario exista
            warndlg('El usuario no existe', 'Mensaje');
        else
            % Graba segunda senal
            tiempo_grabacion = 2;
            frecuencia_sonido = 44100;
            %frecuencia_sonido = 22050;
            grabacion = audiorecorder(frecuencia_sonido, 24, 1); %  audiorecorder(Fs,nBits,nChannels)

            % Mensajes por consola para marcar inicio y final de la grabacion
            grabacion.StartFcn = 'disp('' iniciando grabación '')';
            grabacion.StopFcn = 'disp('' grabación finalizada '')';

            %input (' Presione enter para grabar la segunda senal')  
            
            set(handles.text4,'String','Grabando...' );
            recordblocking(grabacion, tiempo_grabacion);
            set(handles.text4,'String','Terminado' );
            
            sonido2 = grabacion.getaudiodata();
            %audiowrite ( 'grabaciones/grabacion2.wav', sonido2, frecuencia_sonido );    
            %input ( 'Senal 2 capturada' );

            ruta = strcat('grabaciones/',user, '.wav') 
            sonido1 = audioread(ruta);

            %input ( 'Presione enter para escuchar la primera grabacion' );
            pause(2)
            sound ( sonido1, frecuencia_sonido );

            %input ( 'Presione enter para escuchar la segunda grabacion' );
            pause(2)
            sound ( sonido2, frecuencia_sonido );

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

           % disp('Coeficiente de error entre ambas grabaciones:')
           % error(1) = mean(abs(voz2-voz1));
           % disp(error(1))

            figure(1)   
            subplot(2,3,1),plot(sonido1); % Relacion de posicion de la grafica
            title ('Grabacion 1')
            subplot(2,3,5), plot(voz1fn); % Espectro de la grabacion 1

            title ('Espectro de la grabacion 1');
            subplot(2,3,2),plot(sonido2); % Relacion de posicion de la grafica

            title ('Grabacion 2')
            subplot(2,3,4), plot(voz2fn); % Espectro de la grabacion 1

            title ('Espectro de la grabacion 2');
            
            
            Fmuestra = fft(sonido1);
            Fusuario = fft(sonido2);

            subplot(2, 3, 3)
            plot(abs(Fusuario))
            hold on
            plot(abs(Fmuestra))
            
            title('Frecuencias');
            legend('Sesión','Registrada');



            if corr(voz1, voz2 )< 0.4
                errordlg('No pudo iniciar sesion ', 'Mensaje');
            else
                msgbox('Se ha iniciado sesion!! ', 'Mensaje');
            end   
        end
    end

function edit1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
close
base;
