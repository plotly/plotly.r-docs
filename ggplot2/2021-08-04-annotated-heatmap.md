---
description: How to make Annotated Heatmap plots in MATLAB<sup>&reg;</sup> with Plotly.
name: Annotated Heatmaps
display_as: scientific
order: 7
permalink: matlab/annotated-heatmap/
thumbnail: thumbnail/ann_heat.jpg
layout: base
language: matlab
page_type: u-guide
---

## Create Heatmap from Tabular Data

Create a heatmap from a table of data for medical patients.

Load the `patients` data set and create a table from a subset of the variables loaded into the workspace. Then create a heatmap that counts the total number of patients with the same set of `Smoker` and `SelfAssessedHealthStatus` values.

<pre class="mcode">
load patients
tbl = table(LastName,Age,Gender,SelfAssessedHealthStatus,...
    Smoker,Weight,Location);
h = heatmap(tbl,'Smoker','SelfAssessedHealthStatus');

fig2plotly()
</pre>

plot_0_0_create_heatmap_from_tabular_data



<!--------------------- EXAMPLE BREAK ------------------------->

## Reorder Heatmap Labels

Create a heatmap and reorder the labels along the y-axis. 

Load the `patients` data set and create a heatmap from the data. Assign the `HeatmapChart` object to the variable `h`.

<pre class="mcode">
load patients
tbl = table(LastName,Age,Gender,SelfAssessedHealthStatus,...
    Smoker,Weight,Location);
h = heatmap(tbl,'Smoker','SelfAssessedHealthStatus');

fig2plotly()
</pre>

plot_1_0_reorder_heatmap_labels

Reorder the labels along the y-axis. 

<pre class="mcode">
h.YDisplayData = {'Excellent','Good','Fair','Poor'};

fig2plotly()
</pre>

plot_1_1_reorder_heatmap_labels

Alternatively, you can reorder the labels by changing the data to categorical data and then reordering the categories using the `reordercats` function. Similarly, you can add, remove, or rename the heatmap labels using the `addcats`, `removecats`, or `renamecats` functions, respectively.



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Table Variable for Heatmap Colors

Create a heatmap and specify the table variable to use when determining the heatmap cell colors.

Load the `patients` data set and create a heatmap from the data. Color each cell using the average age of patients with a particular pair of `Smoker` and `SelfAssessedHealthStatus` values by setting the `ColorVariable` option to `'Age'`.

<pre class="mcode">
load patients
tbl = table(LastName,Age,Gender,SelfAssessedHealthStatus,...
    Smoker,Weight,Location);
h = heatmap(tbl,'Smoker','SelfAssessedHealthStatus','ColorVariable','Age');

fig2plotly()
</pre>

plot_2_0_specify_table_variable_for_heatmap_colors



<!--------------------- EXAMPLE BREAK ------------------------->

## Specify Calculation Method for Color Data

Create a heatmap and specify the table variable and calculation method to use when determining the heatmap cell colors.

Load the patients data set and create a heatmap from the data. Color each cell using the median age of patients with a particular pair of `Smoker` and `SelfAssessedHealthStatus` values. Specify the `ColorVariable` option as `'Age'` and the `ColorMethod` option as `'median'`.

<pre class="mcode">
load patients
tbl = table(LastName,Age,Gender,SelfAssessedHealthStatus,...
    Smoker,Weight,Location);
h = heatmap(tbl,'Smoker','SelfAssessedHealthStatus','ColorVariable','Age','ColorMethod','median');

fig2plotly()
</pre>

plot_3_0_specify_calculation_method_for_color_data



<!--------------------- EXAMPLE BREAK ------------------------->

## Create Heatmap from Matrix Data

Create a matrix of data. Then create a heatmap of the matrix values. The default labels along the x-axis and y-axis appear as 1, 2, 3, and so on. 

<pre class="mcode">
cdata = [45 60 32; 43 54 76; 32 94 68; 23 95 58];
h = heatmap(cdata);

fig2plotly()
</pre>

plot_4_0_create_heatmap_from_matrix_data



<!--------------------- EXAMPLE BREAK ------------------------->

## Create Heatmap from Matrix Data Using Custom Axis Labels

Create a matrix of data. Then create a heatmap of the matrix values. Use custom labels along the x-axis and y-axis by specifying the first two input arguments as the labels you want. Specify the title and axis labels by setting properties of the `HeatmapChart` object.

<pre class="mcode">
cdata = [45 60 32; 43 54 76; 32 94 68; 23 95 58];
xvalues = {'Small','Medium','Large'};
yvalues = {'Green','Red','Blue','Gray'};
h = heatmap(xvalues,yvalues,cdata);

h.Title = 'T-Shirt Orders';
h.XLabel = 'Sizes';
h.YLabel = 'Colors';

fig2plotly()
</pre>

plot_5_0_create_heatmap_from_matrix_data_using_custom_axis_l



<!--------------------- EXAMPLE BREAK ------------------------->

## Normalize Colors Along Each Row or Column

Create a heatmap and normalize the colors along each column or row by setting the `ColorScaling` property. 

Read the sample file `outages.csv` into a table. The sample file contains data representing electric utility outages in the Unites States. The table contains six columns: `Region`, `OutageTime`, `Loss`, `Customers`, `RestorationTime`, and `Cause`. Display the first five rows of each column.

<pre class="mcode">
T = readtable('outages.csv');
T(1:5,:)
</pre>


<pre class="codeoutput">ans=<span class="emphasis"><em>5×6 table</em></span>
       Region           OutageTime        Loss     Customers     RestorationTime            Cause       
    _____________    ________________    ______    __________    ________________    ___________________

    {'SouthWest'}    2002-02-01 12:18    458.98    1.8202e+06    2002-02-07 16:50    {'winter storm'   }
    {'SouthEast'}    2003-01-23 00:49    530.14    2.1204e+05                 NaT    {'winter storm'   }
    {'SouthEast'}    2003-02-07 21:15     289.4    1.4294e+05    2003-02-17 08:14    {'winter storm'   }
    {'West'     }    2004-04-06 05:44    434.81    3.4037e+05    2004-04-06 06:10    {'equipment fault'}
    {'MidWest'  }    2002-03-16 06:18    186.44    2.1275e+05    2002-03-18 23:23    {'severe storm'   }

</pre>


Create a heatmap that shows the different regions along the x-axis and the different outage causes along the y-axis. In each cell, show how many times each region experienced a power outage due to a particular cause.

<pre class="mcode">
h = heatmap(T,'Region','Cause');

fig2plotly()
</pre>

plot_6_0_normalize_colors_along_each_row_or_column

Normalize the colors along each column. The smallest value in each column maps to the first color in the colormap and the largest value maps to the last color. The last color indicates the cause that caused the most power outages for each region.

<pre class="mcode">
h.ColorScaling = 'scaledcolumns';

fig2plotly()
</pre>

plot_6_1_normalize_colors_along_each_row_or_column

Normalize the colors along each row instead. The smallest value in each row maps to the first color in the colormap and the largest value maps to the last color. The last color indicates the region that experienced the most power outages due to each cause.

<pre class="mcode">
h.ColorScaling = 'scaledrows';

fig2plotly()
</pre>

plot_6_2_normalize_colors_along_each_row_or_column



<!--------------------- EXAMPLE BREAK ------------------------->

## Compute Color Data Using Custom Aggregation Method

Create a heatmap and color the cells using data computed with a custom aggregation method. Use the `accumarray` function to compute the color data.

Read the sample file `Temperature.csv` into a table. The file contains three columns: `Month`, `Year`, and `TemperatureF`. 

<pre class="mcode">
tbl = readtable('TemperatureData.csv');
</pre>

Create categorical arrays from the `Month` and `Year` columns of the table. Then determine the unique months and years to use as labels along the x-axis and y-axis.

<pre class="mcode">
months = categorical(tbl.Month);
years = categorical(tbl.Year);
xlabels = categories(months);
ylabels = categories(years);

fig2plotly()
</pre>

Determine the final size of the resulting color data based on the number of unique months and years. 

<pre class="mcode">
nummonths = numel(xlabels);
numyears = numel(ylabels);

fig2plotly()
</pre>

Convert the categorical `months` and `years` arrays into numeric indices to use with the `accumarray` function. Compute the color data as the maximum temperature for each month and year combination using the `accumarray` function. Use `NaN` for missing month and year combinations.

<pre class="mcode">
x = double(months);
y = double(years);
temps = tbl.TemperatureF;
cdata = accumarray([y,x],temps,[numyears,nummonths],@max,NaN);
</pre>

Create the heatmap. Label the x-axis and y-axis with the months and years, respectively. Color the heatmap cells using the computed matrix data.

<pre class="mcode">
h = heatmap(xlabels,ylabels,cdata);

fig2plotly()
</pre>

plot_7_2_compute_color_data_using_custom_aggregation_method

Note: You can use the `reordercats` function for categorical arrays to reorder the axis labels.



<!--------------------- EXAMPLE BREAK ------------------------->

