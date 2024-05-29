---
description: How to draw a line on Map in R with plotly.
display_as: maps
language: r
layout: base
name: Lines on Mapbox
order: 9
output:
  html_document:
    keep_md: true
page_type: u-guide
permalink: r/lines-on-mapbox/
thumbnail: thumbnail/line_mapbox.jpg
---


### Mapbox Access Token

To plot on Mapbox maps with Plotly you *may* need a Mapbox account and a public [Mapbox Access Token](https://www.mapbox.com/studio). See our [Mapbox Map Layers](/r/mapbox-layers/) documentation for more information. If you're using a Chart Studio Enterprise server, please see additional instructions [here](https://help.plot.ly/mapbox-atlas).

### Lines on Mapbox maps using "Scattermapbox" traces

To draw a line on your map, you either can use [Scattermapbox](https://plotly.com/r/reference/#scattermapbox) or [scattergeo](https://plotly.com/r/reference/#scattergeo) trace type in plotly. This example uses scattermapbox and defines the drawing [mode](https://plotly.com/python/reference/#scattermapbox-mode) to the combination of markers and line.


``` r
library(plotly)

fig <- plot_ly(
  type = 'scattermapbox',
  mode = "markers+lines",
  lon = c(10, 20, 30),
  lat = c(10, 20,30),
  marker = list(size = 10)) 
fig <- fig %>%
  add_trace(
    type = 'scattermapbox',
    mode = "markers+lines",
    lon = c(-50, -60,40),
    lat = c(30, 10, -20),
    marker = list(size = 10)) 
fig <- fig %>%
  layout(
    mapbox = list(
      style = "stamen-terrain",
      center = list(lon = 10, lat= 10),
      zoom = 1),
    margin =list(l=0,t=0,b=0,r=0))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-484d2471ec2d403ca729" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-484d2471ec2d403ca729">{"x":{"visdat":{"2c4022410d67":["function () ","plotlyVisDat"]},"cur_data":"2c4022410d67","attrs":{"2c4022410d67":{"mode":"markers+lines","lon":[10,20,30],"lat":[10,20,30],"marker":{"size":10},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scattermapbox"},"2c4022410d67.1":{"mode":"markers+lines","lon":[-50,-60,40],"lat":[30,10,-20],"marker":{"size":10},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scattermapbox","inherit":true}},"layout":{"margin":{"b":0,"l":0,"t":0,"r":0},"mapbox":{"style":"stamen-terrain","center":{"lon":10,"lat":10},"zoom":1},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"mode":"markers+lines","lon":[10,20,30],"lat":[10,20,30],"marker":{"color":"rgba(31,119,180,1)","size":10,"line":{"color":"rgba(31,119,180,1)"}},"type":"scattermapbox","line":{"color":"rgba(31,119,180,1)"},"frame":null},{"mode":"markers+lines","lon":[-50,-60,40],"lat":[30,10,-20],"marker":{"color":"rgba(255,127,14,1)","size":10,"line":{"color":"rgba(255,127,14,1)"}},"type":"scattermapbox","line":{"color":"rgba(255,127,14,1)"},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
#Reference

See [https://plotly.com/r/reference/#scattermapbox](https://plotly.com/r/reference/#scattermapbox) for more information and options!
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
