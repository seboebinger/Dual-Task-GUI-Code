%% Mental Math Dual Task Generator
% To do: Have the code plot the math operations every X seconds for the participant to see
clear; clc; close all
fdir = 'C:\Users\seboe\Documents\Grad School\Neuromechanics Lab\Dual Tasking\Cognitive Dual Task\Code\OperationSets\'; %save directory

patID = input('What is the participant ID? ','s'); %subject identifier (for saving)
trialnum = input('What Trial Number? '); %number of trials to be performed
pausetime = input('How long between operations? (in seconds) '); %length of time between each math calculation
clc

n = [randi(9)]; %Operation output value n(i+1) = n(i)+num
ops = []; %To store operation order
num = []; %To store generated numbers n(i+1) = n(i)+num
r = []; %To store random operation selection
i = 0; %iteration counter
instructions = {'Memorize the result of the previous'; 'calculation and carry it over to the next'}; %initial instructions for participant

figure(1)
title('','Color','k')
plot([0 1],[0 1],'k')
set(gcf,'WindowState','fullscreen','MenuBar','none','ToolBar','none','Color','k')
set(gca,'Color','k','XColor','k','YColor','k','FontSize',48)
instruct_txt = text(-0.1,0.5,instructions,'Color','w','FontSize',48);
disp({'Paused'; 'Relay instructions to participant';'Then click any button to continue'})
pause
clc

while i <= 11
    
    i = i+1;
    
    %Display instructions and the starting value
    if i==1
        delete(instruct_txt)
        txt1 = text(0,0.5,['Starting Numer is ' num2str(n)],'Color','w','FontSize',48);
        disp(['Starting Numer is ' num2str(n)])
        pause(pausetime)
        delete(txt1)
    end
    
    %If bounds are exceeded, repeat previous operation
    if (max(n) > 100 || min(n) < 0 )
        i = i-1;
        n(end) = [];
        ops(end) = [];
        num(end) = [];
    end
    
    r = randi(3); %Random operator generator
    num = [num randi(9)]; %Random number generator for each operation
    
    %Addition
    if r ==1
        n(i+1) = n(i)+num(i);
        ops = [ops '+'];
    end
    
    %Subtraction
    if r == 2
        n(i+1) = n(i)-num(i);
        ops = [ops '-'];
    end
    
    %Multiplication
    if r == 3
        n(i+1) = n(i)*num(i);
        ops = [ops 'x'];
    end
    
    %Break if 10 operations are generated
    if i > 10
        break
    end
    
    %Display the operation
    if (max(n) <= 100 && min(n) >= 0 )
        disp(['Operation ' num2str(i) ': ' num2str(n(i)) ' ' ops(i) ' ' num2str(num(i)) ' = ' num2str(n(i+1))]) %Full Operation
        txt2 = text(0.5, 0.5, [ops(end) num2str(num(end))],'Color','w','FontSize',48); %What participant will see
        pause(pausetime)
        delete(txt2)
    end
    
end

%delete the last value of each vector prior to saving b/c they are not
%displayed to the participant during experimentation
n(end) = [];
num(end) = [];
ops(end) = [];
save([fdir patID ' Operation Set ' num2str(trialnum) ' ' date],'n','num','ops')

