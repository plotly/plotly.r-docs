---
description: How to make Horizontal Bar plots ggplot2 with Plotly.
name: Horizontal Bar
display_as: basic
order: 8
permalink: ggplot2/horizontal-bar-charts/
thumnail_github: horizontal-bar-charts.png
layout: base
language: ggplot2
page_type: u-guide
output:
  html_document:
    keep_md: true
---



# Changing bar plot orientation


``` r
library(plotly)
g <- ggplot(mpg, aes(class))  
p <-  ggplot(mpg) + geom_bar(aes(y = class))

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-259ab1e25eccfbc1643f" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-259ab1e25eccfbc1643f">{"x":{"data":[{"orientation":"v","width":[5,47,41,11,33,35,62],"base":[0.55000000000000004,1.55,2.5499999999999998,3.5499999999999998,4.5499999999999998,5.5499999999999998,6.5499999999999998],"x":[2.5,23.5,20.5,5.5,16.5,17.5,31],"y":[0.89999999999999991,0.90000000000000013,0.90000000000000036,0.90000000000000036,0.90000000000000036,0.90000000000000036,0.90000000000000036],"text":["count:  5<br />class: 0.9","count: 47<br />class: 0.9","count: 41<br />class: 0.9","count: 11<br />class: 0.9","count: 33<br />class: 0.9","count: 35<br />class: 0.9","count: 62<br />class: 0.9"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(89,89,89,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":84.018264840182667},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-3.1000000000000001,65.099999999999994],"tickmode":"array","ticktext":["0","20","40","60"],"tickvals":[0,20,40,60],"categoryorder":"array","categoryarray":["0","20","40","60"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"count","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,7.5999999999999996],"tickmode":"array","ticktext":["2seater","compact","midsize","minivan","pickup","subcompact","suv"],"tickvals":[1,2,3,4.0000000000000009,5,6,7],"categoryorder":"array","categoryarray":["2seater","compact","midsize","minivan","pickup","subcompact","suv"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"class","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"3e0972ee535c":{"y":{},"type":"bar"}},"cur_data":"3e0972ee535c","visdat":{"3e0972ee535c":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

# Stacking bar plots

Bar plots are automatically stacked when multiple bars are at the same location. The order of the fill is designed to match the legend.

To flip the order (because you've flipped the orientation) call `position_stack()` explicitly.


``` r
library(plotly)
g <- ggplot(mpg, aes(class))  
p <-    
 ggplot(mpg, aes(y = class)) +
 geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
 theme(legend.position = "top")
 
ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-be9d8c2dbb7690fe4cd8" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-be9d8c2dbb7690fe4cd8">{"x":{"data":[{"orientation":"v","width":[12,3,33,4,51],"base":[1.55,2.5499999999999998,4.5499999999999998,5.5499999999999998,6.5499999999999998],"x":[6,1.5,16.5,2,25.5],"y":[0.90000000000000013,0.90000000000000036,0.90000000000000036,0.90000000000000036,0.90000000000000036],"text":["count: 12<br />class: 0.9<br />drv: 4","count:  3<br />class: 0.9<br />drv: 4","count: 33<br />class: 0.9<br />drv: 4","count:  4<br />class: 0.9<br />drv: 4","count: 51<br />class: 0.9<br />drv: 4"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(248,118,109,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"name":"4","legendgroup":"4","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[35,38,11,22],"base":[1.55,2.5499999999999998,3.5499999999999998,5.5499999999999998],"x":[29.5,22,5.5,15],"y":[0.90000000000000013,0.90000000000000036,0.90000000000000036,0.90000000000000036],"text":["count: 47<br />class: 0.9<br />drv: f","count: 41<br />class: 0.9<br />drv: f","count: 11<br />class: 0.9<br />drv: f","count: 26<br />class: 0.9<br />drv: f"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(0,186,56,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"name":"f","legendgroup":"f","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[5,9,11],"base":[0.55000000000000004,5.5499999999999998,6.5499999999999998],"x":[2.5,30.5,56.5],"y":[0.89999999999999991,0.90000000000000036,0.90000000000000036],"text":["count:  5<br />class: 0.9<br />drv: r","count: 35<br />class: 0.9<br />drv: r","count: 62<br />class: 0.9<br />drv: r"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(97,156,255,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"name":"r","legendgroup":"r","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":84.018264840182667},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-3.1000000000000001,65.099999999999994],"tickmode":"array","ticktext":["0","20","40","60"],"tickvals":[0,20,40,60],"categoryorder":"array","categoryarray":["0","20","40","60"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"count","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,7.5999999999999996],"tickmode":"array","ticktext":["2seater","compact","midsize","minivan","pickup","subcompact","suv"],"tickvals":[1,2,3,4.0000000000000009,5,6,7],"categoryorder":"array","categoryarray":["2seater","compact","midsize","minivan","pickup","subcompact","suv"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"class","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498},"title":{"text":"drv","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"3e091b074f54":{"y":{},"fill":{},"type":"bar"}},"cur_data":"3e091b074f54","visdat":{"3e091b074f54":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
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
