function [misorientation ] = misorientation_calc(orient_mat1,orient_mat2 )
%misorientation_calc is a function designed to calculate the
%misorientation

%Define each cubic symmetry operator possible

symmetry_operators{1} = [1 0 0;0 1 0;0 0 1];
symmetry_operators{2} = [1 0 0;0 0 -1;0 1 0];
symmetry_operators{3} = [1 0 0;0 -1 0;0 0 -1];
symmetry_operators{4} = [1 0 0;0 0 1;0 -1 0];
symmetry_operators{5} = [0 -1 0;1 0 0;0 0 1];
symmetry_operators{6} = [0 0 1;1 0 0;0 1 0];
symmetry_operators{7} = [0 1 0;1 0 0;0 0 -1];
symmetry_operators{8} = [0 0 -1;1 0 0;0 -1 0];
symmetry_operators{9} = [-1 0 0;0 -1 0;0 0 1];
symmetry_operators{10}= [-1 0 0;0 0 -1;0 -1 0];
symmetry_operators{11}= [-1 0 0;0 1 0;0 0 -1];
symmetry_operators{12}= [-1 0 0;0 0 1;0 1 0];
symmetry_operators{13}= [0 1 0;-1 0 0;0 0 1];
symmetry_operators{14}= [0 0 1;-1 0 0;0 -1 0];
symmetry_operators{15}= [0 -1 0;-1 0 0;0 0 -1];
symmetry_operators{16}= [0 0 -1;-1 0 0;0 1 0];
symmetry_operators{17}= [0 0 -1;0 1 0;1 0 0];
symmetry_operators{18}= [0 1 0;0 0 1;1 0 0];
symmetry_operators{19}= [0 0 1;0 -1 0;1 0 0];
symmetry_operators{20}= [0 -1 0;0 0 -1;1 0 0];
symmetry_operators{21}= [0 0 -1;0 -1 0;-1 0 0];
symmetry_operators{22}= [0 -1 0;0 0 1;-1 0 0];
symmetry_operators{23}= [0 0 1;0 1 0;-1 0 0];
symmetry_operators{24}= [0 1 0;0 0 -1;-1 0 0];

%Cycle through the different symmetry operators to find the minimum
%misorientation angle - which will occur under 62 degrees for cubic
%crystals

%Make empty matrix to hold answers
misorient_vals = ones(1,24)*360;

%Cycle through the symmetry operators until the minimum condition is met
for i=1:24
    x = acos((trace(symmetry_operators{i}*orient_mat1...
    *(symmetry_operators{i}*orient_mat2)^-1)-1)/2)*360/(2*pi);

    if imag(x)==0
        misorient_vals(i) = x;
    end
end

%Select the minimnum misorientation
misorientation = min(misorient_vals);

end

