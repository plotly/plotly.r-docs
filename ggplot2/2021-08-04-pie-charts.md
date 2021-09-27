---
description: How to make Pie Charts plots in MATLAB<sup>&reg;</sup> with Plotly.
name: Pie Charts
display_as: basic
order: 4
permalink: matlab/pie-charts/
thumbnail: thumbnail/pie-chart.jpg
layout: base
language: matlab
page_type: u-guide
---

## Create Pie Chart with Offset Slices

Create a pie chart of vector `X`.

<pre class="mcode">
X = [1 3 0.5 2.5 2];
pie(X)

fig2plotly()
</pre>

plot_0_0_create_pie_chart_with_offset_slices

Offset the second and fourth pie slices by setting the corresponding `explode` elements to 1.

<pre class="mcode">
explode = [0 1 0 1 0];
pie(X,explode)

fig2plotly()
</pre>

plot_0_1_create_pie_chart_with_offset_slices



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Text Labels for Pie Chart

Create a pie chart of vector `X` and label the slices.

<pre class="mcode">
X = 1:3;
labels = {'Taxes','Expenses','Profit'};
pie(X,labels)

fig2plotly()
</pre>

plot_1_0_specify_text_labels_for_pie_chart



<!--------------------- EXAMPLE BREAK ------------------------->

## Modify Text Label for Pie Chart

Create a labeled pie chart, and then modify the color and font size of the text labels.

<pre class="mcode">
X = 1:3;
labels = {'Taxes','Expenses','Profit'};
p = pie(X,labels)

fig2plotly()
</pre>

plot_2_0_modify_text_label_for_pie_chart


<pre class="codeoutput">p = 
  1x6 graphics array:

    Patch    Text     Patch    Text     Patch    Text 

</pre>


Get the text object for the label 'Profit'. Change its color and font size. Use dot notation to set properties.

<pre class="mcode">
t = p(6);
t.BackgroundColor = 'cyan';
t.EdgeColor = 'red';
t.FontSize = 14;

fig2plotly()
</pre>

plot_2_1_modify_text_label_for_pie_chart



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Format for Percentage Labels

Create a pie chart, and specify a format expression to display each label with three digits after the decimal point. To include a percent sign in the labels, specify `'%%'` at the end of the expression.

<pre class="mcode">
X = [1/3 2/3];
pie(X,'%.3f%%')

fig2plotly()
</pre>

plot_3_0_specify_format_for_percentage_labels



<!--------------------- EXAMPLE BREAK ------------------------->

## Plot Partial Pie Chart

Create a pie chart of vector `X` where the sum of the elements is less than 1.

<pre class="mcode">
X = [0.19 0.22 0.41];
pie(X)

fig2plotly()
</pre>

plot_4_0_plot_partial_pie_chart

`pie` draws a partial pie because the sum of the elements is less than 1.



<!--------------------- EXAMPLE BREAK ------------------------->

## Compare Two Pie Charts

Create vectors `y2010` and `y2011`, that contain financial data for two years. Then create a cell array containing the labels for the values.

<pre class="mcode">
y2010 = [50 0 100 95];
y2011 = [65 22 97 120];
labels = {'Investments','Cash','Operations','Sales'};

fig2plotly()
</pre>

Create a 1-by-2 tiled chart layout, and display two pie charts that each have a title. Then display a shared legend in the east tile of the layout. To do this, call the `legend` function with a return argument to store the legend object. Then move the legend to the east tile by setting the `Layout.Tile` property to `'east'`.

<pre class="mcode">
t = tiledlayout(1,2,'TileSpacing','compact');

% Create pie charts
ax1 = nexttile;
pie(ax1,y2010)
title('2010')

ax2 = nexttile;
pie(ax2,y2011)
title('2011')

% Create legend
lgd = legend(labels);
lgd.Layout.Tile = 'east';

fig2plotly()
</pre>

plot_5_1_compare_two_pie_charts



<!--------------------- EXAMPLE BREAK ------------------------->

## Plot Categorical Pie Chart with Offsets

Plot a categorical pie chart with offset slices corresponding to categories.

<pre class="mcode">
X = categorical({'North','South','North','East','South','West'});
explode = {'North','South'};
pie(X,explode)

fig2plotly()
</pre>

plot_6_0_plot_categorical_pie_chart_with_offsets

Now, use a logical vector to offset the same slices.

<pre class="mcode">
explode = [0 1 1 0];
pie(X,explode)

fig2plotly()
</pre>

plot_6_1_plot_categorical_pie_chart_with_offsets



<!--------------------- EXAMPLE BREAK ------------------------->

## Plot Categorical Pie Chart with Labels

Plot a categorical pie chart without any offset slices and label the slices. When `X` is of data type `categorical` you must specify the input argument `explode`. To specify labels without any offset slices, specify `explode` as an empty cell array, and `labels` as the labels.

<pre class="mcode">
X = categorical({'North','South','North','East','South','West'});
explode = {};
labels = {'E','N','S','W'};
pie(X,explode,labels)

fig2plotly()
</pre>

plot_7_0_plot_categorical_pie_chart_with_labels

Now, offset a slice and label all slices.

<pre class="mcode">
X = categorical({'North','South','North','East','South','West'});
explode = {'West'};
labels = {'E','N','S','W'};
pie(X,explode,labels)

fig2plotly()
</pre>

plot_7_1_plot_categorical_pie_chart_with_labels



<!--------------------- EXAMPLE BREAK ------------------------->

