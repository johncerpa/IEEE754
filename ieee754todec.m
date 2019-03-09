function [resultado] = ieee754todec(entrada)
    % Exponente para hallar n
    exponente = entrada(2:9);
    
    exp = bin2dec(exponente);
    n = exp - 127;
    
    mantissa = entrada(10:32);
    
    temp = '1';
    bin1 = '1';
    bin2 = '';
    i = 1;
    agregarPunto = true;
    while (i < 23) 
        if (i == n + 1 && agregarPunto)
            temp = strcat(temp, '.');
            i = i - 1;
            agregarPunto = false;
        else
            if (agregarPunto)
                bin1 = strcat(bin1, mantissa(i:i));
            else
                bin2 = strcat(bin2, mantissa(i:i)); 
            end
            temp = strcat(temp, mantissa(i:i));
        end        
        i = i + 1;
    end
    
    i = 1;
    suma = 0;
    while (i < length(bin2))
        suma = suma + str2num(bin2(i:i)) * 2^(-i);
        i = i + 1;
    end
    
    resultado = bin2dec(bin1) + suma;
    if (entrada(1:1) == '1')
        resultado = resultado * -1;
    end
       
    fprintf('Resultado conversion IEEE754 a numero real: %f\n', resultado);
end

