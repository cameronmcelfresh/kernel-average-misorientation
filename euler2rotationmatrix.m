function [rotation_matrix] = euler2rotationmatrix(eul)
%EULER2ROTATIONMATRIX is a function that takes in three euler angles and
%convert it to an orientation matrix. Need to be in radians

ang1 = eul(1);
ang2 = eul(2);
ang3 = eul(3);

%Convert the Bunge Euler angles to matrix form
Z1 = [cos(ang1) sin(ang1) 0;-sin(ang1) cos(ang1) 0;0 0 1];
X  = [1 0 0;0 cos(ang2) sin(ang2);0 -sin(ang2) cos(ang2)];
Z2 = [cos(ang3) sin(ang3) 0;-sin(ang3) cos(ang3) 0;0 0 1];

%Calculate the orientation matrix
rotation_matrix = Z2*X*Z1;

end

