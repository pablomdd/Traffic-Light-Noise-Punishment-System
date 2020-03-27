%Final
clear all;

%Inicializacion del Arduino

% PINES
%-----ENTRADAS---
%  SONIDO


%   NUMERO DE COCHES (DIP SWITCH)
%   dipPins[] = {2, 3, 4, 5}; DIGITALES

%-----SALIDAS----
%D11    LED ROJO
%D12    LED VERDE

sisFuzzy = readfis('Toobox_traffic_lights.fis');

%Calibracion

%Inicio del Programa
delete(instrfind({'port'},{'COM7'}));
a=arduino('COM7','uno');
disp('Este programa fue desarrollado con el fin de:');
disp('Si pitas, semaforo rojo');
disp('Proyecto Logica difusa');
pause(5)
while(true)
    %Semaforo inicia en verde
    
    disp('Lectura de datos');
    pause(2);
    writeDigitalPin(a, 'D2', 0);
    writeDigitalPin(a, 'D3', 1);
    pause(4)
    writeDigitalPin(a, 'D3', 0);
    writeDigitalPin(a,'D4',1);
    pause(2)
    writeDigitalPin(a,'D4',0);
    %PULSADORES SONIDO
    estadoB=readDigitalPin(a,'D8');
    estadoC=readDigitalPin(a,'D9');
    estadoD=readDigitalPin(a,'D10');
    %ESTADO B
    
    estadoB=17
    Sensor_sonido=readVoltage(a,'A0');
    Sensor_sonido=Sensor_sonido*5
    [tiempoSemaforo] = evalfis([estadoB,Sensor_sonido],sisFuzzy)
    writeDigitalPin(a, 'D2', 1);
    writeDigitalPin(a, 'D3', 0);
    pause(tiempoSemaforo);

    writeDigitalPin(a, 'D2', 0);
    writeDigitalPin(a, 'D3', 1);
    pause(4)
    writeDigitalPin(a, 'D3', 0);
    writeDigitalPin(a,'D4',1);
    pause(2)
    writeDigitalPin(a,'D4',0);
    
    %ESTADO C
    estadoC=8
    Sensor_sonido=readVoltage(a,'A0');
    Sensor_sonido=Sensor_sonido*1.5
    [tiempoSemaforo] = evalfis([estadoC,Sensor_sonido],sisFuzzy)
    writeDigitalPin(a, 'D2', 1);
    writeDigitalPin(a, 'D3', 0);
    pause(tiempoSemaforo);
    pause(1)
    
    writeDigitalPin(a, 'D2', 0);
    writeDigitalPin(a, 'D3', 1);
    pause(4)
    writeDigitalPin(a, 'D3', 0);
    writeDigitalPin(a,'D4',1);
    pause(2)
    writeDigitalPin(a,'D4',0);
    
    %ESTADO D
    estadoD=2
    Sensor_sonido=readVoltage(a,'A0')
    Sensor_sonido=Sensor_sonido-0.7;
    [tiempoSemaforo] = evalfis([estadoD,Sensor_sonido],sisFuzzy)
    writeDigitalPin(a, 'D2', 1);
    writeDigitalPin(a, 'D3', 0);
    pause(tiempoSemaforo);
    pause(1)
    
    %Se manda a llamar el Toolbox
    % Semaforo se pone en Rojo
    
end
