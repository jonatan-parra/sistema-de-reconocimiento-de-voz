% Preparar el entorno
close all;
clear all; % Borra las variables del archivo
clc; % Borra toda la pantalla 

% tiempo de grabacion
% tiempo_grabacion = input('�Cuantos segundos quiere grabar?')
tiempo_grabacion = 2;

% Frecuencia de la senal
% tiempo_grabacion = input('�Cuantos segundos quiere grabar?')
frecuencia_sonido = 44100;

% Preparando para grabar sonido. Verificar que son el segundo y tercer parametro
grabacion = audiorecorder(frecuencia_sonido, 24, 1); 

% Mensajes por consola para marcar inicio y final de la grabacion
grabacion.StartFcn = 'disp('' iniciando grabaci�n '')';
grabacion.StopFcn = 'disp('' grabaci�n finalizada '')';

% Se inicia el programa segun la configuracion anterior

% Graba primera senal
input ('Presione enter para grabar la primera senal');
recordblocking(grabacion, tiempo_grabacion);
sonido1 = grabacion.getaudiodata();

% Guarda el sonido en formato wav
%audiowrite (sonido1, frecuencia_sonido, 'grabacion1');
audiowrite ('grabaciones/grabacion1.wav', sonido1, frecuencia_sonido );
%which 'grabacion1.wav'; % Muestra la ubicacion del archivo
input ('Senal capturada');

% Graba segunda senal
input (' Presione enter para grabar la segunda senal')
recordblocking(grabacion, tiempo_grabacion);
sonido2 = grabacion.getaudiodata();

% Guarda el sonido en formato wav
audiowrite ('grabaciones/grabacion2.wav', sonido2, frecuencia_sonido );
input ('Senal 2 capturada');

input ('Presione enter para escuchar la primera grabacion');
sound(sonido1, frecuencia_sonido);

input ('Presione enter para escuchar la segunda grabacion');
sound(sonido2, frecuencia_sonido);

% temporalmente se estan leyendo los audios
audio1 = audioread('grabaciones/grabacion1.wav');
audio2 = audioread('grabaciones/grabacion2.wav');

audio1 = normalizar(audio1);
voz1 = abs(fft (audio1)); % Se obtiene la transforma de fourier de la primera grabacion
voz1 = voz1.*conj(voz1); % Se obtiene el conjugado
voz1f = voz1 (1:100); % Solo acepta las frecuencia arriba de 100Hz
voz1fn = voz1f/sqrt(sum (abs (voz1f).^2)); % Se normaliza el vector

audio2 = normalizar(audio2);
voz2 = abs(fft (audio2)); % Se obtiene la transforma de fourier de la primera grabacion
voz2 = voz2.*conj(voz2); % Se obtiene el conjugado
voz2f = voz2 (1:100); % Solo acepta las frecuencia arriba de 100Hz
voz2fn = voz2f/sqrt(sum (abs (voz2f).^2)); % Se normaliza el vector

disp('Diferencia fft (transformada de fourier)');
disp(mean(abs(voz1-voz2)));

disp('Correlacion de Pearson');
disp(corr(voz1, voz2 ));

disp('Coeficiente de error entre ambas grabaciones:')
error(1) = mean(abs(voz2-voz1));
disp(error(1))

subplot(2,5,1),plot(audio1); % Relacion de posicion de la grafica
title ('Grabacion 1')

subplot(2,5,2), plot(voz1fn); % Espectro de la grabacion 1
title ('Espectro de la grabacion 1');

subplot(2,5,3),plot(audio2); % Relacion de posicion de la grafica
title ('Grabacion 2')

subplot(2,5,4), plot(voz2fn); % Espectro de la grabacion 1
title ('Espectro de la grabacion 2');
































