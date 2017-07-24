function DigitRecognizationInput

% Figure
f = figure('Name','Input Pad',...
    'Menu','None',...
    'NumberTitle','Off',...
    'windowButtonUpFcn',@stopDragFcn);
% Submit Button
uicontrol('String','Aceptar',...
    'Position',[73 8 70 25],...
    'Callback',@callPush,...
    'FontSize',12);
   
% Drawing Area
aH = axes('XLim',[0 1],...
    'YLim',[0 1],...
    'XTickLabel',[],...
    'yTickLabel',[]);
title('Draw A Number [0-9]');

% Point To Start
h = plot(0.4,0.6,'r*',...
    'LineWidth',3,...
    'ButtonDownFcn',@startDragFcn);
set(aH,'XLim',[0 1],...
    'YLim',[0 1],...
    'XTickLabel',[],...
    'yTickLabel',[]);

% callback of SUBMIT
    function callPush(varargin)
        frame = getframe(gca);
        [im,map] = frame2im(frame);
        if isempty(map)
            rgb = im;
        else
            rgb = ind2rgb(im,map);
        end
        rgb = imcrop(rgb,[10 10 size(rgb,2)-20 size(rgb,1)-20]);
        bw = ImageProcessor(rgb);
        global C;
        C = CreatFeatureVector(bw);
        close(f)
    end

% Mouse Dragging Functions
    function startDragFcn(varargin)
        set(f,'WindowButtonMotionFcn',@dragFcn);
    end

    function stopDragFcn(varargin)
        set(f,'WindowButtonMotionFcn','');
    end

    function dragFcn(varargin)
        point = get(aH,'CurrentPoint');
        set(h,'XData',[get(h,'XData') point(1)]);
        set(h,'YData',[get(h,'YData') point(3)]);
        set(aH,'XLim',[0 1],...
            'YLim',[0 1],...
            'XTickLabel',[],...
            'yTickLabel',[]);
    end

end
