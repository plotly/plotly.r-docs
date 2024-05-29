---
description: How to make Stair Plots in ggplot2 with Plotly.
name: Stair Plots
permalink: ggplot2/stair-plots/
thumnail_github: stair-plots.png
layout: base
language: ggplot2
display_as: basic 
page_type: u-guide
order: 20
output:
  html_document:
    keep_md: true
---



## Default stair plot



``` r
library(plotly)
library(ggplot2)

d=data.frame(x=c(1,2,4,5,7,8,9), y=c(1,2,3,5,6,7,9))
p <- ggplot() +
      geom_step(data=d, mapping=aes(x=x, y=y)) +
      geom_step(data=d, mapping=aes(x=x, y=y), direction="vh", linetype=3) +
      geom_point(data=d, mapping=aes(x=x, y=y), color="red") 

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-27691d111b891d62294b" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-27691d111b891d62294b">{"x":{"data":[{"x":[1,2,4,5,7,8,9],"y":[1,2,3,5,6,7,9],"text":["x: 1<br />y: 1","x: 2<br />y: 2","x: 4<br />y: 3","x: 5<br />y: 5","x: 7<br />y: 6","x: 8<br />y: 7","x: 9<br />y: 9"],"type":"scatter","mode":"lines+markers","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)","dash":"dot","shape":"vh"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","marker":{"autocolorscale":false,"color":"rgba(255,0,0,1)","opacity":1,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(255,0,0,1)"}},"frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":43.105022831050235},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.59999999999999998,9.4000000000000004],"tickmode":"array","ticktext":["2.5","5.0","7.5"],"tickvals":[2.5,5,7.5],"categoryorder":"array","categoryarray":["2.5","5.0","7.5"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"x","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.59999999999999998,9.4000000000000004],"tickmode":"array","ticktext":["2.5","5.0","7.5"],"tickvals":[2.5,5,7.5],"categoryorder":"array","categoryarray":["2.5","5.0","7.5"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"y","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"44b15be5d9d9":{"x":{},"y":{},"type":"scatter"},"44b14a5db0c1":{"x":{},"y":{}},"44b12e2b8b76":{"x":{},"y":{}}},"cur_data":"44b15be5d9d9","visdat":{"44b15be5d9d9":["function (y) ","x"],"44b14a5db0c1":["function (y) ","x"],"44b12e2b8b76":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>




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
