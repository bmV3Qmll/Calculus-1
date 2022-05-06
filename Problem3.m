clc;    % Clear command window
clf;    % Clear existing figures
clear;  % Remove workspace items and free up system memory

% Initialize variables
x0 = 0;
xn = 1;
y0 = 3;
syms x y;   % symbolic variables

% Restate the first order differential equation
df(x,y) = 6*x^2 - 3*x^2*y;
% Restate the exact solution
f(x) = 2 + exp(-x^3);


hold on
axis equal
% Label X and Y axes
xlabel("X");
ylabel("Y");
% Plot the figure for  the exactsolution
fplot(f, [x0 xn]);
% (i) h = 1
eulerMethod(f, df, x0, y0, xn, 1);
% (i) h = 0.1
eulerMethod(f, df, x0, y0, xn, 0.1);
% (i) h = 0.01
eulerMethod(f, df, x0, y0, xn, 0.01);
% (i) h = 0.001
eulerMethod(f, df, x0, y0, xn, 0.001);
% Title
title('Problem 3')
% Descriptions
legend('y = 2 + e^(-x^3)', 'h = 1', 'h = 0.1', 'h = 0.01', 'h = 0.001', 'Interpreter', 'none')

% Function to use Euler’s method to compute y(xn) and error with step size h
function [xn, yn, error] = eulerMethod(y, dy, x0, y0, xn, h)
    % Create domain vector
    xn = x0:h:xn;               
    % Compute solution at each intermediate points
    yn = zeros(1,size(xn,2));   
    yn(1) = y0;
    for i = 1:(size(xn,2)-1)
        yn(i+1) = double(yn(i) + h*double(dy(xn(i), yn(i))));
    end
    % Compute corresponding error
    error = double(abs(y(xn(end)) - yn(end)));
    % Output results
    fprintf("With h = %g, y(%g) = %g and error = %g\n", h, xn(end), yn(end), error);
    % Plot the figure for the approximated solution
    plot(xn, yn);
end
