---
description: How to make a dumbbell plot in R. Dumbbell plots show changes between
  two points in time or between two conditions.
display_as: basic
language: r
layout: base
name: Dumbbell Plots
order: 13
output:
  html_document:
    keep_md: true
permalink: r/dumbbell-plots/
thumbnail: thumbnail/dumbbell-plot.jpg
---


# Dot and Dumbbell Plots


``` r
s <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/school_earnings.csv")
# order factor levels by men's income (plot_ly() will pick up on this ordering)
s$School <- factor(s$School, levels = s$School[order(s$Men)])

library(plotly)
fig <- plot_ly(s, color = I("gray80"))
fig <- fig %>% add_segments(x = ~Women, xend = ~Men, y = ~School, yend = ~School, showlegend = FALSE)
fig <- fig %>% add_markers(x = ~Women, y = ~School, name = "Women", color = I("pink"))
fig <- fig %>% add_markers(x = ~Men, y = ~School, name = "Men", color = I("blue"))
fig <- fig %>% layout(
    title = "Gender earnings disparity",
    xaxis = list(title = "Annual Salary (in thousands)"),
    margin = list(l = 65)
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-538f54c61d4f28fa5be5" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-538f54c61d4f28fa5be5">{"x":{"visdat":{"16a8d31c4e3":["function () ","plotlyVisDat"]},"cur_data":"16a8d31c4e3","attrs":{"16a8d31c4e3":{"color":["gray80"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","showlegend":false,"inherit":true},"16a8d31c4e3.1":{"color":["pink"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"scatter","mode":"markers","name":"Women","inherit":true},"16a8d31c4e3.2":{"color":["blue"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"scatter","mode":"markers","name":"Men","inherit":true}},"layout":{"margin":{"b":40,"l":65,"t":25,"r":10},"title":"Gender earnings disparity","xaxis":{"domain":[0,1],"automargin":true,"title":"Annual Salary (in thousands)"},"yaxis":{"domain":[0,1],"automargin":true,"title":"School","type":"category","categoryorder":"array","categoryarray":["UCLA","SoCal","Emory","Michigan","Berkeley","Brown","NYU","Notre Dame","Cornell","Tufts","Yale","Dartmouth","Chicago","Columbia","Duke","Georgetown","Princeton","U.Penn","Stanford","MIT","Harvard"]},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[94,152,null,96,151,null,112,165,null,92,141,null,90,137,null,78,118,null,94,131,null,76,112,null,79,114,null,86,119,null,93,124,null,84,114,null,67,94,null,73,100,null,80,107,null,62,84,null,72,92,null,71,88,null,68,82,null,64,78,null,72,81],"y":["MIT","MIT",null,"Stanford","Stanford",null,"Harvard","Harvard",null,"U.Penn","U.Penn",null,"Princeton","Princeton",null,"Chicago","Chicago",null,"Georgetown","Georgetown",null,"Tufts","Tufts",null,"Yale","Yale",null,"Columbia","Columbia",null,"Duke","Duke",null,"Dartmouth","Dartmouth",null,"NYU","NYU",null,"Notre Dame","Notre Dame",null,"Cornell","Cornell",null,"Michigan","Michigan",null,"Brown","Brown",null,"Berkeley","Berkeley",null,"Emory","Emory",null,"UCLA","UCLA",null,"SoCal","SoCal"],"type":"scatter","mode":"lines","showlegend":false,"marker":{"color":"rgba(204,204,204,1)","line":{"color":"rgba(204,204,204,1)"}},"textfont":{"color":"rgba(204,204,204,1)"},"error_y":{"color":"rgba(204,204,204,1)"},"error_x":{"color":"rgba(204,204,204,1)"},"line":{"color":"rgba(204,204,204,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[94,96,112,92,90,78,94,76,79,86,93,84,67,73,80,62,72,71,68,64,72],"y":["MIT","Stanford","Harvard","U.Penn","Princeton","Chicago","Georgetown","Tufts","Yale","Columbia","Duke","Dartmouth","NYU","Notre Dame","Cornell","Michigan","Brown","Berkeley","Emory","UCLA","SoCal"],"type":"scatter","mode":"markers","name":"Women","marker":{"color":"rgba(255,192,203,1)","line":{"color":"rgba(255,192,203,1)"}},"textfont":{"color":"rgba(255,192,203,1)"},"error_y":{"color":"rgba(255,192,203,1)"},"error_x":{"color":"rgba(255,192,203,1)"},"line":{"color":"rgba(255,192,203,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[152,151,165,141,137,118,131,112,114,119,124,114,94,100,107,84,92,88,82,78,81],"y":["MIT","Stanford","Harvard","U.Penn","Princeton","Chicago","Georgetown","Tufts","Yale","Columbia","Duke","Dartmouth","NYU","Notre Dame","Cornell","Michigan","Brown","Berkeley","Emory","UCLA","SoCal"],"type":"scatter","mode":"markers","name":"Men","marker":{"color":"rgba(0,0,255,1)","line":{"color":"rgba(0,0,255,1)"}},"textfont":{"color":"rgba(0,0,255,1)"},"error_y":{"color":"rgba(0,0,255,1)"},"error_x":{"color":"rgba(0,0,255,1)"},"line":{"color":"rgba(0,0,255,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#Reference

See [https://plotly.com/r/reference/#scatter](https://plotly.com/r/reference/#scatter) for more information and chart attribute options!

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
