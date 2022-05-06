clc;    % Clear command window
clf;    % Clear existing figures
clear;  % Remove workspace items and free up system memory

% Initialize variables
A = -0.6;   % starting x-coordinate
v = 60;     % velocity
x0 = 0.35;  % statue's x-coordinate
y0 = 0.37;  % statue's y-coordinate
syms x xB;  % symbolic variables

% Write symbolic expressions
y(x) = x*exp(x);    % Graph function
dy(x) = diff(y);    % First derivative / Slope
ytt(x) = dy(xB)*(x - xB) + y(xB);   % Tangent line

% Find the location where the light ray spot to the statue.
B = double(vpasolve(ytt(x0) == y0, xB));

% Approximate the path AB using the trapezoidal formula (line 22 to 33)
% Create domain vector
step = linspace(A,B);
n = size(step, 2);

% Compute the length of each subsegment of the curve and store in vector S
S = zeros(0, n);
for i = 1:n
   S(i) = double(sqrt(1 + subs(dy, x, step(i))^2));
end

% Compute the approximate integral via trapezoidal numerical integration
% with nonunit spacing
s = trapz(step, S);

fprintf("The distance between A and B = %g km\n", s);
fprintf("The time of car move to A from B = %g h\n", s/v);

% Plot the figure
hold on     % retains plots in the current axes
axis equal
% Label X and Y axes
xlabel("X");
ylabel("Y");
% Set axes limits
xlim([-3, 2]);
ylim([-1, 2]);

grid on
% Plot the path of street
fplot(y, 'Color' ,'r');
% Plot light ray which is the tangent at point B
fplot(subs(ytt, xB, B), 'Color','b');
% Highlight the position of the statue
rectangle('Position', [0.35-0.05 0.37-0.05 0.1 0.1], 'Curvature', [1 1], 'FaceColor', '#EDB120', 'EdgeColor', 'none');
% Title
title('Problem 2')
% Descriptions
legend('y = x*(e^x)', 'y = (x + 1)*(e^x)')