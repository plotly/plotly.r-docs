---
description: How to make Continuous Error Bands in ggplot2 with Plotly.
name: Continuous Error Bands
permalink: ggplot2/continuous-error-bars/
thumnail_github: continuous-error-bars.png
layout: base
language: ggplot2
display_as: statistical
page_type: u-guide
order: 15
output:
  html_document:
    keep_md: true
---



## Default error bar plot

To create continuous errorbar plot we need to use `df.summary`.
To add lower and upper error bars, use `ymin = len-sd` and `ymax = len+sd`.


``` r
library(plotly)
library(ggplot2)
library(dplyr)

df <- ToothGrowth
df$dose <- as.factor(df$dose)
df.summary <- df %>%
  group_by(dose) %>%
  summarise(
    sd = sd(len, na.rm = TRUE),
    len = mean(len)
  )

p <- ggplot(df.summary, aes(dose, len)) +
      geom_line(aes(group = 1)) +
      geom_errorbar( aes(ymin = len-sd, ymax = len+sd),width = 0.2) +
      geom_point(size = 2)

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-482b7d70ab882c0182ac" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-482b7d70ab882c0182ac">{"x":{"data":[{"x":[1,2,3],"y":[10.605,19.734999999999999,26.100000000000001],"text":["dose: 0.5<br />len: 10.605","dose: 1<br />len: 19.735","dose: 2<br />len: 26.100"],"type":"scatter","mode":"lines+markers","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)","dash":"solid"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":7.559055118110237,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"frame":null},{"x":[1,2,3],"y":[10.605,19.734999999999999,26.100000000000001],"text":["dose: 0.5<br />len: 10.605<br />len - sd:  6.105237<br />len + sd: 15.10476","dose: 1<br />len: 19.735<br />len - sd: 15.319564<br />len + sd: 24.15044","dose: 2<br />len: 26.100<br />len - sd: 22.325850<br />len + sd: 29.87415"],"type":"scatter","mode":"lines","opacity":1,"line":{"color":"transparent"},"error_y":{"array":[4.4997631516617211,4.4154364390588192,3.7741503052098757],"arrayminus":[4.499763151661722,4.4154364390588192,3.7741503052098757],"type":"data","width":14.000000000000016,"symmetric":false,"color":"rgba(0,0,0,1)"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":37.260273972602747},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,3.6000000000000001],"tickmode":"array","ticktext":["0.5","1","2"],"tickvals":[1,2,3],"categoryorder":"array","categoryarray":["0.5","1","2"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"dose","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[4.9167911754946987,31.062595978053459],"tickmode":"array","ticktext":["5","10","15","20","25","30"],"tickvals":[5,10,15,20.000000000000004,25,30],"categoryorder":"array","categoryarray":["5","10","15","20","25","30"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"len","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"37803e4af2dc":{"x":{},"y":{},"type":"scatter"},"37802138b29c":{"x":{},"y":{},"ymin":{},"ymax":{}},"378046ef3497":{"x":{},"y":{}}},"cur_data":"37803e4af2dc","visdat":{"37803e4af2dc":["function (y) ","x"],"37802138b29c":["function (y) ","x"],"378046ef3497":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>




## Add jitter



``` r
library(plotly)
library(ggplot2)
library(dplyr)

df <- ToothGrowth
df$dose <- as.factor(df$dose)
df.summary <- df %>%
  group_by(dose) %>%
  summarise(
    sd = sd(len, na.rm = TRUE),
    len = mean(len)
  )

p <- ggplot(df, aes(dose, len)) +
  geom_jitter( position = position_jitter(0.2), color = "darkgray") + 
  geom_line(aes(group = 1), data = df.summary) +
  geom_errorbar(
    aes(ymin = len-sd, ymax = len+sd),
    data = df.summary, width = 0.2) +
  geom_point(data = df.summary, size = 2)
  
ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-559cc1d6a81594b0fefb" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-559cc1d6a81594b0fefb">{"x":{"data":[{"x":[1.0736916651017965,0.99675157824531202,0.96702845431864259,0.85988309811800723,1.0739264396950603,1.1990562818944455,1.0044384630396963,0.98582845609635117,1.0294047219678759,0.89718399820849304,2.0643953084014357,2.0019313452765344,2.1959995670244097,2.010657202359289,1.9630281074903906,1.8208835626021027,1.8097656616941094,2.143710057064891,2.009470188803971,1.9662654564715922,2.9036035810597243,2.9310799998231234,2.9653230579569936,2.8743174650706349,2.9161484962329269,2.8379200449213386,3.1922873627394437,2.8021988864988088,2.8839088464155793,2.8554284746758638,0.85025907019153235,1.1860210254788399,0.87474092058837416,0.85415069283917544,1.1903769787400962,1.0951700516976417,1.0099739869125188,1.0268924337811769,1.0490502571687101,0.81915224036201839,2.0647276747040451,2.0046100323088467,2.1893963139504193,2.0913487405516209,2.1685946049168705,2.0915296883322299,1.9137358845211565,1.9450505806133151,2.0005051629617809,1.9537516886368393,2.8608268140815198,2.8106983025558292,2.9477967703714967,2.9502697783522307,2.8547595387324689,3.1353623555973171,3.0318306951783596,3.0786958161741493,2.9236028922721742,2.8190336786210537],"y":[4.1776484372280533,11.478587847929447,7.2924308380670846,5.8140764379873868,6.3790554190240805,9.9664159393310534,11.163736273329704,11.224413207508624,5.1739531448297198,7.0261273506842556,16.491618194952608,16.504526636656372,15.21994300853461,17.329106351286175,22.479854954108596,17.302880391571673,13.617797883581369,14.483530937116592,18.77735232692212,15.514218880273402,23.564985720198603,18.482995736319573,33.928866426572199,25.490542291551829,26.400787019189444,32.490452835205943,26.723559826761484,21.464212136361748,23.322297209482642,29.487021617311985,15.216522503569722,21.511195103656501,17.563386384956541,9.6616790265776196,14.505742175821215,9.9657259642146521,8.2065001338906587,9.40550653750077,16.534237872865052,9.6810174581781023,19.671298104785382,23.266962840370834,23.561863054540009,26.425478472914545,20.000450851805507,25.16356003148481,25.775399874895811,21.230623420365156,14.481250518094749,27.30615522598848,25.510252112708987,26.393685675375163,22.419970426335929,24.473040126450361,24.798645036276429,30.881921860352158,26.425639421865345,27.305079382825642,29.436062444858251,23.029739733412864],"text":["dose: 0.5<br />len:  4.2","dose: 0.5<br />len: 11.5","dose: 0.5<br />len:  7.3","dose: 0.5<br />len:  5.8","dose: 0.5<br />len:  6.4","dose: 0.5<br />len: 10.0","dose: 0.5<br />len: 11.2","dose: 0.5<br />len: 11.2","dose: 0.5<br />len:  5.2","dose: 0.5<br />len:  7.0","dose: 1<br />len: 16.5","dose: 1<br />len: 16.5","dose: 1<br />len: 15.2","dose: 1<br />len: 17.3","dose: 1<br />len: 22.5","dose: 1<br />len: 17.3","dose: 1<br />len: 13.6","dose: 1<br />len: 14.5","dose: 1<br />len: 18.8","dose: 1<br />len: 15.5","dose: 2<br />len: 23.6","dose: 2<br />len: 18.5","dose: 2<br />len: 33.9","dose: 2<br />len: 25.5","dose: 2<br />len: 26.4","dose: 2<br />len: 32.5","dose: 2<br />len: 26.7","dose: 2<br />len: 21.5","dose: 2<br />len: 23.3","dose: 2<br />len: 29.5","dose: 0.5<br />len: 15.2","dose: 0.5<br />len: 21.5","dose: 0.5<br />len: 17.6","dose: 0.5<br />len:  9.7","dose: 0.5<br />len: 14.5","dose: 0.5<br />len: 10.0","dose: 0.5<br />len:  8.2","dose: 0.5<br />len:  9.4","dose: 0.5<br />len: 16.5","dose: 0.5<br />len:  9.7","dose: 1<br />len: 19.7","dose: 1<br />len: 23.3","dose: 1<br />len: 23.6","dose: 1<br />len: 26.4","dose: 1<br />len: 20.0","dose: 1<br />len: 25.2","dose: 1<br />len: 25.8","dose: 1<br />len: 21.2","dose: 1<br />len: 14.5","dose: 1<br />len: 27.3","dose: 2<br />len: 25.5","dose: 2<br />len: 26.4","dose: 2<br />len: 22.4","dose: 2<br />len: 24.5","dose: 2<br />len: 24.8","dose: 2<br />len: 30.9","dose: 2<br />len: 26.4","dose: 2<br />len: 27.3","dose: 2<br />len: 29.4","dose: 2<br />len: 23.0"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(169,169,169,1)","opacity":1,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(169,169,169,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1,2,3],"y":[10.605,19.734999999999999,26.100000000000001],"text":["dose: 0.5<br />len: 10.605","dose: 1<br />len: 19.735","dose: 2<br />len: 26.100"],"type":"scatter","mode":"lines+markers","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)","dash":"solid"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":7.559055118110237,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"frame":null},{"x":[1,2,3],"y":[10.605,19.734999999999999,26.100000000000001],"text":["dose: 0.5<br />len: 10.605<br />len - sd:  6.105237<br />len + sd: 15.10476","dose: 1<br />len: 19.735<br />len - sd: 15.319564<br />len + sd: 24.15044","dose: 2<br />len: 26.100<br />len - sd: 22.325850<br />len + sd: 29.87415"],"type":"scatter","mode":"lines","opacity":1,"line":{"color":"transparent"},"error_y":{"array":[4.4997631516617211,4.4154364390588192,3.7741503052098757],"arrayminus":[4.499763151661722,4.4154364390588192,3.7741503052098757],"type":"data","width":14.000000000000016,"symmetric":false,"color":"rgba(0,0,0,1)"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":37.260273972602747},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,3.6000000000000001],"tickmode":"array","ticktext":["0.5","1","2"],"tickvals":[1,2,3],"categoryorder":"array","categoryarray":["0.5","1","2"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"dose","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[2.6900875377608457,35.416427326039404],"tickmode":"array","ticktext":["10","20","30"],"tickvals":[10,20,30],"categoryorder":"array","categoryarray":["10","20","30"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"len","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"378018d46793":{"x":{},"y":{},"type":"scatter"},"378074481d2a":{"x":{},"y":{}},"378042d02882":{"x":{},"y":{},"ymin":{},"ymax":{}},"37802690cb32":{"x":{},"y":{}}},"cur_data":"378018d46793","visdat":{"378018d46793":["function (y) ","x"],"378074481d2a":["function (y) ","x"],"378042d02882":["function (y) ","x"],"37802690cb32":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>



## Create groups

To make sure groups do not overlay, use `position_dodge()`


``` r
library(plotly)
library(ggplot2)
library(dplyr)

df <- ToothGrowth
df$dose <- as.factor(df$dose)
df.summary <- df %>%
  group_by(dose, supp) %>%
  summarise(
    sd = sd(len),
    len = mean(len)
  )

p <- ggplot(df.summary, aes(dose, len)) +
        geom_errorbar(
          aes(ymin = len-sd, ymax = len+sd, color = supp),
          position = position_dodge(0.3), width = 0.2
          )+
        geom_point(aes(color = supp), position = position_dodge(0.3)) +
        scale_color_manual(values = c("#00AFBB", "#E7B800")) 

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-06ab44b549399382c915" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-06ab44b549399382c915">{"x":{"data":[{"x":[0.92500000000000004,1.925,2.9249999999999998],"y":[13.23,22.699999999999999,26.059999999999999],"text":["dose: 0.5<br />len: 13.23<br />len - sd:  8.770291<br />len + sd: 17.68971<br />supp: OJ","dose: 1<br />len: 22.70<br />len - sd: 18.789047<br />len + sd: 26.61095<br />supp: OJ","dose: 2<br />len: 26.06<br />len - sd: 23.404942<br />len + sd: 28.71506<br />supp: OJ"],"type":"scatter","mode":"lines","opacity":1,"line":{"color":"transparent"},"error_y":{"array":[4.459708510654032,3.9109532796436675,2.6550580659061538],"arrayminus":[4.459708510654032,3.9109532796436675,2.6550580659061538],"type":"data","width":7.000000000000008,"symmetric":false,"color":"rgba(0,175,187,1)"},"name":"OJ","legendgroup":"OJ","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.075,2.0750000000000002,3.0750000000000002],"y":[7.9799999999999995,16.77,26.140000000000001],"text":["dose: 0.5<br />len:  7.98<br />len - sd:  5.233366<br />len + sd: 10.72663<br />supp: VC","dose: 1<br />len: 16.77<br />len - sd: 14.254691<br />len + sd: 19.28531<br />supp: VC","dose: 2<br />len: 26.14<br />len - sd: 21.342269<br />len + sd: 30.93773<br />supp: VC"],"type":"scatter","mode":"lines","opacity":1,"line":{"color":"transparent"},"error_y":{"array":[2.7466343040164629,2.515308684391993,4.797730945167956],"arrayminus":[2.7466343040164629,2.515308684391993,4.797730945167956],"type":"data","width":7.000000000000008,"symmetric":false,"color":"rgba(231,184,0,1)"},"name":"VC","legendgroup":"VC","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0.92500000000000004,1.925,2.9249999999999998],"y":[13.23,22.699999999999999,26.059999999999999],"text":["dose: 0.5<br />len: 13.23<br />supp: OJ","dose: 1<br />len: 22.70<br />supp: OJ","dose: 2<br />len: 26.06<br />supp: OJ"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,175,187,1)","opacity":1,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,175,187,1)"}},"hoveron":"points","name":"OJ","legendgroup":"OJ","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.075,2.0750000000000002,3.0750000000000002],"y":[7.9799999999999995,16.77,26.140000000000001],"text":["dose: 0.5<br />len:  7.98<br />supp: VC","dose: 1<br />len: 16.77<br />supp: VC","dose: 2<br />len: 26.14<br />supp: VC"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(231,184,0,1)","opacity":1,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(231,184,0,1)"}},"hoveron":"points","name":"VC","legendgroup":"VC","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":37.260273972602747},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,3.6000000000000001],"tickmode":"array","ticktext":["0.5","1","2"],"tickvals":[1,2,3],"categoryorder":"array","categoryarray":["0.5","1","2"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"dose","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[3.9481474335243156,32.222949207627181],"tickmode":"array","ticktext":["10","20","30"],"tickvals":[10,20,30],"categoryorder":"array","categoryarray":["10","20","30"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"len","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498},"title":{"text":"supp","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"37804bf6ace6":{"x":{},"y":{},"ymin":{},"ymax":{},"colour":{},"type":"scatter"},"37803821641":{"x":{},"y":{},"colour":{}}},"cur_data":"37804bf6ace6","visdat":{"37804bf6ace6":["function (y) ","x"],"37803821641":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

Add line with `geom_line()`, remember to apply `position_dodge()` to make sure groups do not overlay each other.


``` r
library(plotly)
library(ggplot2)
library(dplyr)

df <- ToothGrowth
df$dose <- as.factor(df$dose)
df.summary <- df %>%
  group_by(dose, supp) %>%
  summarise(
    sd = sd(len),
    len = mean(len)
  )

p <- ggplot(df.summary, aes(dose, len)) +
      geom_line(aes(linetype = supp, group = supp), position = position_dodge(0.3))+
      geom_errorbar(
        aes(ymin = len-sd, ymax = len+sd, color = supp),
        position = position_dodge(0.3), width = 0.2
        )+
      geom_point(aes(color = supp), position = position_dodge(0.3)) +
      scale_color_manual(values = c("#00AFBB", "#E7B800")) 


ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-e062ba9daa2415ed56a3" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-e062ba9daa2415ed56a3">{"x":{"data":[{"x":[0.92500000000000004,1.925,2.9249999999999998],"y":[13.23,22.699999999999999,26.059999999999999],"text":["dose: 0.5<br />len: 13.23<br />supp: OJ<br />supp: OJ","dose: 1<br />len: 22.70<br />supp: OJ<br />supp: OJ","dose: 2<br />len: 26.06<br />supp: OJ<br />supp: OJ"],"type":"scatter","mode":"lines","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)","dash":"solid"},"hoveron":"points","name":"(OJ,1)","legendgroup":"(OJ,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.075,2.0750000000000002,3.0750000000000002],"y":[7.9799999999999995,16.77,26.140000000000001],"text":["dose: 0.5<br />len:  7.98<br />supp: VC<br />supp: VC","dose: 1<br />len: 16.77<br />supp: VC<br />supp: VC","dose: 2<br />len: 26.14<br />supp: VC<br />supp: VC"],"type":"scatter","mode":"lines","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)","dash":"dash"},"hoveron":"points","name":"(VC,1)","legendgroup":"(VC,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0.92500000000000004,1.925,2.9249999999999998],"y":[13.23,22.699999999999999,26.059999999999999],"text":["dose: 0.5<br />len: 13.23<br />len - sd:  8.770291<br />len + sd: 17.68971<br />supp: OJ","dose: 1<br />len: 22.70<br />len - sd: 18.789047<br />len + sd: 26.61095<br />supp: OJ","dose: 2<br />len: 26.06<br />len - sd: 23.404942<br />len + sd: 28.71506<br />supp: OJ"],"type":"scatter","mode":"lines","opacity":1,"line":{"color":"transparent"},"error_y":{"array":[4.459708510654032,3.9109532796436675,2.6550580659061538],"arrayminus":[4.459708510654032,3.9109532796436675,2.6550580659061538],"type":"data","width":7.000000000000008,"symmetric":false,"color":"rgba(0,175,187,1)"},"name":"(OJ,1)","legendgroup":"(OJ,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.075,2.0750000000000002,3.0750000000000002],"y":[7.9799999999999995,16.77,26.140000000000001],"text":["dose: 0.5<br />len:  7.98<br />len - sd:  5.233366<br />len + sd: 10.72663<br />supp: VC","dose: 1<br />len: 16.77<br />len - sd: 14.254691<br />len + sd: 19.28531<br />supp: VC","dose: 2<br />len: 26.14<br />len - sd: 21.342269<br />len + sd: 30.93773<br />supp: VC"],"type":"scatter","mode":"lines","opacity":1,"line":{"color":"transparent"},"error_y":{"array":[2.7466343040164629,2.515308684391993,4.797730945167956],"arrayminus":[2.7466343040164629,2.515308684391993,4.797730945167956],"type":"data","width":7.000000000000008,"symmetric":false,"color":"rgba(231,184,0,1)"},"name":"(VC,1)","legendgroup":"(VC,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0.92500000000000004,1.925,2.9249999999999998],"y":[13.23,22.699999999999999,26.059999999999999],"text":["dose: 0.5<br />len: 13.23<br />supp: OJ","dose: 1<br />len: 22.70<br />supp: OJ","dose: 2<br />len: 26.06<br />supp: OJ"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,175,187,1)","opacity":1,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,175,187,1)"}},"hoveron":"points","name":"(OJ,1)","legendgroup":"(OJ,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.075,2.0750000000000002,3.0750000000000002],"y":[7.9799999999999995,16.77,26.140000000000001],"text":["dose: 0.5<br />len:  7.98<br />supp: VC","dose: 1<br />len: 16.77<br />supp: VC","dose: 2<br />len: 26.14<br />supp: VC"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(231,184,0,1)","opacity":1,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(231,184,0,1)"}},"hoveron":"points","name":"(VC,1)","legendgroup":"(VC,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283104,"r":7.3059360730593621,"b":40.182648401826491,"l":37.260273972602747},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,3.6000000000000001],"tickmode":"array","ticktext":["0.5","1","2"],"tickvals":[1,2,3],"categoryorder":"array","categoryarray":["0.5","1","2"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"dose","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[3.9481474335243156,32.222949207627181],"tickmode":"array","ticktext":["10","20","30"],"tickvals":[10,20,30],"categoryorder":"array","categoryarray":["10","20","30"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"len","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498},"title":{"text":"supp","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"378042530a95":{"x":{},"y":{},"linetype":{},"type":"scatter"},"3780739453be":{"x":{},"y":{},"ymin":{},"ymax":{},"colour":{}},"3780221a1001":{"x":{},"y":{},"colour":{}}},"cur_data":"378042530a95","visdat":{"378042530a95":["function (y) ","x"],"3780739453be":["function (y) ","x"],"3780221a1001":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>



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
