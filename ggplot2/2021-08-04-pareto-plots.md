---
description: How to make Pareto Plots in ggplot2 with Plotly.
name: Pareto Plots
permalink: ggplot2/pareto-plots/
thumnail_github: pareto-plots.png
layout: base
language: ggplot2
display_as: financial
page_type: u-guide
order: 9
output:
  html_document:
    keep_md: true
---



## Default pareto plot



``` r
library(plotly)
require(ggQC)
require(ggplot2)

df <- data.frame(
                  x = letters[1:10],
                  y = as.integer(runif(n = 10, min = 0, max=100))
                 )

p <- ggplot(df, aes(x=x, y=y)) +
 stat_pareto(point.color = "red",
             point.size = 3,
             line.color = "black",
             #size.line = 1,
             bars.fill = c("blue", "orange"),
 )

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-b51d710bcb4e1f7d8331" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-b51d710bcb4e1f7d8331">{"x":{"data":[{"orientation":"v","width":0.89999999999999991,"base":0,"x":[1],"y":[72],"text":"x: a<br />y: 72","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(0,0,255,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"orientation":"v","width":0.90000000000000013,"base":0,"x":[2],"y":[72],"text":"x: b<br />y: 72","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(28,18,226,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"orientation":"v","width":0.90000000000000036,"base":0,"x":[3],"y":[64],"text":"x: f<br />y: 64","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(56,36,198,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"orientation":"v","width":0.90000000000000036,"base":0,"x":[4],"y":[54],"text":"x: d<br />y: 54","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(85,55,170,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"orientation":"v","width":0.90000000000000036,"base":0,"x":[5],"y":[28],"text":"x: i<br />y: 28","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(113,73,141,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"orientation":"v","width":0.90000000000000036,"base":0,"x":[6],"y":[27],"text":"x: g<br />y: 27","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(141,91,113,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"orientation":"v","width":0.90000000000000036,"base":0,"x":[7],"y":[24],"text":"x: e<br />y: 24","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(170,110,85,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"orientation":"v","width":0.89999999999999947,"base":0,"x":[8],"y":[16],"text":"x: h<br />y: 16","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(198,128,56,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"orientation":"v","width":0.89999999999999858,"base":0,"x":[9],"y":[13],"text":"x: c<br />y: 13","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(226,146,28,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"orientation":"v","width":0.89999999999999858,"base":0,"x":[10],"y":[7],"text":"x: j<br />y:  7","type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(255,165,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[72,144,208,262,290,317,341,357,370,377],"text":["x: a<br />y: 72","x: b<br />y: 72","x: f<br />y: 64","x: d<br />y: 54","x: i<br />y: 28","x: g<br />y: 27","x: e<br />y: 24","x: h<br />y: 16","x: c<br />y: 13","x: j<br />y:  7"],"type":"scatter","mode":"lines+markers","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)","dash":"solid"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","marker":{"autocolorscale":false,"color":"rgba(255,0,0,1)","opacity":1,"size":11.338582677165356,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(255,0,0,1)"}},"frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":43.105022831050235},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,10.6],"tickmode":"array","ticktext":["a","b","f","d","i","g","e","h","c","j"],"tickvals":[1,2,3,4,5,6.0000000000000009,7,8,9,10],"categoryorder":"array","categoryarray":["a","b","f","d","i","g","e","h","c","j"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"x","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-18.850000000000001,395.85000000000002],"tickmode":"array","ticktext":["0","100","200","300"],"tickvals":[0,100,200,300],"categoryorder":"array","categoryarray":["0","100","200","300"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"y","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"417c5a6d8c0c":{"x":{},"y":{},"type":"bar"},"417c41829d94":{"x":{},"y":{}},"417c739db6d7":{"x":{},"y":{}}},"cur_data":"417c5a6d8c0c","visdat":{"417c5a6d8c0c":["function (y) ","x"],"417c41829d94":["function (y) ","x"],"417c739db6d7":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>



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
