% Preparar el entorno
close all;
clear all; % Borra las variables del archivo
clc; % Borra toda la pantalla 

% tiempo de grabacion
% tiempo_grabacion = input('¿Cuantos segundos quiere grabar?')
tiempo_grabacion = 2;

% Frecuencia de la senal
% tiempo_grabacion = input('¿Cuantos segundos quiere grabar?')
frecuencia_sonido = 44100;

% Preparando para grabar sonido. Verificar que son el segundo y tercer parametro
grabacion = audiorecorder(frecuencia_sonido, 24, 1); 

% Mensajes por consola para marcar inicio y final de la grabacion
grabacion.StartFcn = 'disp('' iniciando grabación '')';
grabacion.StopFcn = 'disp('' grabación finalizada '')';

% Se inicia el programa segun la configuracion anterior

% Graba primera senal
input ('Presione enter para grabar la primera senal');
recordblocking(grabacion, tiempo_grabacion);
sonido1 = grabacion.getaudiodata();

% Guarda el sonido en formato wav
%audiowrite (sonido1, frecuencia_sonido, 'grabacion1');
audiowrite ('grabacion1.wav', sonido1, frecuencia_sonido );
%which 'grabacion1.wav'; % Muestra la ubicacion del archivo
input ('Senal capturada');

% Graba segunda senal
input (' Presione enter para grabar la segunda senal')
recordblocking(grabacion, tiempo_grabacion);
sonido2 = grabacion.getaudiodata();

% Guarda el sonido en formato wav
audiowrite ('grabacion2.wav', sonido2, frecuencia_sonido );
input ('Senal 2 capturada');

input ('Presione enter para escuchar la primera grabacion');
sound(sonido1, frecuencia_sonido);

input ('Presione enter para escuchar la segunda grabacion');
sound(sonido2, frecuencia_sonido);


























