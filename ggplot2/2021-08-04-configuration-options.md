---
name: Configuration Options For Embedded Chart Studio Graphs 
permalink: ggplot2/configuration-options/
description: How to set configuration options of embedded Chart Studio graphs in ggplot2. Examples of both online and offline configurations.
layout: base
language: ggplot2
thumbnail: thumbnail/modebar-icons.png
display_as: file_settings
order: 9
output:
  html_document:
    keep_md: true
---


#### Online Configuration Options 

Configuration options for graphs created with the `plotly` ggplot2 package are overridden when those graphs are published to Chart Studio using the `api_create()` function. 

To set configutation options for charts published to Chart STudio, you can edit the plot's embed url. 

Visit our [embed tutorial](http://help.plot.ly/embed-graphs-in-websites/#step-8-customize-the-iframe) for more information on customizing the embed URL to remove the "Edit Chart" link, hide the modebar, or autosize the plot.

#### Offline Configuration Options 

Add the 'Edit Chart' link:

``` r
library(plotly)
p <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)

htmlwidgets::saveWidget(config(p, showLink = T), "graph.html")
```

Remove the 'mode bar':

``` r
htmlwidgets::saveWidget(config(p, displayModeBar = FALSE), "graph.html")
```

#### Reference
Arguments are documented [here](https://github.com/plotly/plotly.js/blob/master/src/plot_api/plot_config.js).
### What About Dash?

[Dash for R](https://dashr.plot.ly/) is an open-source framework for building analytical applications, with no Javascript required, and it is tightly integrated with the Plotly graphing library. 

Learn about how to install Dash for R at https://dashr.plot.ly/installation.

Everywhere in this page that you see `fig`, you can display the same figure in a Dash for R application by passing it to the `figure` argument of the [`Graph` component](https://dashr.plot.ly/dash-core-components/graph) from the built-in `dashCoreComponents` package like this:


``` r
library(plotly)

fig <- plot_ly() 
# fig <- fig %>% add_trace( ... )
# fig <- fig %>% layout( ... ) 

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)

app <- Dash$new()
app$layout(
    htmlDiv(
        list(
            dccGraph(figure=fig) 
        )
     )
)

app$run_server(debug=TRUE, dev_tools_hot_reload=FALSE)
```
