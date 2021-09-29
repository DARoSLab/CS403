clear all
close all
clc

addpath('./../matlab_utils')
%%

figure('position', [850, 300, 850, 650])

num_step = 30;
for i = 1:num_step
    clf;
    drawCoordinate3DScale(eye(3), zeros(3,1), 5.3);
%     th = 0; 
     th = pi/3/num_step*i;
    
%     w = [1, 2, 4];
    w = [1, 1, 0];
    w = w/norm(w); % normalization
    w_skew = [0 -w(3) w(2);
             w(3) 0 -w(1);
             -w(2) w(1) 0];
         
   R = expm(w_skew*th);
   drawCoordinate3D(R, zeros(3,1)); % Rx explicit
   quiver3(0,0,0, w(1), w(2), w(3), 0, 'linewidth',5, 'color','c', 'MaxHeadSize',0.8)


    grid on
    axis equal
    
    xlim([-1.2, 1.2])
    ylim([-1.2, 1.2])
    zlim([-1.2, 1.2])

    xlabel('x', 'fontsize',22);
    ylabel('y', 'fontsize',22);
    zlabel('z', 'fontsize',22);
    
    view(130, 40);
    pause(0.005);
end