---
description: How to make xxx plots in MATLAB<sup>&reg;</sup> with Plotly.
name: 3D Mathematical Expressions and Functions Plots
display_as: 3d_charts
order: 
permalink: matlab/3d-math-function-plots/
thumbnail: thumbnail/
layout: base
language: matlab
page_type: u-guide
---

## Plot 3-D Parametric Line

Plot the 3-D parametric line



<pre class="mcode">
x=sin(t)	
y=cos(t)	
z=t	

</pre>



over the default parameter range `[-5 5]`.

<pre class="mcode">
xt = @(t) sin(t);
yt = @(t) cos(t);
zt = @(t) t;
fplot3(xt,yt,zt)

fig2plotly()
</pre>

plot_0_0_plot_3_d_parametric_line



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Parameter Range

Plot the parametric line



<pre class="mcode">
x=e<sup>-t/10</sup>sin(5t)	
y=e<sup>-t/10</sup>cos(5t)	
z=t	

</pre>



over the parameter range `[-10 10]` by specifying the fourth input argument of `fplot3`.

<pre class="mcode">
xt = @(t) exp(-t/10).*sin(5*t);
yt = @(t) exp(-t/10).*cos(5*t);
zt = @(t) t;
fplot3(xt,yt,zt,[-10 10])

fig2plotly()
</pre>

plot_1_0_specify_parameter_range



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Line Properties and Display Markers

Plot the same 3-D parametric curve three times over different intervals of the parameter. For the first interval, use a line width of 2 points. For the second, specify a dashed red line style with circle markers. For the third, specify a cyan, dash-dotted line style with asterisk markers.

<pre class="mcode">
fplot3(@(t)sin(t), @(t)cos(t), @(t)t, [0 2*pi], 'LineWidth', 2)
hold on
fplot3(@(t)sin(t), @(t)cos(t), @(t)t, [2*pi 4*pi], '--or')
fplot3(@(t)sin(t), @(t)cos(t), @(t)t, [4*pi 6*pi], '-.*c')
hold off

fig2plotly()
</pre>

plot_2_0_specify_line_properties_and_display_markers



<!--------------------- EXAMPLE BREAK ------------------------->

## Plot Multiple Lines in Same Axes

Plot multiple lines in the same axes using `hold on`.

<pre class="mcode">
fplot3(@(t)t, @(t)t, @(t)t)
hold on
fplot3(@(t)-t, @(t)t, @(t)-t)
hold off

fig2plotly()
</pre>

plot_3_0_plot_multiple_lines_in_same_axes



<!--------------------- EXAMPLE BREAK ------------------------->

## Modify 3-D Parametric Line After Creation

Plot the parametric line



<pre class="mcode">
x=e<sup>-|t|/10</sup>sin(5|t|)	
y=e<sup>-|t|/10</sup>cos(5|t|)	
z=t.	

</pre>



Assign the parameterized function line object to a variable.

<pre class="mcode">
xt = @(t)exp(-abs(t)/10).*sin(5*abs(t));
yt = @(t)exp(-abs(t)/10).*cos(5*abs(t));
zt = @(t)t;
fp = fplot3(xt,yt,zt)

fig2plotly()
</pre>

plot_4_0_modify_3_d_parametric_line_after_creation


<pre class="codeoutput">fp = 
  ParameterizedFunctionLine with properties:

    XFunction: @(t)exp(-abs(t)/10).*sin(5*abs(t))
    YFunction: @(t)exp(-abs(t)/10).*cos(5*abs(t))
    ZFunction: @(t)t
        Color: [0 0.4470 0.7410]
    LineStyle: '-'
    LineWidth: 0.5000

  Show all properties

</pre>


Change the range of parameter values to `[-10 10]` and change the line color to red.

<pre class="mcode">
fp.TRange = [-10 10];
fp.Color = 'r';

fig2plotly()
</pre>

plot_4_1_modify_3_d_parametric_line_after_creation



<!--------------------- EXAMPLE BREAK ------------------------->

## Add Title and Axis Labels and Format Ticks

For t values in the range -2π to 2π, plot the parametric line



<pre class="mcode">
x=t	
y=t/2	
z=sin(6t).	

</pre>



Add a title, x-axis label, and y-axis label. Additionally, change the view of the axes and display the axes box outline.

<pre class="mcode">
xt = @(t)t;
yt = @(t)t/2;
zt = @(t)sin(6*t);
fplot3(xt,yt,zt,[-2*pi 2*pi],'MeshDensity',30,'LineWidth',1);

title('x=t, y=t/2, z=sin(6t) for -2\pi<t<2\pi')
xlabel('x');
ylabel('y');
view(52.5,30)
box on

fig2plotly()
</pre>

plot_5_0_add_title_and_axis_labels_and_format_ticks

Access the axes object using `gca`. Specify the x-axis tick values and associated labels using the `XTick` and `XTickLabel` properties of the axes object. Similarly, specify the y-axis tick values and associated labels.

<pre class="mcode">
ax = gca;
ax.XTick = -2*pi:pi/2:2*pi;
ax.XTickLabel = {'-2\pi','-3\pi/2','-\pi','-\pi/2','0','\pi/2','\pi','3\pi/2','2\pi'};
ax.YTick = -pi:pi/2:pi;
ax.YTickLabel = {'-\pi','-\pi/2','0','\pi/2','\pi'};

fig2plotly()
</pre>

plot_5_1_add_title_and_axis_labels_and_format_ticks



<!--------------------- EXAMPLE BREAK ------------------------->


## Plot 3-D Implicit Function

Plot the hyperboloid  x<sup>2</sup>+y<sup>2</sup>-z<sup>2</sup>=0 over the default interval of [-5,5] for  x, y, and z.

<pre class="mcode">
f = @(x,y,z) x.^2 + y.^2 - z.^2;
fimplicit3(f)

fig2plotly()
</pre>

plot_0_0_plot_3_d_implicit_function



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Plotting Interval

Plot the upper half of the hyperboloid  x<sup>2</sup>+y<sup>2</sup>-z<sup>2</sup>=0 by specifying the plotting interval as [0 5] for z. For  x and  y, use the default interval `[-5 5]`.

<pre class="mcode">
f = @(x,y,z) x.^2 + y.^2 - z.^2;
interval = [-5 5 -5 5 0 5];
fimplicit3(f,interval)

fig2plotly()
</pre>

plot_1_0_specify_plotting_interval



<!--------------------- EXAMPLE BREAK ------------------------->

## Modify Appearance of Implicit Surface

Plot the implicit surface  x<sup>2</sup>+y<sup>2</sup>-z<sup>2</sup>=0. Remove the lines by setting the `EdgeColor` property to `'none'`. Add transparency by setting the `FaceAlpha` property to a value between 0 and 1.

<pre class="mcode">
f = @(x,y,z) x.^2 + y.^2 - z.^2;
fimplicit3(f,'EdgeColor','none','FaceAlpha',.5)

fig2plotly()
</pre>

plot_2_0_modify_appearance_of_implicit_surface



<!--------------------- EXAMPLE BREAK ------------------------->

## Modify Implicit Surface After Creation

Plot an implicit surface and assign the implicit surface object to the variable `fs`. 

<pre class="mcode">
f = @(x,y,z) 1./x.^2 - 1./y.^2 + 1./z.^2;
fs = fimplicit3(f)

fig2plotly()
</pre>

plot_3_0_modify_implicit_surface_after_creation


<pre class="codeoutput">fs = 
  ImplicitFunctionSurface with properties:

     Function: @(x,y,z)1./x.^2-1./y.^2+1./z.^2
    EdgeColor: [0 0 0]
    LineStyle: '-'
    FaceColor: 'interp'

  Show all properties

</pre>


Use `fs` to access and modify properties of the implicit surface after it is created. For example, show only the positive x values by setting the `XRange` property to `[0 5]`. Remove the lines by setting the `EdgeColor` property to `'none'`. Add transparency by setting the `FaceAlpha` property to `0.8`.

<pre class="mcode">
fs.XRange = [0 5];
fs.EdgeColor = 'none';
fs.FaceAlpha = 0.8;

fig2plotly()
</pre>

plot_3_1_modify_implicit_surface_after_creation



<!--------------------- EXAMPLE BREAK ------------------------->

