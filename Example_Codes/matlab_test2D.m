close all
clc

addpath('./../matlab_utils')
%%

x0 = [0, 0];
x1 = [2, 3];
x2 = [4, 3];
x3 = [-3, 1];

% Draw figure
figure
hold on
grid on
drawLine2D(x0,x1);
drawLine2D(x1,x2);
drawLine2D(x2,x3);

theta = pi/4;
p = [3, 1];
drawCoordinate2D(0,[0, 0]);
drawCoordinate2D(theta,p);

xlabel('$x$','interpreter','latex','fontsize',20)
ylabel('$y$','interpreter','latex','fontsize',20)
axis equal

