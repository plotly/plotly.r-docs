---
description: How to make Lines on Maps plots in MATLAB<sup>&reg;</sup> with Plotly.
name: Lines on Maps
display_as: maps
order: 1
permalink: matlab/lines-on-maps/
thumbnail: thumbnail/flight-paths.jpg
layout: base
language: matlab
page_type: u-guide
---

## Create Geographic Plot

Plot a straight line between two points on a map. Specify the endpoints of the line using the coordinates of Seattle and Anchorage. Specify latitude and longitude in degrees.

<pre class="mcode">
latSeattle = 47.62;
lonSeattle = -122.33;
latAnchorage = 61.20;
lonAnchorage = -149.9;
</pre>

Plot the data on a map. Customize the appearance of the line using the line specification `'g-*'`. Adjust the latitude and longitude limits of the map using `geolimits`.

<pre class="mcode">
geoplot([latSeattle latAnchorage],[lonSeattle lonAnchorage],'g-*')
geolimits([45 62],[-149 -123])

fig2plotly()
</pre>

plot_0_0_create_geographic_plot



<!--------------------- EXAMPLE BREAK ------------------------->

## Add Text to Geographic Plot

Plot a straight line between two points on a map. Specify the endpoints of the line using the coordinates of Seattle and Anchorage. Specify latitude and longitude in degrees.

<pre class="mcode">
latSeattle = 47.62;
lonSeattle = -122.33;
latAnchorage = 61.20;
lonAnchorage = -149.9;
</pre>

Plot the data using `geoplot`. Customize the appearance of the line using the line specification `'g-*'`. Adjust the latitude and longitude limits of the map using `geolimits`.

<pre class="mcode">
geoplot([latSeattle latAnchorage],[lonSeattle lonAnchorage],'g-*')
geolimits([45 62],[-149 -123])

fig2plotly()
</pre>

plot_1_0_add_text_to_geographic_plot

Identify Anchorage using the `text` function.

<pre class="mcode">
text(latAnchorage,lonAnchorage,'Anchorage');
</pre>

plot_1_0_add_text_to_geographic_plot

Identify Seattle using the `text` function. Adjust the alignment of the text label by specifying properties of the `Text` object.

<pre class="mcode">
text(latSeattle,lonSeattle,'Seattle',...
    'HorizontalAlignment','right',...
    'VerticalAlignment','bottom');
</pre>

plot_1_0_add_text_to_geographic_plot



<!--------------------- EXAMPLE BREAK ------------------------->

## Customize Individual Lines on Map

Specify the latitude and longitude coordinates of Seattle, Anchorage, and Point Barrow.

<pre class="mcode">
latSeattle = 47.62;
lonSeattle = -122.33;

latAnchorage = 61.20;
lonAnchorage = -149.9;

latPtBarrow = 71.38;
lonPtBarrow = -156.47;
</pre>

Plot straight lines from Seattle to each of the other two cities. Draw a solid yellow line from Seattle to Anchorage and a dotted blue line between Seattle and Point Barrow. Adjust the latitude and longitude limits of the map using `geolimits`.

<pre class="mcode">
geoplot([latSeattle latAnchorage],[lonSeattle lonAnchorage],'y-',...
    [latSeattle latPtBarrow],[lonSeattle lonPtBarrow],'b:')
geolimits([44 73],[-149 -123])

fig2plotly()
</pre>

plot_2_0_customize_individual_lines_on_map

Label each city on the map using the `text` function.

<pre class="mcode">
text(latAnchorage,lonAnchorage,'Anchorage');
text(latPtBarrow,lonPtBarrow,'Point Barrow');
text(latSeattle,lonSeattle,'Seattle',...
    'VerticalAlignment','bottom');
</pre>

plot_2_0_customize_individual_lines_on_map



<!--------------------- EXAMPLE BREAK ------------------------->

## Use Chart Line Properties to Customize Appearance of the Line

Plot a straight line between two points on a map. Specify the endpoints of the line using the coordinates of Seattle and Anchorage. Specify latitude and longitude in degrees.

<pre class="mcode">
latSeattle = 47.62;
lonSeattle = -122.33;
latAnchorage = 61.20;
lonAnchorage = -149.9;
</pre>

Plot the data using `geoplot`. Adjust the latitude and longitude limits of the map using `geolimits`. Customize the appearance of the line by specifying the `LineWidth` and `Color` properties.

<pre class="mcode">
geoplot([latSeattle latAnchorage],[lonSeattle lonAnchorage],...
    'LineWidth',2,'Color',[.6 0 0])
geolimits([45 62],[-149 -123])

fig2plotly()
</pre>

plot_3_0_use_chart_line_properties_to_customize_appearance_o



<!--------------------- EXAMPLE BREAK ------------------------->

## Change Basemap Used in Geographic Plot

Plot a straight line between two points on a map. Specify the endpoints of the line using the coordinates of Seattle and Anchorage. Specify latitude and longitude in degrees.

<pre class="mcode">
latSeattle = 47.62;
lonSeattle = -122.33;
latAnchorage = 61.20;
lonAnchorage = -149.9;
</pre>

Plot the data using `geoplot`. Adjust the latitude and longitude limits of the map using `geolimits`.

<pre class="mcode">
geoplot([latSeattle latAnchorage],[lonSeattle lonAnchorage])
geolimits([45 62],[-149 -123])

fig2plotly()
</pre>

plot_4_0_change_basemap_used_in_geographic_plot

Change the basemap used in the plot using the `geobasemap` function.

<pre class="mcode">
geobasemap colorterrain
</pre>

plot_4_0_change_basemap_used_in_geographic_plot



<!--------------------- EXAMPLE BREAK ------------------------->

