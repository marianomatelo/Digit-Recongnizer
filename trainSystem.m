function trainSystem
load Database;
stop = false;
while ~stop
    DigitRecognizationInput;
    uiwait(gcf); 
    global C;
    P = [P C(:)];
    val = str2double(cell2mat(inputdlg('Ingresar numero : ')));
    temp = zeros(10,1);
    if val == 0
        temp(10) = 1;
    else
        temp(val) = 1;
    end
    T = [T temp];
    button = questdlg('Desea seguir entrenando?',' ','Si','No','No');
    if strcmp(button,'No')
        stop = true;
    end
end
save('Database.mat','P','T');

load Database
net = feedforwardnet([50 50 50 50 50]);
net.trainFcn = 'trainscg';
net = train(net,P,T);
save('net.mat','net');