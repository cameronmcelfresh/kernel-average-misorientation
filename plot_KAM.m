function plot_KAM( KAM_mat )
%PLOT_KAM function for plotting a KAM matrix including the grain boundaries

fprintf("Plotting!\n")

%%
%Plot the raw misorientation image
image(KAM_mat);
axis("off")

%Add color bar, color bar label, and plot title
c = colorbar;
c.Label.String = 'Misorientation';
title("Raw Misorientation")

%%
%Plot the scaled data to reveal subgrain detail
figure
imagesc(KAM_mat, [0,5])
axis("off")
%Add color bar, color bar label, and plot title
c1 = colorbar;
c1.Label.String = 'Misorientation';
title("Misorientation Capped at 5^o")

%%
%Find twin boundaries and plot on top of a boundary plot

figure
colormap(flipud(gray))
imagesc(KAM_mat,[2,5])
title("Twin Boundaries Highlighted")
axis("off")
hold on
%Get the size of the matrix
[row,col] = size(KAM_mat);

sz = 3; %Scatter plot size

for r = 1:row
    for c = 1:col
        if KAM_mat(r,c)>65 && KAM_mat(r,c)<90
            scatter(c,r,sz, 'r', 'filled')
        end
    end
end
hold off


end

