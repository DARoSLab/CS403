close all
clc

addpath('./../matlab_utils')
%%

syms th1 th2

%th1 = 0.2; th2 = 0.5;
l1 = 0.6; l2 = 0.5;

x0 = [0, 0];
x1 = [l1*cos(th1), l1*sin(th1)];
x2 = x1 + [l2*cos(th1+th2), l2*sin(th1+th2)];

% Draw figure
figure
t = 0;
for i = 1:50
    t = t + 0.001;
    th1 = t*5;
    th2 = t + 0.5;
    drawLine2D(x0,eval(x1));
    hold on
    grid on
    drawLine2D(eval(x1),eval(x2));

    theta = th1+th2;
    drawCoordinate2D(0,[0, 0], 0.2);
    drawCoordinate2D(theta, eval(x2), 0.1);

    xlabel('$x$','interpreter','latex','fontsize',20)
    ylabel('$y$','interpreter','latex','fontsize',20)
    axis equal
    
    pause(0.01)
    hold off
end