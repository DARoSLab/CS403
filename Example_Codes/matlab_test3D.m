close all
clc

addpath('./../matlab_utils')
%%

x0 = [0, 0, 0];
x1 = [2, 3, 1];
x2 = [4, 3, 2];
x3 = [-3, 1, 2];

% draw figure
figure
hold on
grid on
drawLine3D(x0,x1);
drawLine3D(x1,x2);
drawLine3D(x2,x3);
% R = eye(3);
R = eul2rotm([0, 0, 0] );
p = [0.4, 0, 0];
drawCoordinate3D(R,p);
xlabel('$x$','interpreter','latex','fontsize',20)
ylabel('$y$','interpreter','latex','fontsize',20)
zlabel('$z$','interpreter','latex','fontsize',20)
axis equal

view(25,30)