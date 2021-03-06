%% Mental Math Dual Task Generator
% To do: Have the code plot the math operations every X seconds for the participant to see
clear; clc; close all
fdir = 'C:\Users\seboe\Documents\Grad School\Neuromechanics Lab\Dual Tasking\Cognitive Dual Task\Code\OperationSets\'; %save directory

trialnum = input('How many trials? '); %number of trials to be performed
opnum = input('How many opertions per trial? '); %How many opertions to be performed

n = [randi(9)]; %Operation output value n(i+1) = n(i)+num
ops = []; %To store operation order
num = []; %To store generated numbers n(i+1) = n(i)+num
r = []; %To store random operation selection
i = 0; %iteration counter for while loop

n_save = [];
num_save = [];
ops_save = [];

for iter = 1:trialnum
    
    while i <= opnum
        
        i = i+1;
        
        %Display instructions and the starting value
        if i==1
            disp(['Trial ' num2str(iter)])
            disp(['Starting Numer is ' num2str(n)])
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
        
        %Break if specified number of operations are generated
        if i > opnum
            break
        end
        
        %Display the operation
        if (max(n) <= 100 && min(n) >= 0 )
            disp(['Operation ' num2str(i) ': ' num2str(n(i)) ' ' ops(i) ' ' num2str(num(i)) ' = ' num2str(n(i+1))]) %Full Operation
        end
        
    end
    %delete the last value of each vector prior to saving b/c they are not
    %displayed to the participant during experimentation
    n(end) = [];
    num(end) = [];
    ops(end) = [];
    
    %Store all operation in a single matrix where each column is the
    %operation and each row is a trial 
    n_save = [n_save; n];
    num_save = [num_save; num];
    ops_save = [ops_save; ops];
    

    
    clear n ops num i %reset values for next trial
    
    n = [randi(9)]; %Operation output value n(i+1) = n(i)+num
    ops = []; %To store operation order
    num = []; %To store generated numbers n(i+1) = n(i)+num
    r = []; %To store random operation selection
    i = 0; %iteration counter
    
    if iter < trialnum
        clc
    else
        disp('End of trials')
        break
    end
end

save([fdir 'Operation Set ' date],'n_save','num_save','ops_save')