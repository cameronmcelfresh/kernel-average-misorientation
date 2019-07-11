function [ orientation_matricies ] = euler_convert(ebsd_data, xdim, ydim)
%Function to take the ebsd_data matrix and output a cell structure with the
%corresponding orientation matricies for each position

fprintf("Converting to orientation matricies...\n")

%Create an empty cell structure with the required length to hold the
%respective orientation matricies

totalrows =xdim*ydim; %Total rows

orientation_matricies = cell(xdim,ydim); %Empty cells

%Cycle through a fill the cell structure
for i = 1:totalrows
   
    %If the phase is undefined then skip the calcualtion and leave as 0
    if ebsd_data(i,2)==0
        orientation_matricies{i}=0;
        continue
    end
    %Extract the angles and convert from angular to radians 
    phi1 = ebsd_data(i,5)*2*pi/360;
    PHI = ebsd_data(i,6)*2*pi/360;
    phi2 = ebsd_data(i,7)*2*pi/360;
   
    eul = [phi1, PHI, phi2]; %Contract into one variable
   
    %Create the euler matrix
    rotmatrix = euler2rotationmatrix(eul);
    
    %Populate the orientation_matricies cell structure
    orientation_matricies{ebsd_data(i,3),ebsd_data(i,4)}=rotmatrix;   
end

end

