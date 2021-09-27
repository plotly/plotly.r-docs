---
description: How to make 3D Horizontal Bar Plots in MATLAB<sup>&reg;</sup> with Plotly.
name: 3D Horizontal Bar Plots
display_as: 3d_charts
order: 16
permalink: matlab/3d-horizontal-bar-plots/
thumbnail: thumbnail/
layout: base
language: matlab
page_type: u-guide
---

## Create 3-D Horizontal Bar Graph

Load the data set `count.dat`, which returns a three-column matrix, `count`. Store `Y` as the first ten rows of `count`.

<pre class="mcode">
load count.dat
Y = count(1:10,:);
</pre>

Create a 3-D horizontal bar graph of `Y`. By default, the style is `detached`.

<pre class="mcode">
figure
bar3h(Y)

fig2plotly('TreatAs', 'bar3h')
</pre>

plot_0_0_create_3_d_horizontal_bar_graph



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Bar Width for 3-D Horizontal Bar Graph

Load the data set `count.dat`, which returns a three-column matrix, `count`. Store `Y` as the first ten rows of `count`.

<pre class="mcode">
load count.dat;
Y = count(1:10,:);
</pre>

Create a 3-D horizontal bar graph of `Y` and set the bar width to 0.5.

<pre class="mcode">
width = 0.5;

figure
bar3h(Y,width)
title('Width of 0.5')

fig2plotly('TreatAs', 'bar3h')
</pre>

plot_1_0_specify_bar_width_for_3_d_horizontal_bar_graph



<!--------------------- EXAMPLE BREAK ------------------------->

## 3-D Horizontal Bar Graph with Grouped Style

Load the data set `count.dat`, which returns a three-column matrix, `count`. Store `Y` as the first ten rows of `count`.

<pre class="mcode">
load count.dat
Y = count(1:10,:);
</pre>

Create a 3-D horizontal bar graph of Y and specify the style option as `grouped`.

<pre class="mcode">
figure
bar3h(Y,'grouped')
title('Grouped Style Option')

fig2plotly('TreatAs', 'bar3h')
</pre>

plot_2_0_3_d_horizontal_bar_graph_with_grouped_style



<!--------------------- EXAMPLE BREAK ------------------------->

## 3-D Horizontal Bar Graph with Stacked Option

Load the data set `count.dat`, which returns a three-column matrix, `count`. Store `Y` as the first ten rows of `count`.

<pre class="mcode">
load count.dat
Y = count(1:10,:);
</pre>

Create a 3-D horizontal bar graph of Y and specify the style option as `stacked`.

<pre class="mcode">
figure
bar3h(Y,'stacked')
title('Stacked Style Option')

fig2plotly('TreatAs', 'bar3h')
</pre>

plot_3_0_3_d_horizontal_bar_graph_with_stacked_option



<!--------------------- EXAMPLE BREAK ------------------------->

