function x = drawLine2D(start_pt, end_pt)
% draw the line starting from 'start_pt' and ending at 'end_pt'
% start_pt = [x;y]
% end_pt = [x;y]

plot([start_pt(1), end_pt(1)], [start_pt(2), end_pt(2)], 'linewidth',4);
end