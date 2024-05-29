---
description: How to create carpet plots in R with Plotly.
display_as: scientific
language: r
layout: base
name: Carpet Plot
order: 7
output:
  html_document:
    keep_md: true
permalink: r/carpet-plot/
thumbnail: thumbnail/carpet.jpg
---


### Set the Coordinates 

To set the `x` and `y` coordinates use `x` and `y` attributes. If `x` coorindate values are ommitted a cheater plot will be created.


``` r
library(plotly)

fig <- plot_ly(
    type = 'carpet',
    y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10))
```

### Add Parameter Values

To save parameter values use `a` and `b` attributes.


``` r
library(plotly)

fig <- plot_ly(
    type = 'carpet',
    a = c(4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6, 6, 6),
    b = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3),
    y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-6dea6040cccab344adfe" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-6dea6040cccab344adfe">{"x":{"visdat":{"22267483a47b":["function () ","plotlyVisDat"]},"cur_data":"22267483a47b","attrs":{"22267483a47b":{"a":[4,4,4,4.5,4.5,4.5,5,5,5,6,6,6],"b":[1,2,3,1,2,3,1,2,3,1,2,3],"y":[2,3.5,4,3,4.5,5,5.5,6.5,7.5,8,8.5,10],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"carpet"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"yaxis":{"domain":[0,1],"automargin":true,"title":[]},"aaxis":{"domain":[0,1],"automargin":true},"baxis":{"domain":[0,1],"automargin":true},"xaxis":{"domain":[0,1],"automargin":true},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"a":[4,4,4,4.5,4.5,4.5,5,5,5,6,6,6],"b":[1,2,3,1,2,3,1,2,3,1,2,3],"y":[2,3.5,4,3,4.5,5,5.5,6.5,7.5,8,8.5,10],"type":"carpet","xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Add Carpet Axes

Use `aaxis` or `baxis` lists to make changes to the axes. For a more detailed list of attributes refer to [R reference](https://plotly.com/r/reference/#carpet-aaxis).


``` r
library(plotly)

fig <- plot_ly(
    type = 'carpet',
    a = c(4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6, 6, 6),
    b = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3),
    y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10),
    aaxis = list(
      tickprefix = 'a = ',
      ticksuffix = 'm',
      smoothing = 1,
      minorgridcount = 9
      ),
    baxis = list(
      tickprefix = 'b = ',
      ticksuffix = 'Pa',
      smoothing = 1,
      minorgridcount = 9
      )
    )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-99c32f64f3078d9415f5" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-99c32f64f3078d9415f5">{"x":{"visdat":{"222635c3550c":["function () ","plotlyVisDat"]},"cur_data":"222635c3550c","attrs":{"222635c3550c":{"a":[4,4,4,4.5,4.5,4.5,5,5,5,6,6,6],"b":[1,2,3,1,2,3,1,2,3,1,2,3],"y":[2,3.5,4,3,4.5,5,5.5,6.5,7.5,8,8.5,10],"aaxis":{"tickprefix":"a = ","ticksuffix":"m","smoothing":1,"minorgridcount":9},"baxis":{"tickprefix":"b = ","ticksuffix":"Pa","smoothing":1,"minorgridcount":9},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"carpet"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"yaxis":{"domain":[0,1],"automargin":true,"title":[]},"aaxis":{"domain":[0,1],"automargin":true},"baxis":{"domain":[0,1],"automargin":true},"xaxis":{"domain":[0,1],"automargin":true},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"a":[4,4,4,4.5,4.5,4.5,5,5,5,6,6,6],"b":[1,2,3,1,2,3,1,2,3,1,2,3],"y":[2,3.5,4,3,4.5,5,5.5,6.5,7.5,8,8.5,10],"aaxis":{"tickprefix":"a = ","ticksuffix":"m","smoothing":1,"minorgridcount":9},"baxis":{"tickprefix":"b = ","ticksuffix":"Pa","smoothing":1,"minorgridcount":9},"type":"carpet","xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Style Carpet Axes


``` r
library(plotly)

fig <- plot_ly(
  type = 'carpet',
  a = c(4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6, 6, 6),
  b = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3),
  y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10),
  aaxis = list(
    tickprefix = 'a = ',
    ticksuffix = 'm',
    smoothing = 1,
    minorgridcount = 9,
    minorgridwidth = 0.6,
    minorgridcolor = 'white',
    gridcolor = 'white',
    color = 'white'
  ),
  baxis = list(
    tickprefix = 'b = ',
    ticksuffix = 'Pa',
    smoothing = 1,
    minorgridcount = 9,
    minorgridwidth = 0.6,
    gridcolor = 'white',
    minorgridcolor = 'white',
    color = 'white'
  )
) 
fig <- fig %>% layout(
    plot_bgcolor = 'black', paper_bgcolor = 'black',
    xaxis = list(showgrid = F, showticklabels = F),
    yaxis = list(showgrid = F, showticklabels = F)
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-c16c0cbae0c367acf505" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-c16c0cbae0c367acf505">{"x":{"visdat":{"222621d3875d":["function () ","plotlyVisDat"]},"cur_data":"222621d3875d","attrs":{"222621d3875d":{"a":[4,4,4,4.5,4.5,4.5,5,5,5,6,6,6],"b":[1,2,3,1,2,3,1,2,3,1,2,3],"y":[2,3.5,4,3,4.5,5,5.5,6.5,7.5,8,8.5,10],"aaxis":{"tickprefix":"a = ","ticksuffix":"m","smoothing":1,"minorgridcount":9,"minorgridwidth":0.59999999999999998,"minorgridcolor":"white","gridcolor":"white","color":"white"},"baxis":{"tickprefix":"b = ","ticksuffix":"Pa","smoothing":1,"minorgridcount":9,"minorgridwidth":0.59999999999999998,"gridcolor":"white","minorgridcolor":"white","color":"white"},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"carpet"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"black","paper_bgcolor":"black","xaxis":{"domain":[0,1],"automargin":true,"showgrid":false,"showticklabels":false},"yaxis":{"domain":[0,1],"automargin":true,"showgrid":false,"showticklabels":false,"title":[]},"aaxis":{"domain":[0,1],"automargin":true},"baxis":{"domain":[0,1],"automargin":true},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"a":[4,4,4,4.5,4.5,4.5,5,5,5,6,6,6],"b":[1,2,3,1,2,3,1,2,3,1,2,3],"y":[2,3.5,4,3,4.5,5,5.5,6.5,7.5,8,8.5,10],"aaxis":{"tickprefix":"a = ","ticksuffix":"m","smoothing":1,"minorgridcount":9,"minorgridwidth":0.59999999999999998,"minorgridcolor":"white","gridcolor":"white","color":"white"},"baxis":{"tickprefix":"b = ","ticksuffix":"Pa","smoothing":1,"minorgridcount":9,"minorgridwidth":0.59999999999999998,"gridcolor":"white","minorgridcolor":"white","color":"white"},"type":"carpet","xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Add Points and Contours

To add points and lines to see [Carpet Scatter Plots](https://plotly.com/r/carpet-scatter) or to add contours see [Carpet Contour Plots](https://plotly.com/r/carpet-contour)

### Reference

See [https://plotly.com/r/reference/#carpet](https://plotly.com/r/reference/#carpet) for more information and options!
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
