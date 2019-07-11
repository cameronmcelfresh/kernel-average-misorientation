function [ clean_mat,boundary_mat ] = KAM_clean( misorient_mat )
%KAM_CLEAN Function designed to take in the misorientation values and scale
%the misorientation values across the range of the color scale while also
%bringing any -1 values to zero

fprintf("Cleaning data...\n")

%Make new doubles matrix to hold the RGB placeholds in 0-1 format
new_mat = misorient_mat;



%Get the size of the matrix
[row,col] = size(misorient_mat);

%Initialize a matrix to hold the boundary positions
boundary_mat = ones(row,col);

for r = 1:row
    for c = 1:col
        
        %Set the undefined pixels to an averaged value
        if misorient_mat(r,c)==-1
            
            avg_pixel = 0;
            num_el = 0;
            
            if r+1<=row
                avg_pixel = new_mat(r+1,c);
                num_el = num_el + 1;
            end

            if r-1>=1
                avg_pixel = new_mat(r-1,c);
                num_el = num_el + 1;
            end

            if c+1<=col
                avg_pixel = new_mat(r,c+1);
                num_el = num_el + 1;
            end
            
            if c-1>=1
                avg_pixel = new_mat(r,c-1);
                num_el = num_el + 1;
            end
            
            new_mat(r,c) = (avg_pixel)/num_el;
        end
        
        %Construct a matrix of the boundaries - arbitrarily set to anything
        %above 15 degrees misorientation. Note that this sort of boundary
        %selection could also be used to highlight areas such as HAGBs,
        %LAGB, or twins!
        if misorient_mat(r,c)>15
            boundary_mat(r,c) = 0;
        end
               
    end
end

%Output clean matrix
clean_mat =new_mat;



end

