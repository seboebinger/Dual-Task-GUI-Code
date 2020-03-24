%% Operation Set Display
% Displays plots of the operation for participants to see during experiment
% This code will be adapted to be used in the GUI when the GUI is generated
clear; clc; close all

%What should be able to be varied by users in the GUI
pausetime = input('How long between operations? (in seconds) '); %length of time between each math calculation
OpSet = input('Which Operation Set (1, 2, or 3)? '); %Which case to load
trialnum = input('How many trials (max 200)? '); %number of trials to be performed
opnum = input('How many opertions to be performed (max 20)? ');
clc

%Load operation set
if OpSet == 1
    load('Case 1 Operation Set 24-Mar-2020.mat')
    n =     n_Case1;
    num = num_Case1;
    ops = ops_Case1;
elseif OpSet == 2
    load('Case 2 Operation Set 24-Mar-2020.mat')
    n =     n_Case2;
    num = num_Case2;
    ops = ops_Case2;
elseif OpSet == 3
    load('Case 3 Operation Set 24-Mar-2020.mat')
    n =     n_Case3;
    num = num_Case3;
    ops = ops_Case3;
else
    error('Invalid Case Number')
end

i = 0; %iteration counter
instructions = {'Memorize the result of the previous'; 'calculation and carry it over to the next'}; %initial instructions for participant

figure(1)
title('','Color','k')
plot([0 1],[0 1],'k')
set(gcf,'WindowState','fullscreen','MenuBar','none','ToolBar','none','Color','k')
set(gca,'Color','k','XColor','k','YColor','k','FontSize',48)%,'visible','off','xlim',[0 2],'ylim',[0 2],'Position',[0 0 1 1])
instruct_txt = text(-0.1,0.5,instructions,'Color','w','FontSize',48);
disp({'Paused'; 'Relay instructions to participant';'Then click any button to continue'})
pause
clc

for iter = 1:trialnum
    
    while i <= opnum
        
        i = i+1;
        
        %Display instructions and the starting value
        if i==1
            delete(instruct_txt)
            txt1 = text(0.05,0.8,'Starting Number is ','Color','w','FontSize',80);
            txt2 = text(0.42,0.5,num2str(n(iter,i)),'Color','w','FontSize',150);
            disp(['Trial ' num2str(iter)])
            disp(['Starting Number is ' num2str(n(iter,i))])
            pause(pausetime)
            delete(txt1)
            delete(txt2)
        end
        
        %Break if 10 operations are generated
        if i > opnum
            break
        end
        
        %Display the operation
        disp(['Operation ' num2str(i) ': ' num2str(n(iter,i)) ' ' ops(iter,i) ' ' num2str(num(iter,i)) ' = ' num2str(n(iter,i+1))]) %Full Operation
        txt3 = text(0.42,0.5,[ops(iter,i) num2str(num(iter,i))],'Color','w','FontSize',150); %What participant will see
        pause(pausetime)
        delete(txt3)
        pause(0.2) %Pause between operations
        
    end
    i = 0; %reset iteration counter for while loop
    if iter < trialnum
        disp('Press any button to continue to next trial')
        pause
        clc
    else
        disp('End of trials')
        end_txt = text(0.35,0.5,'You did it!','Color','w','FontSize',48);
        break
    end
end