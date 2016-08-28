function [ angle ] = anglebwlines_3D( pt1,pt2,pt3,pt4 )
%Calculate the angle between 2 vectors in 3D

vect1 = pt1 - pt2;
vect2 = pt3 - pt4;

numerator = (vect1(1)*vect2(1))+(vect1(2)*vect2(2))+(vect1(3)*vect2(3));
denominator  = (sqrt((vect1(1)^2)+(vect1(2)^2)+(vect1(3)^2)))*(sqrt((vect2(1)^2)+(vect2(2)^2)+(vect2(3)^2)));

angle = acosd(numerator/denominator);

end

