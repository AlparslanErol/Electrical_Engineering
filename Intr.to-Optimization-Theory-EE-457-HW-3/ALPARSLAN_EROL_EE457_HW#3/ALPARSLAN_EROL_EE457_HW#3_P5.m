%Implementation ## NEWTON'S METHOD##

%Clear all command window and workspace
clear all;
close all;
clc;
%initial condition
x0 = [3;-1;0];

%initialize step size (Learning Rate)
%No Guarantee to work fixed step size gradient algorithm
alpha = 0.0001;
%termination criteria
k = 100;
%first iteration

param = (hessianrosen(x0)^-1)*(gradrosen(x0));
x1 = x0 - param;
error = abs(x1 - x0);
i=1;

while error>10^(-4)
    
    x0 = x1;
    %To hold data of x1,x2,x3 and f(x) create new vectors and store data
    new1(i) = x1(1);
    new2(i) = x1(2);
    new3(i) = x1(3);
    new4(i) = rosen(x1);
    %Iteration
    param = (hessianrosen(x0)^-1)*(gradrosen(x0));
    x1 = x0 - param;    
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
axis ([0 i -25 3000]);
legend f(x)
xlabel('Iteration Number k')
ylabel('Value of f(x)')
grid on
