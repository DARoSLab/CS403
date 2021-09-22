clear all
close all
clc

addpath('./../matlab_utils')
%%

figure('position', [850, 300, 450, 350])

num_step = 30;
for i = 1:num_step
    clf;
    drawCoordinate3DScale(eye(3), zeros(3,1), 0.3);
    th_z = pi/8; %pi/4;
    th_y = pi/6/num_step*i; %pi/4;
    th_x = pi/4;
    R_z = [ cos(th_z), -sin(th_z), 0;
            sin(th_z), cos(th_z), 0;
            0, 0, 1];
    R_y = [ cos(th_y), 0, sin(th_y);
            0, 1, 0;
            -sin(th_y), 0, cos(th_y)];

    R_x = [1, 0, 0;
           0, cos(th_x), -sin(th_x);
           0, sin(th_x), cos(th_x)];

%     drawCoordinate3D(R_z*R_y*R_x, zeros(3,1)); % ZYX
%     drawCoordinate3D(R_y*R_z*R_x, zeros(3,1)); % ZYX
    drawCoordinate3D(R_x*R_z*R_y, zeros(3,1)); % ZYX
%     drawCoordinate3D(R_x*R_y*R_z, zeros(3,1)); % XYZ

    grid on
    axis equal
    
    xlim([-0.8, 0.8])
    ylim([-0.8, 0.8])
    zlim([-0.8, 0.8])

    xlabel('x', 'fontsize',22);
    ylabel('y', 'fontsize',22);
    zlabel('z', 'fontsize',22);
    
    view(60, 40);
    pause(0.005);
end