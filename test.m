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
i = 1;
while (max(n) < 100 & min(n) >0 )
    i = i+1
    r = randi(3); %Random operator generator
    num = [num randi(9)]; %Random number generator for each operation
    if r ==1
        n(i) = n(i-1)+num(i-1);
        ops = [ops '+'];
    end
    if r == 2
        n(i) = n(i-1)-num(i-1);
        ops = [ops '-'];
    end
    if r == 3
        n(i) = n(i-1)*num(i-1);  
        ops = [ops '*'];
    end
    
    % Metrics to ensure it stays bounded between 0 and 100
    if n(i) > 100
        i = i-1;
    end
    
    if n(i) < 0
        i = i-1;
    end
    
    disp(['Operation ' num2str(i-1) ': ' num2str(n(i-1)) ' ' ops(i-1) ' ' num2str(num(i-1))])
end