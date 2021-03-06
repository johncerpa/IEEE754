% Limpiar pantalla
clear all;
clc;
disp('--- CONVERSION IEEE754 ---');
fprintf('1) Convertir de un numero real al formato IEEE754\n2) Convertir del formato IEEE754 a un numero real\n3) Calcular de numero real y a IEEE754 y viceversa (Muestra el error)\n');
cond = input('Digite la opcion >> ');
entrada = input('Digite el numero real a convertir > ', 's');

if (cond == 1)
    disp('Convertir de real a IEEE754');    
    dec2ieee754(entrada);
elseif (cond == 2)
    disp('Convertir de IEEE754 a real');
    ieee754todec(entrada);
elseif (cond == 3)
    valorReal = str2double(entrada);
    % Convertir valor a IEEE754
    conv754 = dec2ieee754(entrada);
    % Convertir de vuelta a decimal
    convdec = ieee754todec(conv754);
    errAbsoluto = abs(valorReal - convdec);
    errRelativo = errAbsoluto / abs(valorReal);
    fprintf('Error absoluto: %f\nError relativo: %f\n', errAbsoluto, errRelativo);
else
    disp('No escogio una opcion disponible, digite 1, 2 o 3');
end