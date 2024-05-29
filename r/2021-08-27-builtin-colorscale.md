---
description: A reference for the built-in named continuous (sequential, diverging
  and cyclical) color scales in Plotly.
display_as: file_settings
language: r
layout: base
name: Built-in Continuous Color Scales
order: 19
output:
  html_document:
    keep_md: true
permalink: r/builtin-colorscales/
thumbnail: thumbnail/heatmap_colorscale.jpg
v4upgrade: true
---

### Using Built-In Continuous Color Scales

Plotly R supports a large number of built-in continuous color scales. These can be viewed and used with the 'RColorBrewer' package.

When using continuous color scales, you will often want to [configure various aspects of its range and colorbar](https://plotly.com/r/colorscales/).

### Discrete Color Sequences

Plotly also comes with some built-in discrete color sequences.

### Supported Built-In Continuous Color Scales

You can use any of the following names as string values to set `colorscale` arguments.
These strings are case-sensitive.


``` r
library("RColorBrewer")
brewer.pal.info
```

```
##          maxcolors category colorblind
## BrBG            11      div       TRUE
## PiYG            11      div       TRUE
## PRGn            11      div       TRUE
## PuOr            11      div       TRUE
## RdBu            11      div       TRUE
## RdGy            11      div      FALSE
## RdYlBu          11      div       TRUE
## RdYlGn          11      div      FALSE
## Spectral        11      div      FALSE
## Accent           8     qual      FALSE
## Dark2            8     qual       TRUE
## Paired          12     qual       TRUE
## Pastel1          9     qual      FALSE
## Pastel2          8     qual      FALSE
## Set1             9     qual      FALSE
## Set2             8     qual       TRUE
## Set3            12     qual      FALSE
## Blues            9      seq       TRUE
## BuGn             9      seq       TRUE
## BuPu             9      seq       TRUE
## GnBu             9      seq       TRUE
## Greens           9      seq       TRUE
## Greys            9      seq       TRUE
## Oranges          9      seq       TRUE
## OrRd             9      seq       TRUE
## PuBu             9      seq       TRUE
## PuBuGn           9      seq       TRUE
## PuRd             9      seq       TRUE
## Purples          9      seq       TRUE
## RdPu             9      seq       TRUE
## Reds             9      seq       TRUE
## YlGn             9      seq       TRUE
## YlGnBu           9      seq       TRUE
## YlOrBr           9      seq       TRUE
## YlOrRd           9      seq       TRUE
```

Built-in color scales are stored as a string of CSS colors:


``` r
library("RColorBrewer")
brewer.pal(n = 8, name = "YlGn")
```

```
## [1] "#FFFFE5" "#F7FCB9" "#D9F0A3" "#ADDD8E" "#78C679" "#41AB5D" "#238443"
## [8] "#005A32"
```



### Built-In Sequential Color scales

A collection of predefined sequential colorscales is provided in the 'RColorBrewer' package. Sequential color scales are appropriate for most continuous data, but in some cases it can be helpful to use a diverging or cyclical color scale (see below).

Here are all the built-in sequential scales in the 'RColorBrewer' package:


``` r
library("RColorBrewer")
display.brewer.all(type = 'seq')
```
![](https://i0.wp.com/datavizpyr.com/wp-content/uploads/2020/01/RColorBrewer_sequential_color_palettes-1.jpeg?w=597&ssl=1)

### Built-In Diverging Color scales

A collection of predefined diverging color scales is provided in the 'RColorBrewer' package.
Diverging color scales are appropriate for continuous data that has a natural midpoint or an  otherwise informative special value, such as 0 altitude, or the boiling point
of a liquid. These scales are intended to be used when explicitly setting the midpoint of the scale.

Here are all the built-in diverging scales in the 'RColorBrewer' package:


``` r
library("RColorBrewer")
display.brewer.all(type = 'div')
```
![](https://i1.wp.com/datavizpyr.com/wp-content/uploads/2020/01/RColorBrewer_diverging_palettes-1.jpeg?w=595&ssl=1)


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