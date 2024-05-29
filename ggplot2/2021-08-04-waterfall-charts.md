---
description: How to make Waterfall Charts in ggplot2 with Plotly.
name: Waterfall Charts
permalink: ggplot2/waterfall-charts/
thumnail_github: waterfall-charts.png
layout: base
language: ggplot2
display_as: financial
page_type: u-guide
order: 3
output:
  html_document:
    keep_md: true
---



## Default waterfall plot



``` r
library(plotly)
library(ggplot2)

balance <- data.frame(desc = c("Starting Cash",
     "Sales", "Refunds", "Payouts", "Court Losses",
     "Court Wins", "Contracts", "End Cash"), amount = c(2000,
     3400, -1100, -100, -6600, 3800, 1400, 2800))

# In order to preserve the order of the lines in a dataframe I convert the desc variable to a factor; id and type variable are also added:
balance$desc <- factor(balance$desc, levels = balance$desc)
balance$id <- seq_along(balance$amount)
balance$type <- ifelse(balance$amount > 0, "in","out")
balance[balance$desc %in% c("Starting Cash", "End Cash"), "type"] <- "net"

# Next the data will be slightly reworked to specify the coordinates for drawing the waterfall bars.
balance$end <- cumsum(balance$amount)
balance$end <- c(head(balance$end, -1), 0)
balance$start <- c(0, head(balance$end, -1))
balance <- balance[, c(3, 1, 4, 6, 5, 2)]

p <- ggplot(balance, aes(desc, fill = type)) + geom_rect(aes(x = desc,
     xmin = id - 0.45, xmax = id + 0.45, ymin = end,
     ymax = start))

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-a5578081691678fa3372" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-a5578081691678fa3372">{"x":{"data":[{"x":[1.55,1.55,2.4500000000000002,2.4500000000000002,1.55,null,5.5499999999999998,5.5499999999999998,6.4500000000000002,6.4500000000000002,5.5499999999999998,null,6.5499999999999998,6.5499999999999998,7.4500000000000002,7.4500000000000002,6.5499999999999998],"y":[5400,2000,2000,5400,5400,null,1400,-2400,-2400,1400,1400,null,2800,1400,1400,2800,2800],"text":"type: in","type":"scatter","mode":"lines","line":{"width":1.8897637795275593,"color":"transparent","dash":"solid"},"fill":"toself","fillcolor":"rgba(248,118,109,1)","hoveron":"fills","name":"in","legendgroup":"in","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0.55000000000000004,0.55000000000000004,1.45,1.45,0.55000000000000004,null,7.5499999999999998,7.5499999999999998,8.4499999999999993,8.4499999999999993,7.5499999999999998],"y":[2000,0,0,2000,2000,null,0,2800,2800,0,0],"text":"type: net","type":"scatter","mode":"lines","line":{"width":1.8897637795275593,"color":"transparent","dash":"solid"},"fill":"toself","fillcolor":"rgba(0,186,56,1)","hoveron":"fills","name":"net","legendgroup":"net","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[2.5499999999999998,2.5499999999999998,3.4500000000000002,3.4500000000000002,2.5499999999999998,null,3.5499999999999998,3.5499999999999998,4.4500000000000002,4.4500000000000002,3.5499999999999998,null,4.5499999999999998,4.5499999999999998,5.4500000000000002,5.4500000000000002,4.5499999999999998],"y":[4300,5400,5400,4300,4300,null,4200,4300,4300,4200,4200,null,-2400,4200,4200,-2400,-2400],"text":"type: out","type":"scatter","mode":"lines","line":{"width":1.8897637795275593,"color":"transparent","dash":"solid"},"fill":"toself","fillcolor":"rgba(97,156,255,1)","hoveron":"fills","name":"out","legendgroup":"out","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":40.182648401826491},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,8.5999999999999996],"tickmode":"array","ticktext":["Starting Cash","Sales","Refunds","Payouts","Court Losses","Court Wins","Contracts","End Cash"],"tickvals":[1,2,3,4,5,6,7,8],"categoryorder":"array","categoryarray":["Starting Cash","Sales","Refunds","Payouts","Court Losses","Court Wins","Contracts","End Cash"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"desc","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-2790,5790],"tickmode":"array","ticktext":["-2000","0","2000","4000"],"tickvals":[-2000,0,2000,4000],"categoryorder":"array","categoryarray":["-2000","0","2000","4000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498},"title":{"text":"type","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"46e4a809902":{"x":{},"fill":{},"xmin":{},"xmax":{},"ymin":{},"ymax":{},"type":"scatter"}},"cur_data":"46e4a809902","visdat":{"46e4a809902":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>




## Adjusting colours and labels

The fill mapping could use some tweaking (for example: outflows in red, inflows in green, and net position in blue), for that change the order of the underlying factor levels.

To improve readability of the legend add the following function `strwr <- function(str) gsub(" ", "\n", str)`.


``` r
library(plotly)
library(ggplot2)

balance <- data.frame(desc = c("Starting Cash",
     "Sales", "Refunds", "Payouts", "Court Losses",
     "Court Wins", "Contracts", "End Cash"), amount = c(2000,
     3400, -1100, -100, -6600, 3800, 1400, 2800))
# In order to preserve the order of the lines in a dataframe I convert the desc variable to a factor; id and type variable are also added:
balance$desc <- factor(balance$desc, levels = balance$desc)
balance$id <- seq_along(balance$amount)
balance$type <- ifelse(balance$amount > 0, "in","out")
balance$type <- factor(balance$type, levels = c("out","in", "net"))
balance[balance$desc %in% c("Starting Cash", "End Cash"), "type"] <- "net"

# Next the data will be slightly reworked to specify the coordinates for drawing the waterfall bars.
balance$end <- cumsum(balance$amount)
balance$end <- c(head(balance$end, -1), 0)
balance$start <- c(0, head(balance$end, -1))
balance <- balance[, c(3, 1, 4, 6, 5, 2)]

strwr <- function(str) gsub(" ", "\n", str)

p <- ggplot(balance, aes(fill = type)) + geom_rect(aes(x = desc,
    xmin = id - 0.45, xmax = id + 0.45, ymin = end,
    ymax = start)) + 
    scale_x_discrete("", breaks = levels(balance$desc),
        labels = strwr(levels(balance$desc)))
ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-2a9350c71a932155a82b" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-2a9350c71a932155a82b">{"x":{"data":[{"x":[2.5499999999999998,2.5499999999999998,3.4500000000000002,3.4500000000000002,2.5499999999999998,null,3.5499999999999998,3.5499999999999998,4.4500000000000002,4.4500000000000002,3.5499999999999998,null,4.5499999999999998,4.5499999999999998,5.4500000000000002,5.4500000000000002,4.5499999999999998],"y":[4300,5400,5400,4300,4300,null,4200,4300,4300,4200,4200,null,-2400,4200,4200,-2400,-2400],"text":"type: out","type":"scatter","mode":"lines","line":{"width":1.8897637795275593,"color":"transparent","dash":"solid"},"fill":"toself","fillcolor":"rgba(248,118,109,1)","hoveron":"fills","name":"out","legendgroup":"out","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.55,1.55,2.4500000000000002,2.4500000000000002,1.55,null,5.5499999999999998,5.5499999999999998,6.4500000000000002,6.4500000000000002,5.5499999999999998,null,6.5499999999999998,6.5499999999999998,7.4500000000000002,7.4500000000000002,6.5499999999999998],"y":[5400,2000,2000,5400,5400,null,1400,-2400,-2400,1400,1400,null,2800,1400,1400,2800,2800],"text":"type: in","type":"scatter","mode":"lines","line":{"width":1.8897637795275593,"color":"transparent","dash":"solid"},"fill":"toself","fillcolor":"rgba(0,186,56,1)","hoveron":"fills","name":"in","legendgroup":"in","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0.55000000000000004,0.55000000000000004,1.45,1.45,0.55000000000000004,null,7.5499999999999998,7.5499999999999998,8.4499999999999993,8.4499999999999993,7.5499999999999998],"y":[2000,0,0,2000,2000,null,0,2800,2800,0,0],"text":"type: net","type":"scatter","mode":"lines","line":{"width":1.8897637795275593,"color":"transparent","dash":"solid"},"fill":"toself","fillcolor":"rgba(97,156,255,1)","hoveron":"fills","name":"net","legendgroup":"net","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":25.570776255707766,"l":40.182648401826491},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,8.5999999999999996],"tickmode":"array","ticktext":["Starting<br />Cash","Sales","Refunds","Payouts","Court<br />Losses","Court<br />Wins","Contracts","End<br />Cash"],"tickvals":[1,2,3,4,5,6,7,8],"categoryorder":"array","categoryarray":["Starting<br />Cash","Sales","Refunds","Payouts","Court<br />Losses","Court<br />Wins","Contracts","End<br />Cash"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-2790,5790],"tickmode":"array","ticktext":["-2000","0","2000","4000"],"tickvals":[-2000,0,2000,4000],"categoryorder":"array","categoryarray":["-2000","0","2000","4000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498},"title":{"text":"type","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"46e41b48e1e1":{"fill":{},"x":{},"xmin":{},"xmax":{},"ymin":{},"ymax":{},"type":"scatter"}},"cur_data":"46e41b48e1e1","visdat":{"46e41b48e1e1":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>



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
