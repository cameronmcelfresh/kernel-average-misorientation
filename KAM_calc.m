function [ nearest_neighbor_misorientation ] = KAM_calc(ebsd_data,xdim,ydim,orientation_matricies,neighbors)
%NEAREST_NEIGHBOR_MISORIENTATION is a function to calculate the
%misorientation of the nearest "n" neighbors given an EBSD data file with imaging dimensions
%and with the pixel locations and the acompanying orientation matrix file

%The output will be a column with the same length as the initial EBSD file
%corresponding to the misorientation at each pixel

fprintf("Calculating the nearest neighbor misorientation...\n")

%The neighbors, or n variable, is the number of nearest neighbors being
%considered
n=neighbors;

%Find the total number of rows
[totalrows,~] = size(ebsd_data);

%Initialize a matrix to hold the resulting misorientation values
nearest_neighbor_misorientation=zeros(xdim,ydim);

%Begin timer
tic

%Cycle through the entire ebsd_file
for i=1:totalrows
    
    %Print progress
    if rem(i,10000)==0
        fprintf('%.2f%% complete ', i/totalrows*100)
    
        time_elapsed = toc;
    
        perc_left = 1-i/totalrows;
        
        current_rate = (i/totalrows)/time_elapsed;
        
        h = floor((perc_left/current_rate)/(60*60));
        m = floor(((perc_left/current_rate)-h*60)/60);
        
        fprintf('- estimated %ih %im remaining (%im elapsed)\n', h,m, floor(toc/60))
        
    end
    
    %Extract the original x and y pixel locations for the pixel of interest
    orig_x = ebsd_data(i,3);
    orig_y = ebsd_data(i,4);
   
    %Check to ensure the position is defined. If it is not, skip the
    %calculation (a pixel is undefined if Phase = 0)
    if ebsd_data(i,2)==0
       nearest_neighbor_misorientation(i)=-1;
       continue 
    end
       
    %Initialize a counter for the misorientation values
    misorient_counter=0;
    
    %Initialize a counter for misorientation calcs with an undefined pixel
    no_calc=0;
    
    for y_pos=ebsd_data(i,4)-n:ebsd_data(i,4)+n %cycle through the y-positions
        
        %Continue out of the loop if the index exceeds the dimensions
        if y_pos>ydim || y_pos<1
            continue
        end  
        
            for x_pos=ebsd_data(i,3)-n:ebsd_data(i,3)+n %Cycle through the x-positions

                %Continue out of loop if the index matches the original point
                if y_pos==ebsd_data(i,4) && x_pos==ebsd_data(i,3)
                    continue
                end

                %Continue out of the loop if the index exceeds the dimensions
                if x_pos>xdim || x_pos<1
                    continue
                end


            
                %Double check to see if pixel being compared to has euler
                %angles
                if orientation_matricies{x_pos,y_pos}==0
                    no_calc=no_calc+1;
                    continue
                end
            
            
                %Finally, add to the running tally of the misorientation
                %counter            
                misorient_counter = misorientation_calc(orientation_matricies{orig_x,orig_y},orientation_matricies{x_pos,y_pos})...
                    +misorient_counter;
            
            end
    end

        %Ensure the count is above zero then populate the resulting matrix
        if misorient_counter~=0
            nearest_neighbor_misorientation(orig_x,orig_y)=misorient_counter/((n+2)*(n+2)-1-no_calc);
        end

end

end

