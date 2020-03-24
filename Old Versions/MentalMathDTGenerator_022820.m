%% Mental Math Dual Task Generator
% To do: Ensure that the operations stay bounded between 0 and 100 while
% still giving the required number of operations. 
    % Giovanni suggests a while loop.
clear; clc
n0 = randi(9);
n = [];
n(1) = n0;
ops = [];
num = [];
i = 0;

while (max(n) < 100 && min(n) >0 )
    
    i = i+1; % iteration counter
    if i == 11
        disp('10 Operations Reached')
        break
    end 
    
    r = randi(3); %Random operator generator
    num = [num randi(9)]; %Random number generator for each operation
    if r ==1
        n(i+1) = n(i)+num(i);
        ops = [ops '+'];
    end
    if r == 2
        n(i+1) = n(i)-num(i);
        ops = [ops '-'];
    end
    if r == 3
        n(i+1) = n(i)*num(i);  
        ops = [ops '*'];
    end

    disp(['Operation ' num2str(i) ': ' num2str(n(i)) ' ' ops(i) ' ' num2str(num(i)) ' = ' num2str(n(i+1))])
end