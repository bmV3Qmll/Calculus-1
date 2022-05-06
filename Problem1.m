clc;    % Clear command window
clf;    % Clear existing figures
clear;  % Remove workspace items and free up system memory

% Initialize symbolic variables
syms t t0 s1 s2;

% Restate the parametric equations
x(t) = t^3 - 4*t - 2;
y(t) = -2*t^2 + 1;
% First derivatives
dx(t) = diff(x);
dy(t) = diff(y);
% Tangent lines
xtt(t) = dx(t0)*(t - t0) + x(t0);
ytt(t) = dy(t0)*(t - t0) + y(t0);
% Solve parametric equations
Sol = solve(x(s1) == x(s2), y(s1) == y(s2), s1 ~= s2);
t1 = double(Sol.s2(1));
t2 = double(Sol.s2(2));

fprintf("The intersection is (%g, %g)\n", subs(x, t, t1), subs(y, t, t1));

% Plot the figure
hold on     % retains plots in the current axes     
axis equal
% Label X and Y axes
xlabel("X");
ylabel("Y"); 
% Set axes limits
xlim(double([x(t1) - 15, x(t2) + 15]));
ylim(double([y(t1) - 15, y(t2) + 15]));   
% Plot the curve
fplot(x, y, [t1-10, t2+10], 'Color', 'r');
% Plot tangent lines at the intersection
fplot(subs(xtt, t0, t1), subs(ytt, t0, t1), [t1-10, t2+10], 'Color', 'b');
fplot(subs(xtt, t0, t2), subs(ytt, t0, t2), [t1-10, t2+10], 'Color', 'g');
% Title
title('Problem 1')
% Descriptions
legend('Curve', 'First tangent', 'Second tangent')
