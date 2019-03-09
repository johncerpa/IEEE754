function [conversion] = dec2ieee754(entrada)
    numeroReal = str2double(entrada);
    
    % Si no tiene decimales se convierte a binario con dec2bin()
    if (isempty(find(entrada == '.', 1)))
        binario = dec2bin(numeroReal);
        mantissa = binario(2:end);
        n = length(binario) - 1;
    else
       % Separar parte entera y decimal
        posicionPunto = find(entrada == '.');
        if (numeroReal < 0)
            parteEntera = entrada(2 : posicionPunto - 1);
        else
            parteEntera = entrada(1 : posicionPunto - 1);
        end
        parteDecimal = entrada(posicionPunto : end);
       
        % Convertir a numero para despues convertir a binario
        numEntero = str2num(parteEntera);
        numDecimal = str2double(parteDecimal);
       
        % Convertir parte entera a binario
        
        binario1 = dec2bin(numEntero);
       
        % Convertir parte decimal a binario
        cadenaTemp = '';
        temp = numDecimal;
        while (numDecimal >= 0)
            numDecimal = numDecimal * 2;
            % Cortar y detener cuando sea 1 o cuando se repita el original
            if (numDecimal == 1 || temp == numDecimal) 
                cadenaTemp = strcat(cadenaTemp, '1');
                break;
            elseif (numDecimal > 1) % Concatenar 1 y restar 1 (casos 1,algo)
                cadenaTemp = strcat(cadenaTemp, '1');
                numDecimal = numDecimal - 1;
            else % Concatenar 0 (casos 0,algo)
                cadenaTemp = strcat(cadenaTemp, '0');
            end
        end
        
        mantissa = strcat(binario1(2:end), cadenaTemp(1:end));
        n = length(binario1) - 1;
    end
    
    % Se agregan los ceros que faltan
    i = length(mantissa);
    while (i < 23)
        mantissa = strcat(mantissa, '0');
        i = i + 1;
    end
    
    if (numeroReal >= 0)
        bitSigno = '0';
    else
        bitSigno = '1';
    end
    
    exp = dec2bin(n + 127);
    conversion = strcat(bitSigno, exp, mantissa);
    disp(conversion);
    fprintf('Bit de signo: %s\nExponente: %s\nMantissa: %s\nResultado conversion de numero real a IEEE754: %s%s%s\n', bitSigno, exp, mantissa, bitSigno, exp, mantissa);
end
