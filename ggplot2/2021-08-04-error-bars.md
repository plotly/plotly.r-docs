---
name: Error Bars
permalink: ggplot2/error-bars/
description: How to make Error Plots in ggplot2 with Plotly.
layout: base
thumnail_github: error-bars.png
language: ggplot2
page_type: u-guide
display_as: statistical
order: 1
output:
  html_document:
    keep_md: true
---


### Basic Error Bar


``` r
library(plotly)

df <- data.frame(x = 1:10,
                 y = 1:10,
                 ymin = (1:10) - runif(10),
                 ymax = (1:10) + runif(10),
                 xmin = (1:10) - runif(10),
                 xmax = (1:10) + runif(10))

p <- ggplot(data = df,aes(x = x,y = y)) + 
    geom_point() + 
    geom_errorbar(aes(ymin = ymin,ymax = ymax)) + 
    geom_errorbarh(aes(xmin = xmin,xmax = xmax))

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-72ada7c208acba873d32" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-72ada7c208acba873d32">{"x":{"data":[{"x":[1,2,3,4,5,6,7,8,9,10],"y":[1,2,3,4,5,6,7,8,9,10],"text":["x:  1<br />y:  1","x:  2<br />y:  2","x:  3<br />y:  3","x:  4<br />y:  4","x:  5<br />y:  5","x:  6<br />y:  6","x:  7<br />y:  7","x:  8<br />y:  8","x:  9<br />y:  9","x: 10<br />y: 10"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[1,2,3,4,5,6,7,8,9,10],"text":["x:  1<br />y:  1<br />ymin: 0.8234201<br />ymax:  1.879675","x:  2<br />y:  2<br />ymin: 1.1983102<br />ymax:  2.612378","x:  3<br />y:  3<br />ymin: 2.6701583<br />ymax:  3.065953","x:  4<br />y:  4<br />ymin: 3.3476494<br />ymax:  4.674607","x:  5<br />y:  5<br />ymin: 4.0688441<br />ymax:  5.235569","x:  6<br />y:  6<br />ymin: 5.4083208<br />ymax:  6.081782","x:  7<br />y:  7<br />ymin: 6.6811199<br />ymax:  7.585396","x:  8<br />y:  8<br />ymin: 7.5226375<br />ymax:  8.761683","x:  9<br />y:  9<br />ymin: 8.8871164<br />ymax:  9.855698","x: 10<br />y: 10<br />ymin: 9.3359314<br />ymax: 10.164268"],"type":"scatter","mode":"lines","opacity":1,"line":{"color":"transparent"},"error_y":{"array":[0.87967530032619834,0.61237782938405871,0.065953270066529512,0.67460728599689901,0.23556924308650196,0.081781840417534113,0.58539647422730923,0.76168287661857903,0.85569798084907234,0.16426786733791232],"arrayminus":[0.17657992127351463,0.80168981780298054,0.32984166638925672,0.65235061920247972,0.93115586717613041,0.59167921356856823,0.31888010492548347,0.47736248373985291,0.11288363835774362,0.6640686250757426],"type":"data","width":17.671044854039312,"symmetric":false,"color":"rgba(0,0,0,1)"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1,2,3,4,5,6,7,8,9,10],"y":[1,2,3,4,5,6,7,8,9,10],"text":["x:  1<br />y:  1<br />xmin: 0.07864229<br />xmax:  1.567261","x:  2<br />y:  2<br />xmin: 1.51777081<br />xmax:  2.805718","x:  3<br />y:  3<br />xmin: 2.15951236<br />xmax:  3.666316","x:  4<br />y:  4<br />xmin: 3.32887368<br />xmax:  4.232293","x:  5<br />y:  5<br />xmin: 4.19298451<br />xmax:  5.713249","x:  6<br />y:  6<br />xmin: 5.82415289<br />xmax:  6.396771","x:  7<br />y:  7<br />xmin: 6.47662114<br />xmax:  7.737213","x:  8<br />y:  8<br />xmin: 7.91957752<br />xmax:  8.326986","x:  9<br />y:  9<br />xmin: 8.67536636<br />xmax:  9.979567","x: 10<br />y: 10<br />xmin: 9.70117687<br />xmax: 10.420958"],"type":"scatter","mode":"lines","opacity":1,"line":{"color":"transparent"},"error_x":{"array":[0.56726061156950891,0.80571801168844104,0.66631649574264884,0.23229291685856879,0.71324866684153676,0.39677058649249375,0.73721264279447496,0.32698574429377913,0.97956667304970324,0.42095781210809946],"arrayminus":[0.9213577089831233,0.48222919227555394,0.84048763662576675,0.67112632188946009,0.80701548513025045,0.17584710544906557,0.52337885810993612,0.080422478727996349,0.3246336376760155,0.29882312542758882],"type":"data","width":13.223140495867771,"symmetric":false,"color":"rgba(0,0,0,1)"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":48.949771689497723},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-0.43992559443227941,10.968567885449156],"tickmode":"array","ticktext":["0.0","2.5","5.0","7.5","10.0"],"tickvals":[0,2.5,5,7.5,10],"categoryorder":"array","categoryarray":["0.0","2.5","5.0","7.5","10.0"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"x","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.055000000000000104,10.944999999999999],"tickmode":"array","ticktext":["2.5","5.0","7.5","10.0"],"tickvals":[2.5,5,7.5000000000000009,10],"categoryorder":"array","categoryarray":["2.5","5.0","7.5","10.0"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"y","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"3ba72e482a4a":{"x":{},"y":{},"type":"scatter"},"3ba7b5da9c5":{"x":{},"y":{},"ymin":{},"ymax":{}},"3ba75b6c2308":{"x":{},"y":{},"xmin":{},"xmax":{}}},"cur_data":"3ba72e482a4a","visdat":{"3ba72e482a4a":["function (y) ","x"],"3ba7b5da9c5":["function (y) ","x"],"3ba75b6c2308":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Margin Error Bar


``` r
library(plotly)

population <- data.frame(Year=seq(1790, 1970, length.out=length(uspop)), 
                         Population=uspop, 
                         Error=rnorm(length(uspop), 5))

library(ggplot2)
p <- ggplot(population, aes(x=Year, y=Population, 
                       ymin=Population-Error, ymax=Population+Error))+
  geom_line()+
  geom_point(pch=2)+
  geom_errorbar(width=0.9)

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-1f762092a65590b1d1e1" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-1f762092a65590b1d1e1">{"x":{"data":[{"x":[1790,1800,1810,1820,1830,1840,1850,1860,1870,1880,1890,1900,1910,1920,1930,1940,1950,1960,1970],"y":[3.9300000000000002,5.3099999999999996,7.2400000000000002,9.6400000000000006,12.9,17.100000000000001,23.199999999999999,31.399999999999999,39.799999999999997,50.200000000000003,62.899999999999999,76,92,105.7,122.8,131.69999999999999,151.30000000000001,179.30000000000001,203.19999999999999],"text":["Year: 1790<br />Population:   3.93<br />Population - Error:  -0.1146972<br />Population + Error:   7.974697","Year: 1800<br />Population:   5.31<br />Population - Error:  -0.3480560<br />Population + Error:  10.968056","Year: 1810<br />Population:   7.24<br />Population - Error:   1.0698247<br />Population + Error:  13.410175","Year: 1820<br />Population:   9.64<br />Population - Error:   4.6622385<br />Population + Error:  14.617762","Year: 1830<br />Population:  12.90<br />Population - Error:   7.0661900<br />Population + Error:  18.733810","Year: 1840<br />Population:  17.10<br />Population - Error:  13.1080135<br />Population + Error:  21.091987","Year: 1850<br />Population:  23.20<br />Population - Error:  17.9311890<br />Population + Error:  28.468811","Year: 1860<br />Population:  31.40<br />Population - Error:  27.0302763<br />Population + Error:  35.769724","Year: 1870<br />Population:  39.80<br />Population - Error:  33.7641485<br />Population + Error:  45.835851","Year: 1880<br />Population:  50.20<br />Population - Error:  44.3155035<br />Population + Error:  56.084496","Year: 1890<br />Population:  62.90<br />Population - Error:  57.5392699<br />Population + Error:  68.260730","Year: 1900<br />Population:  76.00<br />Population - Error:  70.8806650<br />Population + Error:  81.119335","Year: 1910<br />Population:  92.00<br />Population - Error:  87.0259627<br />Population + Error:  96.974037","Year: 1920<br />Population: 105.70<br />Population - Error:  99.7596544<br />Population + Error: 111.640346","Year: 1930<br />Population: 122.80<br />Population - Error: 118.6348300<br />Population + Error: 126.965170","Year: 1940<br />Population: 131.70<br />Population - Error: 127.4707526<br />Population + Error: 135.929247","Year: 1950<br />Population: 151.30<br />Population - Error: 145.9354063<br />Population + Error: 156.664594","Year: 1960<br />Population: 179.30<br />Population - Error: 174.7085715<br />Population + Error: 183.891428","Year: 1970<br />Population: 203.20<br />Population - Error: 200.7817600<br />Population + Error: 205.618240"],"type":"scatter","mode":"lines+markers","line":{"width":1.8897637795275593,"color":"transparent","dash":"solid"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.6692913385826778,"symbol":"triangle-up-open","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"opacity":1,"error_y":{"array":[4.044697213153988,5.6580559553379883,6.1701752870020155,4.977761505170692,5.8338099856333994,3.9919865083912072,5.268810996253432,4.3697236559411081,6.0358514521076572,5.8844964545701188,5.3607301310442992,5.1193349698598212,4.97403729317287,5.9403455720886029,4.1651699944872576,4.229247374958959,5.3645936692912812,4.5914284869986659,2.4182400003802798],"arrayminus":[4.044697213153988,5.6580559553379892,6.1701752870020155,4.977761505170692,5.8338099856334011,3.9919865083912089,5.268810996253432,4.3697236559411117,6.0358514521076572,5.8844964545701188,5.3607301310442921,5.1193349698598212,4.97403729317287,5.9403455720886029,4.1651699944872576,4.229247374958959,5.3645936692912812,4.5914284869986659,2.4182400003802798],"type":"data","width":1.0131162369969349,"symmetric":false,"color":"rgba(0,0,0,1)"},"frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":43.105022831050235},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[1780.5049999999999,1979.4950000000001],"tickmode":"array","ticktext":["1800","1850","1900","1950"],"tickvals":[1800,1850,1900,1950],"categoryorder":"array","categoryarray":["1800","1850","1900","1950"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"Year","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-10.646370753123904,215.91655479816617],"tickmode":"array","ticktext":["0","50","100","150","200"],"tickvals":[0,50,100,150,200],"categoryorder":"array","categoryarray":["0","50","100","150","200"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"Population","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"3ba710ab1c9e":{"x":{},"y":{},"ymin":{},"ymax":{},"type":"scatter"},"3ba7516dbfa0":{"x":{},"y":{},"ymin":{},"ymax":{}},"3ba72ab588d3":{"x":{},"y":{},"ymin":{},"ymax":{}}},"cur_data":"3ba710ab1c9e","visdat":{"3ba710ab1c9e":["function (y) ","x"],"3ba7516dbfa0":["function (y) ","x"],"3ba72ab588d3":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

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
