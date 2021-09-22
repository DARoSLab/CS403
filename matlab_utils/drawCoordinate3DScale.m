function x = drawCoordinate3DScale(R, p, scale)
hold on
% plot3([p(1) R(1,1)+p(1)], [p(2) R(2,1)+p(2)], [p(3) R(3,1)+p(3)], 'linewidth', 3, 'color','r');
% plot3([p(1) R(1,2)+p(1)], [p(2) R(2,2)+p(2)], [p(3) R(3,2)+p(3)], 'linewidth', 3, 'color','b');
% plot3([p(1) R(1,3)+p(1)], [p(2) R(2,3)+p(2)], [p(3) R(3,3)+p(3)], 'linewidth', 3, 'color','g');

R = scale*R;
quiver3(p(1),p(2),p(3), R(1,1), R(2,1), R(3,1),0, 'linewidth',3, 'color','r', 'MaxHeadSize',0.8)
quiver3(p(1),p(2),p(3), R(1,2), R(2,2), R(3,2),0, 'linewidth',3, 'color','b', 'MaxHeadSize',0.8)
quiver3(p(1),p(2),p(3), R(1,3), R(2,3), R(3,3),0, 'linewidth',3, 'color','g', 'MaxHeadSize',0.8)
% quiver(p(1),p(2),-sin(theta),cos(theta),0, 'linewidth',3, 'color','b', 'MaxHeadSize',0.8)

% hold off
end