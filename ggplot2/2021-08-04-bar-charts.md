---
description: How to make Bar Charts plots in MATLAB<sup>&reg;</sup> with Plotly.
name: Bar Charts
display_as: basic
order: 3
permalink: matlab/bar-charts/
thumbnail: thumbnail/bar.jpg
layout: base
language: matlab
page_type: u-guide
---

## Create Bar Graph

<pre class="mcode">
y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
bar(y)

fig2plotly()
</pre>

plot_0_0_create_bar_graph



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Bar Locations

Specify the bar locations along the x-axis. 

<pre class="mcode">
x = 1900:10:2000;
y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
bar(x,y)

fig2plotly()
</pre>

plot_1_0_specify_bar_locations



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Bar Width

Set the width of each bar to 40 percent of the total space available for each bar. 

<pre class="mcode">
y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
bar(y,0.4)

fig2plotly()
</pre>

plot_2_0_specify_bar_width



<!--------------------- EXAMPLE BREAK ------------------------->

## Display Groups of Bars

Display four groups of three bars.

<pre class="mcode">
y = [2 2 3; 2 5 6; 2 8 9; 2 11 12];
bar(y)

fig2plotly()
</pre>

plot_3_0_display_groups_of_bars



<!--------------------- EXAMPLE BREAK ------------------------->

## Display Stacked Bars

Display one bar for each row of the matrix. The height of each bar is the sum of the elements in the row.

<pre class="mcode">
y = [2 2 3; 2 5 6; 2 8 9; 2 11 12];
bar(y,'stacked')

fig2plotly()
</pre>

plot_4_0_display_stacked_bars


<pre class="mcode">
measles = [38556 24472 14556 18060 19549 8122 28541 7880 3283 4135 7953 1884]';
mumps = [20178 23536 34561 37395 36072 32237 18597 9408 6005 6268 8963 13882]';
chickenPox = [37140 32169 37533 39103 33244 23269 16737 5411 3435 6052 12825 23332]';

fig = figure;
bar(1:12, [measles mumps chickenPox], 0.5, 'stack');
axis([0 13 0 100000]);
title('Childhood diseases by month');
xlabel('Month');
ylabel('Cases (in thousands)');
legend('Measles', 'Mumps', 'Chicken pox');

fig2plotly();
</pre>

{% capture var_charts_plot_1 %}
  {% raw %}
{ "data": [ { "name": "Measles", "type": "bar", "xsrc": "danton267:1471:cbc1e0", "x": [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], "ysrc": "danton267:1471:223ef8", "y": [ 38556, 24472, 14556, 18060, 19549, 8122, 28541, 7880, 3283, 4135, 7953, 1884 ], "xaxis": "x1", "yaxis": "y1", "marker": { "line": { "dash": "solid", "color": "rgb(0,0,0)", "width": 0.5 }, "color": "rgb(0,113.985,188.955)" }, "visible": true, "showlegend": true, "orientation": "v" }, { "name": "Mumps", "type": "bar", "xsrc": "danton267:1471:cbc1e0", "x": [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], "ysrc": "danton267:1471:3ccd5a", "y": [ 20178, 23536, 34561, 37395, 36072, 32237, 18597, 9408, 6005, 6268, 8963, 13882 ], "xaxis": "x1", "yaxis": "y1", "marker": { "line": { "dash": "solid", "color": "rgb(0,0,0)", "width": 0.5 }, "color": "rgb(216.75,82.875,24.99)" }, "visible": true, "showlegend": true, "orientation": "v" }, { "name": "Chicken pox", "type": "bar", "xsrc": "danton267:1471:cbc1e0", "x": [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], "ysrc": "danton267:1471:e65fc5", "y": [ 37140, 32169, 37533, 39103, 33244, 23269, 16737, 5411, 3435, 6052, 12825, 23332 ], "xaxis": "x1", "yaxis": "y1", "marker": { "line": { "dash": "solid", "color": "rgb(0,0,0)", "width": 0.5 }, "color": "rgb(236.895,176.97,31.875)" }, "visible": true, "showlegend": true, "orientation": "v" } ], "layout": { "title": "<b>Childhood diseases by month</b>", "width": 840, "bargap": 0, "height": 630, "legend": { "x": 0.675595241660873, "y": 0.774603178009154, "font": { "size": 9, "color": "rgb(0,0,0_)", "family": "Arial, sans-serif" }, "xref": "paper", "yref": "paper", "bgcolor": "rgb(255,255,255)", "xanchor": "left", "yanchor": "bottom", "traceorder": "normal", "bordercolor": "rgb(38.25,38.25,38.25)", "borderwidth": 0.5 }, "margin": { "b": 0, "l": 0, "r": 0, "t": 0, "pad": 0 }, "scene1": { "domain": { "x": [ 0.13, 0.905 ], "y": [ 0.11, 0.925 ] } }, "xaxis1": { "side": "bottom", "type": "linear", "range": [ 0, 13 ], "ticks": "inside", "title": "Month", "anchor": "y1", "domain": [ 0.13, 0.905 ], "mirror": "ticks", "nticks": 13, "ticklen": 6.51, "autotick": true, "showgrid": false, "showline": true, "tickfont": { "size": 10, "color": "rgb(38.25,38.25,38.25)", "family": "Arial, sans-serif" }, "zeroline": false, "autorange": false, "gridcolor": "rgb(38.25,38.25,38.25)", "gridwidth": 1, "linecolor": "rgb(38.25,38.25,38.25)", "linewidth": 1, "tickcolor": "rgb(38.25,38.25,38.25)", "tickwidth": 1, "titlefont": { "size": 11, "color": "rgb(38.25,38.25,38.25)", "family": "Arial, sans-serif" }, "exponentformat": "none" }, "yaxis1": { "side": "left", "type": "linear", "range": [ 0, 100000 ], "ticks": "inside", "title": "Cases (in thousands)", "anchor": "x1", "domain": [ 0.11, 0.925 ], "mirror": "ticks", "nticks": 12, "ticklen": 6.51, "autotick": true, "showgrid": false, "showline": true, "tickfont": { "size": 10, "color": "rgb(38.25,38.25,38.25)", "family": "Arial, sans-serif" }, "zeroline": false, "autorange": false, "gridcolor": "rgb(38.25,38.25,38.25)", "gridwidth": 1, "linecolor": "rgb(38.25,38.25,38.25)", "linewidth": 1, "tickcolor": "rgb(38.25,38.25,38.25)", "tickwidth": 1, "titlefont": { "size": 11, "color": "rgb(38.25,38.25,38.25)", "family": "Arial, sans-serif" }, "exponentformat": "none" }, "barmode": "relative", "autosize": false, "hovermode": "closest", "titlefont": { "color": "rgba(0,0,0,0)" }, "showlegend": true, "annotations": [ { "x": 0.5175, "y": 0.935, "font": { "size": 11, "color": "rgb(0,0,0)", "family": "Arial, sans-serif" }, "text": "<b>Childhood diseases by month</b>", "xref": "paper", "yref": "paper", "align": "center", "xanchor": "center", "yanchor": "bottom", "borderpad": 3, "showarrow": false, "textangle": 0, "bordercolor": "rgba(0,0,0,0)", "borderwidth": 0.5 } ], "bargroupgap": 0.5, "paper_bgcolor": "rgb(255,255,255)" }, "frames": [] }
  {% endraw %}
{% endcapture %}
{% include posts/ssim_frame.html 
  raw_json_file=var_charts_plot_1
  index=1
%}


<!--------------------- EXAMPLE BREAK ------------------------->

## Display Stacked Bars with Negative Data

Define `x` as a vector of three year values. Define `y` as a matrix that contains a combination of negative and positive values. Display the values in a bar graph.

<pre class="mcode">
x = [1980 1990 2000];
y = [15 20 -5; 10 -17 21; -10 5 15];
bar(x,y,'stacked')

fig2plotly()
</pre>

plot_5_0_display_stacked_bars_with_negative_data



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Categorical Data

One way to indicate categories for your bars is to specify `X` as a categorical array. The `bar` function uses a sorted list of the categories, so the bars might display in a different order than you expect. To preserve the order, call the `reordercats` function.

Define `X` as categorical array, and call the `reordercats` function to specify the order for the bars. Then define `Y` as a vector of bar heights and display the bar graph.

<pre class="mcode">
X = categorical({'Small','Medium','Large','Extra Large'});
X = reordercats(X,{'Small','Medium','Large','Extra Large'});
Y = [10 21 33 52];
bar(X,Y)

fig2plotly()
</pre>

plot_6_0_specify_categorical_data



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Labels at the Ends of Bars

Define `vals` as a matrix containing the values of two data sets. Display the values in a bar graph and specify an output argument. Since there are two data sets, `bar` returns a vector containing two `Bar` objects.

<pre class="mcode">
x = [1 2 3];
vals = [2 3 6; 11 23 26];
b = bar(x,vals);

fig2plotly()
</pre>

plot_7_0_specify_labels_at_the_ends_of_bars

Display the values at the tips of the first series of bars. Get the coordinates of the tips of the bars by getting the `XEndPoints` and `YEndPoints` properties of the first `Bar` object. Pass those coordinates to the `text` function, and specify the vertical and horizontal alignment so that the values are centered above the tips of the bars.

<pre class="mcode">
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

fig2plotly()
</pre>

plot_7_1_specify_labels_at_the_ends_of_bars

Next, display the values above the tips of the second series of bars.

<pre class="mcode">
xtips2 = b(2).XEndPoints;
ytips2 = b(2).YEndPoints;
labels2 = string(b(2).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

fig2plotly()
</pre>

plot_7_2_specify_labels_at_the_ends_of_bars



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Axes for Bar Graph

Starting in R2019b, you can display a tiling of bar graphs using the `tiledlayout` and `nexttile` functions. Call the `tiledlayout` function to create a 2-by-1 tiled chart layout. Call the `nexttile` function to create the axes objects `ax1` and `ax2`. Display a bar graph in the top axes. In the bottom axes, display a stacked bar graph of the same data.

<pre class="mcode">
y = [1 2 3; 4 5 6];
tiledlayout(2,1)

% Top bar graph
ax1 = nexttile;
bar(ax1,y)

% Bottom bar graph
ax2 = nexttile;
bar(ax2,y,'stacked')

fig2plotly()
</pre>

plot_8_0_specify_axes_for_bar_graph



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Bar Color

Create a bar graph using red bars. 

<pre class="mcode">
y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
bar(y,'r')

fig2plotly()
</pre>

plot_9_0_specify_bar_color



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Bar and Outline Colors

Set the bar interior color and outline color using RGB triplets. Set the width of the bar outline.

<pre class="mcode">
y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
bar(y,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5)

fig2plotly()
</pre>

plot_10_0_specify_bar_and_outline_colors



<!--------------------- EXAMPLE BREAK ------------------------->

## Control Individual Bar Colors

Control individual bar colors using the `CData` property of the `Bar` object. 

Create a bar chart and assign the `Bar` object to a variable. Set the `FaceColor` property of the `Bar` object to `'flat'` so that the chart uses the colors defined in the `CData` property. By default, the `CData` property is prepopulated with a matrix of the default RGB color values. To change a particular color, change the corresponding row in the matrix. For example, change the color of the second bar. 

<pre class="mcode">
b = bar(rand(10,1));
b.FaceColor = 'flat';
b.CData(2,:) = [.5 0 .5];

fig2plotly()
</pre>

plot_11_0_control_individual_bar_colors



<!--------------------- EXAMPLE BREAK ------------------------->

## Bar Chart with Colormap Colors

Create a bar chart that uses colormap colors by setting the `FaceColor` property to `'flat'`. Then set the `CData` property for each `Bar` object to an integer.

<pre class="mcode">
y = [1 3 5; 3 2 7; 3 4 2];
b = bar(y,'FaceColor','flat');
for k = 1:size(y,2)
    b(k).CData = k;
end

fig2plotly()
</pre>

plot_12_0_bar_chart_with_colormap_colors



<!--------------------- EXAMPLE BREAK ------------------------->

## Customize One Series in Grouped or Stacked Bars

Create matrix `y`, where each column is a series of data. Call the `bar` function to display the data in a bar graph, and specify an output argument. The output is a vector of three `Bar` objects, where each object corresponds to a different series. This is true whether the bars are grouped or stacked.

<pre class="mcode">
y = [10 15 20; 30 35 40; 50 55 62];
b = bar(y);

fig2plotly()
</pre>

plot_13_0_customize_one_series_in_grouped_or_stacked_bars

Make the third series of bars green.

<pre class="mcode">
b(3).FaceColor = [.2 .6 .5];

fig2plotly()
</pre>

plot_13_1_customize_one_series_in_grouped_or_stacked_bars




<pre class="mcode">
x = 1900:10:2000;

y1 = [75.99,91.92,105.71,...
       123.23,131.69,...
       150.67,179.33,203.12,...
       226.55,249.63,281.42];

y2 = [55.2,61.972,65.71,...
       76.23,87.669,...
       91.7,103.23,124.21,...
       130.55,135.63,145.22];

fig = figure('Color','w');
bar(x, [y1' y2'],'grouped');
ax = get(gca);
cat = ax.Children;

set(cat(2),'FaceColor',[145 25 206]/255,'BarWidth',2);

set(cat(1),'FaceColor',[45 125 206]/255,'BarWidth',2);

set(gca,'box','off');

fig2plotly();
</pre>

{% capture var_charts_plot_2 %}
  {% raw %}
{ "data": [ { "name": "", "type": "bar", "xsrc": "danton267:1473:f091f2", "x": [ 1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000 ], "ysrc": "danton267:1473:48e6d6", "y": [ 75.99, 91.92, 105.71, 123.23, 131.69, 150.67, 179.33, 203.12, 226.55, 249.63, 281.42 ], "xaxis": "x1", "yaxis": "y1", "marker": { "line": { "dash": "solid", "color": "rgb(0,0,0)", "width": 0.5 }, "color": "rgb(145,25,206)" }, "visible": true, "showlegend": true, "orientation": "v" }, { "name": "", "type": "bar", "xsrc": "danton267:1473:f091f2", "x": [ 1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000 ], "ysrc": "danton267:1473:df74e2", "y": [ 55.2, 61.972, 65.71, 76.23, 87.669, 91.7, 103.23, 124.21, 130.55, 135.63, 145.22 ], "xaxis": "x1", "yaxis": "y1", "marker": { "line": { "dash": "solid", "color": "rgb(0,0,0)", "width": 0.5 }, "color": "rgb(45,125,206)" }, "visible": true, "showlegend": true, "orientation": "v" } ], "layout": { "title": "<b><b></b></b>", "width": 840, "bargap": 0, "height": 630, "margin": { "b": 0, "l": 0, "r": 0, "t": 0, "pad": 0 }, "scene1": { "domain": { "x": [ 0.13, 0.905 ], "y": [ 0.11, 0.925 ] } }, "xaxis1": { "side": "bottom", "type": "linear", "range": [ 1893.42857142857, 2006.57142857143 ], "ticks": "inside", "anchor": "y1", "domain": [ 0.13, 0.905 ], "mirror": false, "nticks": 12, "ticklen": 6.51, "autotick": true, "showgrid": false, "showline": true, "tickfont": { "size": 10, "color": "rgb(38.25,38.25,38.25)", "family": "Arial, sans-serif" }, "zeroline": false, "autorange": false, "gridcolor": "rgb(38.25,38.25,38.25)", "gridwidth": 1, "linecolor": "rgb(38.25,38.25,38.25)", "linewidth": 1, "tickcolor": "rgb(38.25,38.25,38.25)", "tickwidth": 1, "titlefont": { "size": 11, "color": "rgb(38.25,38.25,38.25)", "family": "Arial, sans-serif" }, "exponentformat": "none" }, "yaxis1": { "side": "left", "type": "linear", "range": [ 0, 300 ], "ticks": "inside", "anchor": "x1", "domain": [ 0.11, 0.925 ], "mirror": false, "nticks": 8, "ticklen": 6.51, "autotick": true, "showgrid": false, "showline": true, "tickfont": { "size": 10, "color": "rgb(38.25,38.25,38.25)", "family": "Arial, sans-serif" }, "zeroline": false, "autorange": false, "gridcolor": "rgb(38.25,38.25,38.25)", "gridwidth": 1, "linecolor": "rgb(38.25,38.25,38.25)", "linewidth": 1, "tickcolor": "rgb(38.25,38.25,38.25)", "tickwidth": 1, "titlefont": { "size": 11, "color": "rgb(38.25,38.25,38.25)", "family": "Arial, sans-serif" }, "exponentformat": "none" }, "barmode": "group", "autosize": false, "hovermode": "closest", "titlefont": { "color": "rgba(0,0,0,0)" }, "showlegend": false, "annotations": [ { "x": 0.5175, "y": 0.935, "font": { "size": 11, "color": "rgb(0,0,0)", "family": "Arial, sans-serif" }, "text": "<b><b></b></b>", "xref": "paper", "yref": "paper", "align": "center", "xanchor": "center", "yanchor": "bottom", "borderpad": 3, "showarrow": false, "textangle": 0, "bordercolor": "rgba(0,0,0,0)", "borderwidth": 0.5 } ], "bargroupgap": -1, "paper_bgcolor": "rgb(255,255,255)" }, "frames": [] }
  {% endraw %}
{% endcapture %}
{% include posts/ssim_frame.html 
  raw_json_file=var_charts_plot_2
  index=1
%}


<!--------------------- EXAMPLE BREAK ------------------------->
