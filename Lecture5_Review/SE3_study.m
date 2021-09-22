clear all
close all
clc

addpath('./../matlab_utils')
%%

figure('position', [550, 200, 750, 450])

num_step = 20;
for i = 1:num_step
    clf;
    % Global Frame
    drawCoordinate3DScale(eye(3), zeros(3,1), 0.3);

    T01 = SE3(eul2rotm([0, pi/4*sin(2*pi*i/num_step),0]), [0;0.5;0]);
    T12 = SE3(eye(3), [0.7;0;0]);
    T02 = T01 * T12;

    drawCoordinate3DScale(T01(1:3,1:3), T01(1:3, 4),0.5);
    drawCoordinate3DScale(T02(1:3,1:3), T02(1:3, 4),0.8);

    grid on
    axis equal

    xlim([-0.8, 1.6])
    ylim([-0.1, 1.5])
    zlim([-1.8, 1.8])

    xlabel('x', 'fontsize',22);
    ylabel('y', 'fontsize',22);
    zlabel('z', 'fontsize',22);
    view(60, 40);
    pause(0.01);
end
