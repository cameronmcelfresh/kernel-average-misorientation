function [ebsd_data, text_data, colheaders, xdim, ydim] = ebsd_parse(file)
%Function to take the inputed struc of an EBSD text file and extract the 
%necessary variables

fprintf("Parsing the EBSD data...\n")

%Extract the EBSD-measured data
ebsd_data = file.data;

%Go through and add one to the x and y index column because indexing starts
%at zero

[rows,~] = size(ebsd_data); 
for i = 1:rows
    ebsd_data(i,3) = ebsd_data(i,3)+1;
    ebsd_data(i,4) = ebsd_data(i,4)+1;
end


%Extract the related text information
text_data = file.textdata;

%Extract the column headers
colheaders = file.colheaders;

%Find the x and y dimensions of the image
xdim = max(ebsd_data(:,3));
ydim = max(ebsd_data(:,4)); 


end

