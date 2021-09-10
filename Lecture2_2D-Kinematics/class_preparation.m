clc
close all

addpath('./../matlab_utils')
%%
l1 = 0.4; l2 = 0.35;

x = 0.5; y = 0.1;

l3 = sqrt(x^2 + y^2);
th1 = atan(y/x) - acos((l3^2 + l1^2 - l2^2)/(2*l1*l3));
th2 = acos((l3^2 - l1*l1 - l2*l2)/(2*l1*l2));

% th1 = 0.3; th2 = 0.4;

x0 = [0, 0];
x1 = [l1*cos(th1), l1*sin(th1)];
x2 = x1 + [l2*cos(th1+ th2), l2*sin(th1+th2)];


figure
grid on
hold on
drawLine2D(x0, x1);
drawLine2D(x1, x2);

drawCoordinate2D(th1 + th2, [x, y], 0.15);
drawCoordinate2D(0, [0,0], 0.1)

xlim([-0.05, 0.8])
ylim([-0.25,0.8])
axis equal