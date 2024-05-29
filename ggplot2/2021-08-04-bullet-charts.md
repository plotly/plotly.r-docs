---
description: How to make Bullet Charts in ggplot2 with Plotly.
name: Bullet Charts
permalink: ggplot2/bullet-charts/
thumnail_github: bullet-charts.png
layout: base
language: ggplot2
display_as: financial
page_type: u-guide
order: 8
output:
  html_document:
    keep_md: true
---



## Default plot

Control colours with `fill` argument inside `fill()`.


``` r
library(plotly)
library(ggplot2)
library(tidyverse)

data <- tibble(
  name = "Example",
  quant_value = 75,
  qualitative = 100
)

p <- data %>% 
  ggplot(aes(x = quant_value, y = name)) +
  geom_col(aes(x = qualitative), fill = "grey") +
  geom_col(width = 0.5, fill = "black")

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-f75aaff13a0a203c4b11" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-f75aaff13a0a203c4b11">{"x":{"data":[{"orientation":"v","width":100,"base":0.55000000000000004,"x":[50],"y":[0.89999999999999991],"text":"qualitative: 100<br />name: Example","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(190,190,190,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":75,"base":0.75,"x":[37.5],"y":[0.5],"text":"quant_value: 75<br />name: Example","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":66.484018264840202},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-5,105],"tickmode":"array","ticktext":["0","25","50","75","100"],"tickvals":[0,24.999999999999996,50,75,100],"categoryorder":"array","categoryarray":["0","25","50","75","100"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"quant_value","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,1.6000000000000001],"tickmode":"array","ticktext":["Example"],"tickvals":[1],"categoryorder":"array","categoryarray":["Example"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"name","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"36486878706f":{"x":{},"y":{},"type":"bar"},"3648390801ff":{"x":{},"y":{}}},"cur_data":"36486878706f","visdat":{"36486878706f":["function (y) ","x"],"3648390801ff":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>




## Size of the plot

To make the plot thinner use `ylim` argument inside `coord_cartesian()`.


``` r
library(plotly)
library(ggplot2)
library(tidyverse)

data <- tibble(
  name = "Example",
  quant_value = 75,
  qualitative = 100
)

p <- data %>% 
  ggplot(aes(x = quant_value, y = name)) +
  geom_col(aes(x = qualitative), fill = "grey") +
  geom_col(width = 0.5, fill = "black") +
  coord_cartesian(ylim = c(0.3, 1.7)) +
  theme_minimal() +
  theme(panel.grid.major.y = element_blank())

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-f58e94ae238d15d3d3d7" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-f58e94ae238d15d3d3d7">{"x":{"data":[{"orientation":"v","width":100,"base":0.55000000000000004,"x":[50],"y":[0.89999999999999991],"text":"qualitative: 100<br />name: Example","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(190,190,190,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":75,"base":0.75,"x":[37.5],"y":[0.5],"text":"quant_value: 75<br />name: Example","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":66.484018264840202},"font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-5,105],"tickmode":"array","ticktext":["0","25","50","75","100"],"tickvals":[0,24.999999999999996,50,75,100],"categoryorder":"array","categoryarray":["0","25","50","75","100"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.6529680365296811,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"quant_value","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-0.29999999999999999,2.2999999999999998],"tickmode":"array","ticktext":["Example"],"tickvals":[1],"categoryorder":"array","categoryarray":["Example"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.6529680365296811,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":false,"gridcolor":null,"gridwidth":0,"zeroline":false,"anchor":"x","title":{"text":"name","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"36486ca2fe7":{"x":{},"y":{},"type":"bar"},"364874f8bdea":{"x":{},"y":{}}},"cur_data":"36486ca2fe7","visdat":{"36486ca2fe7":["function (y) ","x"],"364874f8bdea":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>



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
