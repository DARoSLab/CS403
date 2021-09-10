clc
close all

addpath('./../matlab_utils')

%%
l1 = 0.2; l2 = 0.16;
% th1 = 0.5; th2 = 0.7;

% x_des = [0.25, 0.15];
x_des = [0.25, -0.15];

x = x_des(1);
y = x_des(2);
l3 = sqrt(x*x + y*y);

th1 = atan(y/x) - acos((l3^2 + l1^2 - l2^2)/(2*l1*l3));
th2 = acos((l3^2 - l1*l1 - l2*l2)/(2*l1*l2));


x0 = [0,0];
x1 = [l1*cos(th1), l1*sin(th1)];
x2 = x1 + [l2*cos(th1+th2), l2*sin(th1+th2)];
figure
grid on
hold on
drawLine2D(x0, x1);
drawLine2D(x1, x2);

drawCoordinate2D(0, [0,0], 0.1);
drawCoordinate2D(th1+th2, x2, 0.08);
drawCoordinate2D(th1+th2, x_des, 0.08);

xlim([-0.2, 0.3])
ylim([-0.2, 0.3])
axis equal