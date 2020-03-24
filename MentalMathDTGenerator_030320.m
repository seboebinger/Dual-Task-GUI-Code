%% Mental Math Dual Task Generator
% To do: Have the code plot the math operations every X seconds for the participant to see
clear; clc; close all
fdir = 'C:\Users\seboe\Documents\Grad School\Neuromechanics Lab\Dual Tasking\Cognitive Dual Task\Code\OperationSets\';
n = [randi(9)]; %Operation output value n(i+1) = n(i)+num
ops = []; %To store operation order
num = []; %To store generated numbers n(i+1) = n(i)+num
i = 0; %iteration counter
while i <= 11
    
    i = i+1;
    
    %Display instructions and the starting value 
    if i==1
        disp('Memorize the result of the previous calculation and carry it over to the next')
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
        ops = [ops '*'];
    end
    
    %Break if 10 operations are generated
    if i > 10
       break 
    end
    
    %Display the operation
    if (max(n) <= 100 && min(n) >= 0 )
%         disp(['Operation ' num2str(i) ': ' ops(i) ' ' num2str(num(i))]) %What participant will see
        disp(['Operation ' num2str(i) ': ' num2str(n(i)) ' ' ops(i) ' ' num2str(num(i)) ' = ' num2str(n(i+1))]) %Full Operation
    end
    
    
end