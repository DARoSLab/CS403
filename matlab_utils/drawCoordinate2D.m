function x = drawCoordinate2D(theta, p)
hold on

quiver(p(1),p(2),cos(theta),sin(theta),0, 'linewidth',3, 'color','r', 'MaxHeadSize',0.6)
quiver(p(1),p(2),-sin(theta),cos(theta),0, 'linewidth',3, 'color','b', 'MaxHeadSize',0.6)

hold off
end