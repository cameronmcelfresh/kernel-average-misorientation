%% Main script to run KAM calculation

%Define the number of nearest neighbors to put in each kernel
neighbors = 2;

%%

%Get the file name - make sure it is in the same directory
file_name = uigetfile('.txt', 'Select the file with the raw EBSD data');

if exist(file_name, 'file')~=2
    fprintf("File not in current directory, exitting script\n")
    return
end


%Import all the data
file = importdata(file_name);

%Extract the necessary data
[ebsd_data, text_data, colheaders, xdim, ydim] = ebsd_parse(file);

%Calculate the orientation matricies for each point
[ orientation_matricies ] = euler_convert(ebsd_data, xdim, ydim);

%Calculate the nearest neighbor misorientation
[ nearest_neighbor_misorientation ] = KAM_calc(ebsd_data,xdim,ydim,orientation_matricies,neighbors);

%Clean the misorientation matrix
[ clean_mat,boundary_mat ] = KAM_clean( nearest_neighbor_misorientation );

%Plot the results
plot_KAM( clean_mat );