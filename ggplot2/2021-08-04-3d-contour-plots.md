---
description: How to make 3D Contour Plots in MATLAB<sup>&reg;</sup> with Plotly.
name: 3D Contour Plots
display_as: 3d_charts
order: 20
permalink: matlab/3d-contour-plots/
thumbnail: thumbnail/
layout: base
language: matlab
page_type: u-guide
---

## Contours of Sphere

Define `Z` as a function of `X` and `Y`. In this case, call the `sphere` function to create `X`, `Y`, and `Z`. Then plot the contours of `Z`.

<pre class="mcode">
[X,Y,Z] = sphere(50);
contour3(X,Y,Z);

fig2plotly('TreatAs', 'contour3')
</pre>

plot_0_0_contours_of_sphere



<!--------------------- EXAMPLE BREAK ------------------------->

## Contours at Fifty Levels

Define `Z` as a function of two variables, `X` and `Y`. Then plot the contours of `Z`. In this case, let MATLAB® choose the contours and the limits for the x- and y-axes.

<pre class="mcode">
[X,Y] = meshgrid(-5:0.25:5);
Z = X.^2 + Y.^2;
contour3(Z)

fig2plotly('TreatAs', 'contour3')
</pre>

plot_1_0_contours_at_fifty_levels

Now specify `50` contour levels, and display the results within the x and y limits used to calculate `Z`.

<pre class="mcode">
contour3(X,Y,Z,50)

fig2plotly('TreatAs', 'contour3')
</pre>

plot_1_1_contours_at_fifty_levels



<!--------------------- EXAMPLE BREAK ------------------------->

## Contours at Specific Levels with Labels

Define `Z` as a function of two variables, `X` and `Y`. Then plot the contours at `Z = [-.2 -.1 .1 .2]`. Show the contour labels by setting the `ShowText` property to `'on'`.

<pre class="mcode">
[X,Y] = meshgrid(-2:0.25:2);
Z = X.*exp(-X.^2-Y.^2);
contour3(X,Y,Z,[-.2 -.1 .1 .2],'ShowText','on')

fig2plotly('TreatAs', 'contour3')
</pre>

plot_2_0_contours_at_specific_levels_with_labels



<!--------------------- EXAMPLE BREAK ------------------------->

## Contours at One Level

Define `Z` as a function of `X` and `Y`. In this case, call the `peaks` function to create `X`, `Y`, and `Z`. Then display the contours at `Z = 2`.

<pre class="mcode">
[X,Y,Z] = peaks;
contour3(X,Y,Z,[2 2]);

fig2plotly('TreatAs', 'contour3')
</pre>

plot_3_0_contours_at_one_level



<!--------------------- EXAMPLE BREAK ------------------------->

## Custom Line Width

Define `Z` as a function of two variables, `X` and `Y`. Plot 30 contours of `Z`, and then set the line width to `3`.

<pre class="mcode">
[X,Y] = meshgrid(-2:0.0125:2);
Z = X.*exp(-X.^2-Y.^2);
[M,c] = contour3(X,Y,Z,30);
c.LineWidth = 3;

fig2plotly('TreatAs', 'contour3')
</pre>

plot_4_0_custom_line_width



<!--------------------- EXAMPLE BREAK ------------------------->


## Draw Contours for Single Slice

Create a single slice plane through volumetric data and draw contours of the data values.

Create the matrices `X`, `Y`, `Z`, and `V` from the `flow` data set. Draw contours of V in the slice plane where z = 0.

<pre class="mcode">
[X,Y,Z,V] = flow;
zslice = 0;
contourslice(X,Y,Z,V,[],[],zslice)
grid on

fig2plotly()
</pre>

plot_0_0_draw_contours_for_single_slice



<!--------------------- EXAMPLE BREAK ------------------------->

## Draw Contours in Slice Planes

Create multiple slice planes through volumetric data. Draw contours of the data values in each of the slice planes. Let MATLAB choose the contour levels. 

Create `V` as an array of volume data defined by v=xe<sup>-x<sup>2</sup>-y<sup>2</sup>-z<sup>2</sup></sup>. Draw contours in three slice planes that are orthogonal to the x-axis at the values -1.2`, `0.8`, and `2`. Do not create any slice planes that are orthogonal to the y-axis or z-axis by specifying empty arrays. Change the axes view to a 3-D view and add grid lines.

<pre class="mcode">
[X,Y,Z] = meshgrid(-2:.2:2);
V = X.*exp(-X.^2-Y.^2-Z.^2);

xslice = [-1.2,0.8,2];   
yslice = [];
zslice = [];
contourslice(X,Y,Z,V,xslice,yslice,zslice)
view(3)
grid on

fig2plotly()
</pre>

plot_1_0_draw_contours_in_slice_planes



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Contour Levels and Add Colorbar

Create multiple slice planes through volumetric data. Draw contours of the data values in each of the slice planes. Specify the levels where you want to draw the contours. Then, add a colorbar.

Draw contours in three slice planes that are orthogonal to the x-axis at the values -1.2`, `0.8`, and `2`. Draw contours for the volume data between the values -0.2` and `0.4`, spaced every `0.01`. Add a colorbar to see how the data values map to the contour colors. Also, change the axes view to a 3-D view and add grid lines.

<pre class="mcode">
[X,Y,Z] = meshgrid(-2:.2:2);
V = X.*exp(-X.^2-Y.^2-Z.^2);
xslice = [-1.2,0.8,2];   
lvls = -0.2:0.01:0.4;

contourslice(X,Y,Z,V,xslice,[],[],lvls)
colorbar
view(3)
grid on

fig2plotly()
</pre>

plot_2_0_specify_contour_levels_and_add_colorbar



<!--------------------- EXAMPLE BREAK ------------------------->

## Draw Contours Along Surface Slice

Create a surface slice through volumetric data and draw contours along the surface of the volume data. Specify the number of contour levels to draw.

Create `V` as an array of volume data defined by v=xe<sup>-x<sup>2</sup>-y<sup>2</sup>-z<sup>2</sup></sup>. Then, show a slice of the volume data along the surface defined by z=x<sup>2</sup>-y<sup>2</sup>. Draw 20 contours along the surface. Change the axes view to a 3-D view and add grid lines.

<pre class="mcode">
[X,Y,Z] = meshgrid(-5:0.2:5);
V = X.*exp(-X.^2-Y.^2-Z.^2);

[xsurf,ysurf] = meshgrid(-2:0.2:2);
zsurf = xsurf.^2-ysurf.^2;
contourslice(X,Y,Z,V,xsurf,ysurf,zsurf,20)
view(3)
grid on

fig2plotly()
</pre>

plot_3_0_draw_contours_along_surface_slice



<!--------------------- EXAMPLE BREAK ------------------------->

