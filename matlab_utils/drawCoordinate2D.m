function x = drawCoordinate2D(theta, p, scale)
hold on

quiver(p(1),p(2),scale*cos(theta),scale*sin(theta),0, 'linewidth',2, 'color','r', 'MaxHeadSize',0.6)
quiver(p(1),p(2),-scale*sin(theta),scale*cos(theta),0, 'linewidth',2, 'color','b', 'MaxHeadSize',0.6)

hold off
end