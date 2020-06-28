%Implementation ## GRADIENT DESCENT ALGORITM USING ARMIJO-GOLD. COND##

%Clear all command window and workspace
clear all;
close all;
clc;


%initial condition
x0 = [3;-1;0];
ro = 0.1;
%initialize step size (Learning Rate)
alpha = 1;
epsilon = 0.0001;
nu = 0.5;

%I do not optimize alpha with secant method, just choose inexact line
%search
while (fii(alpha,x0) <= rosen(x0) + (nu*alpha*fi(0,x0)))
    
    alpha = ro*alpha;
    
end
while fii(alpha,x0) >= rosen(x0) + (epsilon*alpha*fi(0,x0))
    
    alpha = ro*alpha;
    
end


%termination criteria
k = 1000;

x1 = x0 - (alpha .* gradrosen(x0));
error = abs(x1 - x0);

i=1;

while error>10^(-6)
    
    x0 = x1;
    while and( (fii(alpha,x0) >= rosen(x0) + (epsilon*alpha*fi(0,x0))), (fii(alpha,x0) <= rosen(x0) + (nu*alpha*fi(0,x0))))
    
        alpha = ro*alpha;
    
    end    
    %To hold data of x1,x2,x3 and f(x) create new vectors and store data
    new1(i) = x1(1);
    new2(i) = x1(2);
    new3(i) = x1(3);
    new4(i) = rosen(x1);
    %Iteration
    x1 = x0 - (alpha .* gradrosen(x0));

    %Continue iteration to minimize error.
    error = abs(x1 - x0);
    i = i+1;
    %When iterations meet termination criteria break
    if i==1000
        break;
    end
    
end
%Print some important points
fprintf("Number of Iteration ==> %d\n\n",i);
fprintf("x1 after %d iteration ==>\n",i);
disp(x1);
fprintf("error after %d iteration ==>\n",i);
disp(error);

%Plotting codes
plot(new1);
hold on;
plot(new2);
hold on;
plot(new3);
title('Combined Plots  x1,x2,x3')
axis ([0 i -5 5]);
grid on
legend x1 x2 x3
xlabel('Iteration Number k')
ylabel('Value of x1,x2,x3')
figure;
plot(new4);
title('f(x)')
axis ([0 i -25 2000]);
legend f(x)
xlabel('Iteration Number k')
ylabel('Value of f(x)')
grid on
