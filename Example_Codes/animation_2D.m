close all
clc

addpath('./../matlab_utils')
%%

x0 = [0, 0];
x1 = [2, 3];
x2 = [4, 3];

l = 0.8;

figure
clf

t = 0;

for i=1:100
    t = t+0.01;
    theta = pi*t;
    
    % Draw the first linkage
    drawLine2D(x0, x1);
    
    % x2 = x1 + ratating arm
    x2 = x1 + [l*cos(theta), l*sin(theta)];

    % hold on and draw the second linkage
    hold on
    drawLine2D(x1,x2);

    % fix the range of axis
    axis([0 4 0 4])
    
    % axis label
    xlabel('$x\  (m)$','interpreter','latex','fontsize',15)
    ylabel('$y\  (m)$','interpreter','latex','fontsize',15)
    
    pause(.01);
    hold off

end
