function [angle]=anglebwlines_2D(pt1,pt2,pt3,pt4)

% pt1,pt2,pt3,pt4 are the four points between whom an angle will be found
% in 2D space

slope1=((pt1(2)-pt2(2))/(pt1(1)-pt2(1)));
slope2=((pt3(2)-pt4(2))/(pt3(1)-pt4(1)));

temp = ((slope1-slope2)/(1+(slope1*slope2)));
angle = atand(temp);

end


