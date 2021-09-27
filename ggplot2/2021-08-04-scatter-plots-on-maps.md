---
description: How to make Scatter Plots on Maps plots in MATLAB<sup>&reg;</sup> with Plotly.
name: Scatter Plots on Maps
display_as: maps
order: 1
permalink: matlab/scatter-plots-on-maps/
thumbnail: thumbnail/scatter-plot-on-maps.jpg
layout: base
language: matlab
page_type: u-guide
---

## Create Geographic Scatter Plot Controlling Color, Size, and Shape of Markers

Set up latitude and longitude data. 

<pre class="mcode">
lon = (-170:10:170);
lat = 50 * cosd(3*lon);
</pre>

Define data that controls the area of each marker. 

<pre class="mcode">
A = 101 + 100*(sind(2*lon));
</pre>

Define data to control the color of each marker.

<pre class="mcode">
C = cosd(4*lon);
</pre>

Plot the data on a geographic scatter plot, specifying the marker size data and the color data. Specify the marker as a triangle, rather than the default circle.

<pre class="mcode">
geoscatter(lat,lon,A,C,'^')

fig2plotly()
</pre>

plot_0_0_create_geographic_scatter_plot_controlling_color_si



<!--------------------- EXAMPLE BREAK ------------------------->

## Create Geographic Scatter Plot Specifying Basemap

Set up latitude and longitude data. 

<pre class="mcode">
lon = (-170:10:170);
lat = 50 * cosd(3*lon);
</pre>

Define the data that controls the area of each marker. 

<pre class="mcode">
A = 101 + 100*(sind(2*lon));
</pre>

Define the data that controls the color of each marker.

<pre class="mcode">
C = cosd(4*lon);
</pre>

Create the scatter plot on a set of geographic axes, specifying the marker size data and the color data. The example specifies the marker as a triangle, rather than the default circle. 

<pre class="mcode">
geoscatter(lat,lon,A,C,'^')

fig2plotly()
</pre>

plot_1_0_create_geographic_scatter_plot_specifying_basemap

Change the basemap of the geographic scatter plot.

<pre class="mcode">
geobasemap colorterrain
</pre>

plot_1_0_create_geographic_scatter_plot_specifying_basemap



<!--------------------- EXAMPLE BREAK ------------------------->

