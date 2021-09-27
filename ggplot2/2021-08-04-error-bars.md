---
description: How to make Error Bar plots in MATLAB<sup>&reg;</sup> with Plotly.
name: Error Bars
display_as: statistical
order: 1
permalink: matlab/error-bars/
thumbnail: thumbnail/error-bar.jpg
layout: base
language: matlab
page_type: u-guide
---

## Plot Vertical Error Bars of Equal Length

Create vectors `x` and `y`. Plot `y` versus `x`. At each data point, display vertical error bars that are equal in length.

<pre class="mcode">
x = 1:10:100;
y = [20 30 45 40 60 65 80 75 95 90];
err = 8*ones(size(y));
errorbar(x,y,err)

fig2plotly()
</pre>

plot_0_0_plot_vertical_error_bars_of_equal_length



<!--------------------- EXAMPLE BREAK ------------------------->

## Plot Vertical Error Bars that Vary in Length

Create a line plot with error bars at each data point. Vary the lengths of the error bars. 

<pre class="mcode">
x = 1:10:100;
y = [20 30 45 40 60 65 80 75 95 90]; 
err = [5 8 2 9 3 3 8 3 9 3];
errorbar(x,y,err)

fig2plotly()
</pre>

plot_1_0_plot_vertical_error_bars_that_vary_in_length



<!--------------------- EXAMPLE BREAK ------------------------->

## Plot Horizontal Error Bars

Create a line plot with horizontal error bars at each data point. 

<pre class="mcode">
x = 1:10:100;
y = [20 30 45 40 60 65 80 75 95 90];
err = [1 3 5 3 5 3 6 4 3 3];
errorbar(x,y,err,'horizontal')

fig2plotly()
</pre>

plot_2_0_plot_horizontal_error_bars



<!--------------------- EXAMPLE BREAK ------------------------->

## Plot Vertical and Horizontal Error Bars

Create a line plot with both vertical and horizontal error bars at each data point. 

<pre class="mcode">
x = 1:10:100;
y = [20 30 45 40 60 65 80 75 95 90];
err = [4 3 5 3 5 3 6 4 3 3];
errorbar(x,y,err,'both')

fig2plotly()
</pre>

plot_3_0_plot_vertical_and_horizontal_error_bars



<!--------------------- EXAMPLE BREAK ------------------------->

## Plot Error Bars with No Line

Plot vectors `y` versus `x`. At each data point, display a circle marker with both vertical and horizontal error bars. Do not display the line that connects the data points by omitting the line style option for the `linespec` input argument.

<pre class="mcode">
x = 1:10:100;
y = [20 30 45 40 60 65 80 75 95 90];
err = [4 3 5 3 5 3 6 4 3 3];
errorbar(x,y,err,'both','o')

fig2plotly()
</pre>

plot_4_0_plot_error_bars_with_no_line



<!--------------------- EXAMPLE BREAK ------------------------->

## Control Error Bars Lengths in All Directions

Display both vertical and horizontal error bars at each data point. Control the lower and upper lengths of the vertical error bars using the `yneg` and `ypos` input argument options, respectively. Control the left and right lengths of the horizontal error bars using the `xneg` and `xpos` input argument options, respectively. 

<pre class="mcode">
x = 1:10:100;
y = [20 30 45 40 60 65 80 75 95 90];
yneg = [1 3 5 3 5 3 6 4 3 3];
ypos = [2 5 3 5 2 5 2 2 5 5];
xneg = [1 3 5 3 5 3 6 4 3 3];
xpos = [2 5 3 5 2 5 2 2 5 5];
errorbar(x,y,yneg,ypos,xneg,xpos,'o')

fig2plotly()
</pre>

plot_5_0_control_error_bars_lengths_in_all_directions



<!--------------------- EXAMPLE BREAK ------------------------->

## Plot Datetime Values with Error Bars

Create a plot of datetime values with error bars in duration units. 

<pre class="mcode">
x = 1:13;
y = datetime(2018,5,1,1:13,0,0);
err = hours(rand(13,1));
errorbar(x,y,err)

fig2plotly()
</pre>

plot_6_0_plot_datetime_values_with_error_bars



<!--------------------- EXAMPLE BREAK ------------------------->

## Add Colored Markers to Each Data Point

Create a line plot with error bars. At each data point, display a marker. Control the appearance of the marker using name-value pair arguments. Use `MarkerSize` to specify the marker size in points. Use `MarkerEdgeColor` and `MarkerFaceColor` to specify the marker outline and interior colors, respectively. Set the colors to either a character vector of a color name, such as `'red'`, or an RGB triplet. 

<pre class="mcode">
x = linspace(0,10,15);
y = sin(x/2);
err = 0.3*ones(size(y));
errorbar(x,y,err,'-s','MarkerSize',10,...
    'MarkerEdgeColor','red','MarkerFaceColor','red')

fig2plotly()
</pre>

plot_7_0_add_colored_markers_to_each_data_point



<!--------------------- EXAMPLE BREAK ------------------------->

## Control Error Bar Cap Size

Control the size of the caps at the end of each error bar by setting the `CapSize` property to a positive value in points.

<pre class="mcode">
x = linspace(0,2,15);
y = exp(x);
err = 0.3*ones(size(y));
errorbar(x,y,err,'CapSize',18)

fig2plotly()
</pre>

plot_8_0_control_error_bar_cap_size



<!--------------------- EXAMPLE BREAK ------------------------->

## Modify Error Bars After Creation

Create a line plot with error bars. Assign the errorbar object to the variable `e`.

<pre class="mcode">
x = linspace(0,10,10);
y = sin(x/2);
err = 0.3*ones(size(y));
e = errorbar(x,y,err)

fig2plotly()
</pre>

plot_9_0_modify_error_bars_after_creation


<pre class="codeoutput">e = 
  ErrorBar with properties:

             Color: [0 0.4470 0.7410]
         LineStyle: '-'
         LineWidth: 0.5000
            Marker: 'none'
             XData: [1x10 double]
             YData: [1x10 double]
    XNegativeDelta: [1x0 double]
    XPositiveDelta: [1x0 double]
    YNegativeDelta: [1x10 double]
    YPositiveDelta: [1x10 double]

  Show all properties

</pre>


Use `e` to access properties of the errorbar object after it is created.

<pre class="mcode">
e.Marker = '*';
e.MarkerSize = 10;
e.Color = 'red';
e.CapSize = 15;

fig2plotly()
</pre>

plot_9_1_modify_error_bars_after_creation



<!--------------------- EXAMPLE BREAK ------------------------->

