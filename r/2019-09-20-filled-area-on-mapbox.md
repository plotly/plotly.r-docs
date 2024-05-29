---
description: How to make an area on Map in R with plotly.
display_as: maps
language: r
layout: base
name: Filled Area in Mapbox
order: 8
output:
  html_document:
    keep_md: true
page_type: u-guide
permalink: r/filled-area-on-mapbox/
thumbnail: thumbnail/area.jpg
---


### Mapbox Access Token

To plot on Mapbox maps with Plotly you *may* need a Mapbox account and a public [Mapbox Access Token](https://www.mapbox.com/studio). See our [Mapbox Map Layers](/r/mapbox-layers/) documentation for more information. If you're using a Chart Studio Enterprise server, please see additional instructions [here](https://help.plot.ly/mapbox-atlas).

### How to Show an Area on a Map

There are three different ways to show an area in a mapbox:
<ol>
    <li> Use [Scattermapbox](https://plotly.com/r/reference/#scattermapbox) trace and set [fill](https://plotly.com/r/reference/#scattermapbox-fill) attribute to 'toself'</li>
    <li> Use [Scattermapbox](https://plotly.com/r/reference/#scattermapbox) trace and define the corresponding geojson</li>
    <li> Use the new trace type: [Choroplethmapbox](https://plotly.com/r/mapbox-county-choropleth/) for mapbox cases, or [Choropleth](https://plotly.com/r/choropleth-maps/) trace for non-mapbox ones.</li>
</ol>

The following example uses the `Scattermapbox` trace and sets `fill = 'toself'`


``` r
library(plotly)

fig <- plot_ly(
  fill = "toself",
  lon = c(-74, -70, -70, -74),
  lat = c(47, 47, 45, 45),
  type = 'scattermapbox',
  marker = list(size = 10, color = 'orange'),
  fillcolor = 'color') 
fig <- fig %>%
  layout(
    mapbox = list(
      style = "stamen-terrain",
      center = list(lon = -73, lat = 46),
      zoom = 5),
    showlegend = FALSE)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-7bc23e88dbf8b7b4cbc8" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-7bc23e88dbf8b7b4cbc8">{"x":{"visdat":{"2aed5e59560b":["function () ","plotlyVisDat"]},"cur_data":"2aed5e59560b","attrs":{"2aed5e59560b":{"fill":"toself","lon":[-74,-70,-70,-74],"lat":[47,47,45,45],"marker":{"size":10,"color":"orange"},"fillcolor":"color","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scattermapbox"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"mapbox":{"style":"stamen-terrain","center":{"lon":-73,"lat":46},"zoom":5},"showlegend":false,"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"fillcolor":"color","fill":"toself","lon":[-74,-70,-70,-74],"lat":[47,47,45,45],"marker":{"color":"orange","size":10,"line":{"color":"rgba(31,119,180,1)"}},"type":"scattermapbox","mode":"markers","name":"color","line":{"color":"rgba(31,119,180,1)"},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Provide Gaps on Map

The following example shows how to use missing values in your data to provide gap in your graph. To ignore the gap on your plot, take benefit of [connectorgaps](https://plotly.com/r/reference/#scattermapbox-connectgaps) attribute.


``` r
library(plotly)

fig <- plot_ly(
  mode = "lines",
  fill = "toself",
  type = 'scattermapbox',
  lon = c(-10, -10, 8, 8, NaN, 30, 30, 50, 50, NaN, 100, 100, 80, 80),
  lat = c(30, 6, 6, 30, NaN, 20, 30, 30, 20, NaN, 40, 50, 50, 40)) 
fig <- fig %>%
layout(
  mapbox = list(
    style = "stamen-terrain",
    center = list(lon = 30, lat = 30),
    zoom = 2),
  showlegend = FALSE)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-1a38d627d319a02c376d" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-1a38d627d319a02c376d">{"x":{"visdat":{"2aed9de71be":["function () ","plotlyVisDat"]},"cur_data":"2aed9de71be","attrs":{"2aed9de71be":{"mode":"lines","fill":"toself","lon":[-10,-10,8,8,null,30,30,50,50,null,100,100,80,80],"lat":[30,6,6,30,null,20,30,30,20,null,40,50,50,40],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scattermapbox"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"mapbox":{"style":"stamen-terrain","center":{"lon":30,"lat":30},"zoom":2},"showlegend":false,"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"fillcolor":"rgba(31,119,180,0.5)","mode":"lines","fill":"toself","lon":[-10,-10,8,8,null,30,30,50,50,null,100,100,80,80],"lat":[30,6,6,30,null,20,30,30,20,null,40,50,50,40],"type":"scattermapbox","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>


### Use the Corresponding Geojson

The second way is using the `scattermapbox` trace with the corresponding geojson.


``` r
library(plotly)

fig <- plot_ly(
  type = 'scattermapbox',
  mode = "markers",
  lon = c(-73.605), lat = c(45.51),
  marker = list(size = 20, color = c("cyan"))) 
fig <- fig %>%
  layout(
    mapbox = list(
    style = "stamen-terrain",
    center = list(lon = -73.6, lat = 45.5),
    zoom = 12,
    layers = list(list(
    source = list(
      type = "FeatureCollection",
      features = list(list(
        type = "Feature",
        geometry = list(
          type = "MultiPolygon",
          coordinates = list(list(list(
            c(-73.606352888, 45.507489991), c(-73.606133883, 45.50687600),
            c(-73.605905904, 45.506773980), c(-73.603533905, 45.505698946),
            c(-73.602475870, 45.506856969), c(-73.600031904, 45.505696003),
            c(-73.599379992, 45.505389066), c(-73.599119902, 45.505632008),
            c(-73.598896977, 45.505514039), c(-73.598783894, 45.505617001),
            c(-73.591308727, 45.516246185), c(-73.591380782, 45.516280145),
            c(-73.596778656, 45.518690062), c(-73.602796770, 45.521348046),
            c(-73.612239983, 45.525564037), c(-73.612422919, 45.525642061),
            c(-73.617229085, 45.527751983), c(-73.617279234, 45.527774160),
            c(-73.617304713, 45.527741334), c(-73.617492052, 45.527498362),
            c(-73.617533258, 45.527512253), c(-73.618074188, 45.526759105),
            c(-73.618271651, 45.526500673), c(-73.618446320, 45.526287943),
            c(-73.618968507, 45.525698560), c(-73.619388002, 45.525216750),
            c(-73.619532966, 45.525064183), c(-73.619686662, 45.524889290),
            c(-73.619787038, 45.524770086), c(-73.619925742, 45.524584939),
            c(-73.619954486, 45.524557690), c(-73.620122362, 45.524377961),
            c(-73.620201713, 45.524298907), c(-73.620775593, 45.523650879)
            )))
            )
          ))
        ),
      type = "fill", below = "traces", color = "royalblue"))))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-409cffccebe0abfab959" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-409cffccebe0abfab959">{"x":{"visdat":{"2aed34fb2d7a":["function () ","plotlyVisDat"]},"cur_data":"2aed34fb2d7a","attrs":{"2aed34fb2d7a":{"mode":"markers","lon":-73.605000000000004,"lat":45.509999999999998,"marker":{"size":20,"color":"cyan"},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scattermapbox"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"mapbox":{"style":"stamen-terrain","center":{"lon":-73.599999999999994,"lat":45.5},"zoom":12,"layers":[{"source":{"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"MultiPolygon","coordinates":[[[[-73.606352888000004,45.507489991],[-73.606133882999998,45.506875999999998],[-73.605905903999997,45.506773979999998],[-73.603533905000006,45.505698946000003],[-73.602475870000006,45.506856968999998],[-73.600031904000005,45.505696002999997],[-73.599379991999996,45.505389065999999],[-73.599119901999998,45.505632007999999],[-73.598896976999995,45.505514038999998],[-73.598783893999993,45.505617000999997],[-73.591308726999998,45.516246185],[-73.591380782000002,45.516280145000003],[-73.596778655999998,45.518690061999997],[-73.602796769999998,45.521348046],[-73.612239982999995,45.525564037000002],[-73.612422918999997,45.525642060999999],[-73.617229085000005,45.527751983000002],[-73.617279233999994,45.52777416],[-73.617304712999996,45.527741333999998],[-73.617492052000003,45.527498362000003],[-73.617533257999995,45.527512252999998],[-73.618074187999994,45.526759104999996],[-73.618271651000001,45.526500673000001],[-73.618446320000004,45.526287943],[-73.618968507000005,45.525698560000002],[-73.619388001999994,45.525216749999998],[-73.619532965999994,45.525064182999998],[-73.619686662000007,45.524889289999997],[-73.619787037999998,45.524770085999997],[-73.619925742000007,45.524584939],[-73.619954485999997,45.524557690000002],[-73.620122362000004,45.524377960999999],[-73.620201713,45.524298907000002],[-73.620775593000005,45.523650879000002]]]]}}]},"type":"fill","below":"traces","color":"royalblue"}]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"mode":"markers","lon":[-73.605000000000004],"lat":[45.509999999999998],"marker":{"color":"cyan","size":20,"line":{"color":"rgba(31,119,180,1)"}},"type":"scattermapbox","line":{"color":"rgba(31,119,180,1)"},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

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
