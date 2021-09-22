function x = drawLine3D(start_pt, end_pt)
% draw the line starting from 'start_pt' and ending at 'end_pt'
% start_pt = [x;y;z]
% end_pt = [x;y;z]

plot3([start_pt(1), end_pt(1)], [start_pt(2), end_pt(2)], [start_pt(3), end_pt(3)], 'linewidth',10);
end