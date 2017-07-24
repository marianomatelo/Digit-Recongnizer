function DigitRecognizer

choice = 0;
while choice ~= 3
    
    choice = menu('Reconocedor de numeros magico',...
        'Iniciar modo de Prueba',...
        'Iniciar modo de Entrenamiento',...
        'Salir');
    
    switch choice
        case 1
            recognize;
        case 2
            trainSystem;
    end
end
clc;clear;