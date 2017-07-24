function recognize

DigitRecognizationInput;
uiwait(gcf); 
global C;

load net;

temp = sim(net,C(:));
[score,digit] = max(temp);
if score > 1
    score = 1;
end
if digit == 10
    digit = 0;
end
msgbox(['Numero reconocido: ' num2str(digit) '   con puntaje => ' num2str(score*100) '/100.'])
