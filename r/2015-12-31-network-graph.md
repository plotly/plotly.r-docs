---
description: How to make network graphs in R with Plotly.
display_as: scientific
language: r
layout: base
name: Network Graph
order: 4
output:
  html_document:
    keep_md: true
page_type: example_index
permalink: r/network-graphs/
thumbnail: thumbnail/net.jpg
---


### Read Graph File
We are using the well-known social network of `Zachary's karate club`. GML format file can be collected from [here](https://gist.github.com/pravj/9168fe52823c1702a07b).


``` r
library(plotly)
library(igraph)
library(igraphdata)

data(karate, package="igraphdata")
G <- upgrade_graph(karate)
L <- layout.circle(G)
```

### Create Vertices and Edges

``` r
vs <- V(G)
es <- as.data.frame(get.edgelist(G))

Nv <- length(vs)
Ne <- length(es[1]$V1)
```

### Create Nodes

``` r
library(plotly)

Xn <- L[,1]
Yn <- L[,2]

network <- plot_ly(x = ~Xn, y = ~Yn, mode = "markers", text = vs$label, hoverinfo = "text")
```

### Creates Edges

``` r
edge_shapes <- list()
for(i in 1:Ne) {
  v0 <- es[i,]$V1
  v1 <- es[i,]$V2

  edge_shape = list(
    type = "line",
    line = list(color = "#030303", width = 0.3),
    x0 = Xn[v0],
    y0 = Yn[v0],
    x1 = Xn[v1],
    y1 = Yn[v1]
  )

  edge_shapes[[i]] <- edge_shape
}
```

### Create Network

``` r
axis <- list(title = "", showgrid = FALSE, showticklabels = FALSE, zeroline = FALSE)

fig <- layout(
  network,
  title = 'Karate Network',
  shapes = edge_shapes,
  xaxis = axis,
  yaxis = axis
)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-cb66692ccaf6752a532a" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-cb66692ccaf6752a532a">{"x":{"visdat":{"1bae381234d":["function () ","plotlyVisDat"]},"cur_data":"1bae381234d","attrs":{"1bae381234d":{"x":{},"y":{},"mode":"markers","text":["H","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","A"],"hoverinfo":"text","alpha_stroke":1,"sizes":[10,100],"spans":[1,20]}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Karate Network","shapes":[{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null},{"type":"line","line":{"color":"#030303","width":0.29999999999999999},"x0":null,"y0":null,"x1":null,"y1":null}],"xaxis":{"domain":[0,1],"automargin":true,"title":"","showgrid":false,"showticklabels":false,"zeroline":false},"yaxis":{"domain":[0,1],"automargin":true,"title":"","showgrid":false,"showticklabels":false,"zeroline":false},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,0.98297309968390179,0.93247222940435581,0.85021713572961422,0.73900891722065909,0.60263463637925641,0.44573835577653831,0.27366299007208278,0.092268359463302016,-0.092268359463301891,-0.27366299007208289,-0.4457383557765382,-0.60263463637925629,-0.73900891722065898,-0.85021713572961422,-0.93247222940435581,-0.98297309968390179,-1,-0.98297309968390179,-0.9324722294043557,-0.8502171357296141,-0.73900891722065909,-0.60263463637925652,-0.44573835577653803,-0.27366299007208311,-0.092268359463301919,0.092268359463301544,0.27366299007208278,0.44573835577653853,0.60263463637925618,0.7390089172206592,0.85021713572961388,0.93247222940435581,0.98297309968390179],"y":[0,0.18374951781657034,0.36124166618715292,0.52643216287735572,0.67369564364655721,0.79801722728023949,0.89516329135506234,0.96182564317281904,0.99573417629503447,0.99573417629503458,0.96182564317281904,0.89516329135506234,0.7980172272802396,0.67369564364655743,0.52643216287735572,0.36124166618715292,0.18374951781657037,1.2246467991473532e-16,-0.18374951781657012,-0.36124166618715309,-0.52643216287735584,-0.67369564364655721,-0.79801722728023949,-0.89516329135506245,-0.96182564317281904,-0.99573417629503458,-0.99573417629503458,-0.96182564317281904,-0.89516329135506223,-0.79801722728023972,-0.6736956436465571,-0.52643216287735617,-0.36124166618715303,-0.18374951781657006],"mode":"markers","text":["H","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","A"],"hoverinfo":["text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text","text"],"type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Reference
See [https://plotly.com/python/reference/#scatter](https://plotly.com/python/reference/#scatter) for more information and chart attribute options!
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
