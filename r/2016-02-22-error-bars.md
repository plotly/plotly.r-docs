---
description: How to add error bars to plots in R.
display_as: statistical
language: r
layout: base
name: Error Bars
order: 4
output:
  html_document:
    keep_md: true
page_type: example_index
permalink: r/error-bars/
thumbnail: thumbnail/error-bar.jpg
---


### Bar Chart with Error Bars


``` r
library(plotly)
library(plyr)

data_mean <- ddply(ToothGrowth, c("supp", "dose"), summarise, length = mean(len))
data_sd <- ddply(ToothGrowth, c("supp", "dose"), summarise, length = sd(len))
data <- data.frame(data_mean, data_sd$length)
data <- rename(data, c("data_sd.length" = "sd"))
data$dose <- as.factor(data$dose)

fig <- plot_ly(data = data[which(data$supp == 'OJ'),], x = ~dose, y = ~length, type = 'bar', name = 'OJ',
        error_y = ~list(array = sd,
                        color = '#000000'))
fig <- fig %>% add_trace(data = data[which(data$supp == 'VC'),], name = 'VC')

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-bbf6d51be9947fd81c1c" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-bbf6d51be9947fd81c1c">{"x":{"visdat":{"1bf142711e02":["function () ","plotlyVisDat"],"1bf12e3c23f0":["function () ","data"]},"cur_data":"1bf12e3c23f0","attrs":{"1bf142711e02":{"x":{},"y":{},"error_y":{},"name":"OJ","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"1bf12e3c23f0":{"x":{},"y":{},"error_y":{},"name":"VC","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"dose","type":"category","categoryorder":"array","categoryarray":["0.5","1","2"]},"yaxis":{"domain":[0,1],"automargin":true,"title":"length"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["0.5","1","2"],"y":[13.23,22.699999999999999,26.059999999999999],"error_y":{"color":"#000000","array":[4.459708510654032,3.910953279643667,2.6550580659061547]},"name":"OJ","type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["0.5","1","2"],"y":[7.9799999999999995,16.77,26.140000000000001],"error_y":{"color":"#000000","array":[2.7466343040164629,2.515308684391993,4.7977309451679568]},"name":"VC","type":"bar","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Scatterplot with Error Bars


``` r
library(plotly)
library(plyr)

data_mean <- ddply(ToothGrowth, c("supp", "dose"), summarise, length = mean(len))
data_sd <- ddply(ToothGrowth, c("supp", "dose"), summarise, length = sd(len))
data <- data.frame(data_mean, data_sd$length)
data <- rename(data, c("data_sd.length" = "sd"))
data$dose <- as.factor(data$dose)

fig <- plot_ly(data = data[which(data$supp == 'OJ'),], x = ~dose, y = ~length, type = 'scatter', mode = 'markers',
        name = 'OJ',
        error_y = ~list(array = sd,
                        color = '#000000'))
fig <- fig %>% add_trace(data = data[which(data$supp == 'VC'),], name = 'VC')

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-71eb9d99974597ab6f6f" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-71eb9d99974597ab6f6f">{"x":{"visdat":{"1bf15dcff6e2":["function () ","plotlyVisDat"],"1bf13efd3a7b":["function () ","data"]},"cur_data":"1bf13efd3a7b","attrs":{"1bf15dcff6e2":{"x":{},"y":{},"mode":"markers","error_y":{},"name":"OJ","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"},"1bf13efd3a7b":{"x":{},"y":{},"mode":"markers","error_y":{},"name":"VC","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"dose","type":"category","categoryorder":"array","categoryarray":["0.5","1","2"]},"yaxis":{"domain":[0,1],"automargin":true,"title":"length"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["0.5","1","2"],"y":[13.23,22.699999999999999,26.059999999999999],"mode":"markers","error_y":{"color":"#000000","array":[4.459708510654032,3.910953279643667,2.6550580659061547]},"name":"OJ","type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["0.5","1","2"],"y":[7.9799999999999995,16.77,26.140000000000001],"mode":"markers","error_y":{"color":"#000000","array":[2.7466343040164629,2.515308684391993,4.7977309451679568]},"name":"VC","type":"scatter","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_x":{"color":"rgba(255,127,14,1)"},"line":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Line Graph with Error Bars


``` r
library(plotly)
library(plyr)

data_mean <- ddply(ToothGrowth, c("supp", "dose"), summarise, length = mean(len))
data_sd <- ddply(ToothGrowth, c("supp", "dose"), summarise, length = sd(len))
data <- data.frame(data_mean, data_sd$length)
data <- rename(data, c("data_sd.length" = "sd"))
data$dose <- as.factor(data$dose)

fig <- plot_ly(data = data[which(data$supp == 'OJ'),], x = ~dose, y = ~length, type = 'scatter', mode = 'lines+markers',
        name = 'OJ',
        error_y = ~list(array = sd,
                        color = '#000000'))
fig <- fig %>% add_trace(data = data[which(data$supp == 'VC'),], name = 'VC')

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-d9283dbf57f419f05ebd" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-d9283dbf57f419f05ebd">{"x":{"visdat":{"1bf18cd84f9":["function () ","plotlyVisDat"],"1bf14b56bb8":["function () ","data"]},"cur_data":"1bf14b56bb8","attrs":{"1bf18cd84f9":{"x":{},"y":{},"mode":"lines+markers","error_y":{},"name":"OJ","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"},"1bf14b56bb8":{"x":{},"y":{},"mode":"lines+markers","error_y":{},"name":"VC","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"dose","type":"category","categoryorder":"array","categoryarray":["0.5","1","2"]},"yaxis":{"domain":[0,1],"automargin":true,"title":"length"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["0.5","1","2"],"y":[13.23,22.699999999999999,26.059999999999999],"mode":"lines+markers","error_y":{"color":"#000000","array":[4.459708510654032,3.910953279643667,2.6550580659061547]},"name":"OJ","type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["0.5","1","2"],"y":[7.9799999999999995,16.77,26.140000000000001],"mode":"lines+markers","error_y":{"color":"#000000","array":[2.7466343040164629,2.515308684391993,4.7977309451679568]},"name":"VC","type":"scatter","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_x":{"color":"rgba(255,127,14,1)"},"line":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Reference

See [https://plotly.com/r/reference](https://plotly.com/r/reference) for more information and chart attribute options!
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
