---
description: How to make Bubble Maps plots in MATLAB<sup>&reg;</sup> with Plotly.
name: Bubble Maps
display_as: maps
order: 4
permalink: matlab/bubble-maps/
thumbnail: thumbnail/bubble-map.jpg
layout: base
language: matlab
page_type: u-guide
---

## Display Data from Tsunamis Table on Geographic Bubble Chart

Read data about tsunamis into the workspace as a table. The rows represent individual tsunami occurrences. The columns represent data about a set of variables for each tsunami, such as their locations (latitude and longitude), causes, and wave heights. 

<pre class="mcode">
tsunamis = readtable('tsunamis.xlsx');
</pre>

Convert one of the table variables into a categorical variable to specify the color of the bubbles. The `Cause` variable attributes a cause to each tsunami, such as, `'Earthquake`', `'Volcano'`, or `'Earthquake and Landslide'`. Convert the `Cause` variable from a cell array of character vectors into a categorical variable.

<pre class="mcode">
tsunamis.Cause = categorical(tsunamis.Cause);
</pre>

Create a geographic bubble chart, plotting the locations of the tsunamis on a map. Specify the names of the table variables that hold location information: `Latitude` and `Longitude`. Use the `MaxHeight` table variable to specify the size of the bubbles. The example uses the `Cause` variable, converted earlier into a categorical variable, to specify the color of the bubbles.

<pre class="mcode">
geobubble(tsunamis,'Latitude','Longitude', ...
    'SizeVariable','MaxHeight','ColorVariable','Cause')

fig2plotly()
</pre>

plot_0_0_display_data_from_tsunamis_table_on_geographic_bubb



<!--------------------- EXAMPLE BREAK ------------------------->

## Display Tsunami Data Using Bubble Size to Indicate Tsunami Size

Read data about tsunamis into the workspace as a table. The rows represent individual tsunami occurrences. The columns represent data about a set of variables for each tsunami, such as their locations (latitude and longitude), causes, and wave heights. 

<pre class="mcode">
tsunamis = readtable('tsunamis.xlsx');
</pre>

Create a geographic bubble chart, plotting the locations of the tsunamis on a map. Use the data from the `MaxHeight` variable to specify the size of the bubble. In this example, you pass the data directly to `geobubble`. Alternatively, you can also pass `geobubble` the name of the table and then specify the data by table variable names.

<pre class="mcode">
geobubble(tsunamis.Latitude,tsunamis.Longitude,tsunamis.MaxHeight)

fig2plotly()
</pre>

plot_1_0_display_tsunami_data_using_bubble_size_to_indicate_



<!--------------------- EXAMPLE BREAK ------------------------->

## Display Tsunami Data Using Bubble Color to Indicate Tsunami Cause

Read data about tsunamis into the workspace as a table. The rows represent individual tsunami occurrences. The columns represent data about each occurrence, such as the cause of each tsunami. 

<pre class="mcode">
tsunamis = readtable('tsunamis.xlsx');
</pre>

Create a categorical variable because the data that controls the color of the bubbles must be a categorical variable. The tsunami table variable `Cause` already categorizes the tsunamis by seven criteria: Earthquake, Earthquake and Landslide, Volcano, Volcano and Landslide, Landslide, Meteorological, and Unknown Cause. Put the `Cause` variable data into a categorical variable.

<pre class="mcode">
cause = categorical(tsunamis.Cause);
</pre>

Create a geographic bubble chart, plotting the locations of the tsunamis on a map. Use bubble size to indicate the size of the wave, and use bubble color to indicate the cause. When you pass in the data, rather than specifying the names of table variables that contain the data, `geobubble` does not automatically add titles to the size and color legends. 

<pre class="mcode">
geobubble(tsunamis.Latitude,tsunamis.Longitude,tsunamis.MaxHeight,cause)

fig2plotly()
</pre>

plot_2_0_display_tsunami_data_using_bubble_color_to_indicate



<!--------------------- EXAMPLE BREAK ------------------------->

## Add Legend Titles Using Geographic Bubble Chart Properties

Read data about tsunamis into the workspace as a table. The rows represent individual tsunami occurrences. The columns represent data about a set of variables for each tsunami, such as its location (latitude and longitude), cause, and maximum height of the wave.

<pre class="mcode">
tsunamis = readtable('tsunamis.xlsx');
</pre>

Turn one of the table variables into a categorical variable to specify the color of the bubbles. The `Cause` variable attributes a cause to each tsunami, such as, `'Earthquake'`, `'Volcano'`, or `'Earthquake and Landslide'`. Convert the `Cause` variable from a cell array of character vectors into a categorical variable.

<pre class="mcode">
colordata = categorical(tsunamis.Cause);
</pre>

Create a geographic bubble chart, plotting the locations of the tsunamis on a map. Use bubble size to indicate the size of the wave, and use bubble color to indicate the cause of the tsunami. Add a title using a name-value pair.

<pre class="mcode">
gb = geobubble(tsunamis.Latitude,tsunamis.Longitude,tsunamis.MaxHeight,colordata,'Title','Tsunamis');

fig2plotly()
</pre>

plot_3_0_add_legend_titles_using_geographic_bubble_chart_pro

Use properties of the geographic bubble chart to modify the chart. For example, add titles to the size and color legends. (If you specify the table as an argument, `geobubble` adds legend titles automatically, using the names of table variables.)

<pre class="mcode">
gb.SizeLegendTitle = 'Max Height';
gb.ColorLegendTitle = 'Cause';

fig2plotly()
</pre>

plot_3_1_add_legend_titles_using_geographic_bubble_chart_pro



<!--------------------- EXAMPLE BREAK ------------------------->

