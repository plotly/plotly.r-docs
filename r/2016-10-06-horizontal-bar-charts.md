---
description: How to make a horizontal bar chart in R. Examples of grouped, stacked,
  overlaid, and colored horizontal bar charts.
display_as: basic
language: r
layout: base
name: Horizontal Bar Charts
order: 8
output:
  html_document:
    keep_md: true
permalink: r/horizontal-bar-charts/
thumbnail: thumbnail/horizontal-bar.jpg
---


### Basic Horizontal Bar Chart


``` r
library(plotly)

fig <- plot_ly(x = c(20, 14, 23), y = c('giraffes', 'orangutans', 'monkeys'), type = 'bar', orientation = 'h')

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-ee8596d5991b5940df96" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-ee8596d5991b5940df96">{"x":{"visdat":{"1f1b45c797df":["function () ","plotlyVisDat"]},"cur_data":"1f1b45c797df","attrs":{"1f1b45c797df":{"x":[20,14,23],"y":["giraffes","orangutans","monkeys"],"orientation":"h","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":[]},"yaxis":{"domain":[0,1],"automargin":true,"title":[],"type":"category","categoryorder":"array","categoryarray":["giraffes","monkeys","orangutans"]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[20,14,23],"y":["giraffes","orangutans","monkeys"],"orientation":"h","type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Colored Horizontal Bar Chart


``` r
library(plotly)

y <- c('giraffes', 'orangutans', 'monkeys')
SF_Zoo <- c(20, 14, 23)
LA_Zoo <- c(12, 18, 29)
data <- data.frame(y, SF_Zoo, LA_Zoo)

fig <- plot_ly(data, x = ~SF_Zoo, y = ~y, type = 'bar', orientation = 'h', name = 'SF Zoo',
        marker = list(color = 'rgba(246, 78, 139, 0.6)',
                      line = list(color = 'rgba(246, 78, 139, 1.0)',
                                  width = 3)))
fig <- fig %>% add_trace(x = ~LA_Zoo, name = 'LA Zoo',
            marker = list(color = 'rgba(58, 71, 80, 0.6)',
                          line = list(color = 'rgba(58, 71, 80, 1.0)',
                                      width = 3)))
fig <- fig %>% layout(barmode = 'stack',
         xaxis = list(title = ""),
         yaxis = list(title =""))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-01d746f9f1e74194ded7" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-01d746f9f1e74194ded7">{"x":{"visdat":{"1f1b4629644a":["function () ","plotlyVisDat"]},"cur_data":"1f1b4629644a","attrs":{"1f1b4629644a":{"x":{},"y":{},"orientation":"h","marker":{"color":"rgba(246, 78, 139, 0.6)","line":{"color":"rgba(246, 78, 139, 1.0)","width":3}},"name":"SF Zoo","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"1f1b4629644a.1":{"x":{},"y":{},"orientation":"h","marker":{"color":"rgba(58, 71, 80, 0.6)","line":{"color":"rgba(58, 71, 80, 1.0)","width":3}},"name":"LA Zoo","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"barmode":"stack","xaxis":{"domain":[0,1],"automargin":true,"title":""},"yaxis":{"domain":[0,1],"automargin":true,"title":"","type":"category","categoryorder":"array","categoryarray":["giraffes","monkeys","orangutans"]},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[20,14,23],"y":["giraffes","orangutans","monkeys"],"orientation":"h","marker":{"color":"rgba(246, 78, 139, 0.6)","line":{"color":"rgba(246, 78, 139, 1.0)","width":3}},"name":"SF Zoo","type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[12,18,29],"y":["giraffes","orangutans","monkeys"],"orientation":"h","marker":{"color":"rgba(58, 71, 80, 0.6)","line":{"color":"rgba(58, 71, 80, 1.0)","width":3}},"name":"LA Zoo","type":"bar","error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Color Palette for Bar Chart


``` r
library(plotly)

y <- c('The course was effectively<br>organized',
       'The course developed my<br>abilities and skills for<br>the subject',
       'The course developed my<br>ability to think critically about<br>the subject',
       'I would recommend this<br>course to a friend')
x1 <- c(21, 24, 27, 29)
x2 <-c(30, 31, 26, 24)
x3 <- c(21, 19, 23, 15)
x4 <- c(16, 15, 11, 18)
x5 <- c(12, 11, 13, 14)

data <- data.frame(y, x1, x2, x3, x4, x5)

top_labels <- c('Strongly<br>agree', 'Agree', 'Neutral', 'Disagree', 'Strongly<br>disagree')

fig <- plot_ly(data, x = ~x1, y = ~y, type = 'bar', orientation = 'h',
        marker = list(color = 'rgba(38, 24, 74, 0.8)',
                      line = list(color = 'rgb(248, 248, 249)', width = 1))) 
fig <- fig %>% add_trace(x = ~x2, marker = list(color = 'rgba(71, 58, 131, 0.8)')) 
fig <- fig %>% add_trace(x = ~x3, marker = list(color = 'rgba(122, 120, 168, 0.8)')) 
fig <- fig %>% add_trace(x = ~x4, marker = list(color = 'rgba(164, 163, 204, 0.85)')) 
fig <- fig %>% add_trace(x = ~x5, marker = list(color = 'rgba(190, 192, 213, 1)')) 
fig <- fig %>% layout(xaxis = list(title = "",
                      showgrid = FALSE,
                      showline = FALSE,
                      showticklabels = FALSE,
                      zeroline = FALSE,
                      domain = c(0.15, 1)),
         yaxis = list(title = "",
                      showgrid = FALSE,
                      showline = FALSE,
                      showticklabels = FALSE,
                      zeroline = FALSE),
         barmode = 'stack',
         paper_bgcolor = 'rgb(248, 248, 255)', plot_bgcolor = 'rgb(248, 248, 255)',
         margin = list(l = 120, r = 10, t = 140, b = 80),
         showlegend = FALSE) 
  # labeling the y-axis
fig <- fig %>% add_annotations(xref = 'paper', yref = 'y', x = 0.14, y = y,
                  xanchor = 'right',
                  text = y,
                  font = list(family = 'Arial', size = 12,
                            color = 'rgb(67, 67, 67)'),
                  showarrow = FALSE, align = 'right') 
  # labeling the percentages of each bar (x_axis)
fig <- fig %>% add_annotations(xref = 'x', yref = 'y',
                  x = x1 / 2, y = y,
                  text = paste(data[,"x1"], '%'),
                  font = list(family = 'Arial', size = 12,
                            color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) 
fig <- fig %>% add_annotations(xref = 'x', yref = 'y',
                  x = x1 + x2 / 2, y = y,
                  text = paste(data[,"x2"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) 
fig <- fig %>% add_annotations(xref = 'x', yref = 'y',
                  x = x1 + x2 + x3 / 2, y = y,
                  text = paste(data[,"x3"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) 
fig <- fig %>% add_annotations(xref = 'x', yref = 'y',
                  x = x1 + x2 + x3 + x4 / 2, y = y,
                  text = paste(data[,"x4"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) 
fig <- fig %>% add_annotations(xref = 'x', yref = 'y',
                  x = x1 + x2 + x3 + x4 + x5 / 2, y = y,
                  text = paste(data[,"x5"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) 
  # labeling the first Likert scale (on the top)
fig <- fig %>% add_annotations(xref = 'x', yref = 'paper',
                  x = c(21 / 2, 21 + 30 / 2, 21 + 30 + 21 / 2, 21 + 30 + 21 + 16 / 2,
                        21 + 30 + 21 + 16 + 12 / 2),
                  y = 1.15,
                  text = top_labels,
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(67, 67, 67)'),
                  showarrow = FALSE)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-253db79c5eaf1cc42a70" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-253db79c5eaf1cc42a70">{"x":{"visdat":{"1f1b4dc75966":["function () ","plotlyVisDat"]},"cur_data":"1f1b4dc75966","attrs":{"1f1b4dc75966":{"x":{},"y":{},"orientation":"h","marker":{"color":"rgba(38, 24, 74, 0.8)","line":{"color":"rgb(248, 248, 249)","width":1}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"1f1b4dc75966.1":{"x":{},"y":{},"orientation":"h","marker":{"color":"rgba(71, 58, 131, 0.8)","line":{"color":"rgb(248, 248, 249)","width":1}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true},"1f1b4dc75966.2":{"x":{},"y":{},"orientation":"h","marker":{"color":"rgba(122, 120, 168, 0.8)","line":{"color":"rgb(248, 248, 249)","width":1}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true},"1f1b4dc75966.3":{"x":{},"y":{},"orientation":"h","marker":{"color":"rgba(164, 163, 204, 0.85)","line":{"color":"rgb(248, 248, 249)","width":1}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true},"1f1b4dc75966.4":{"x":{},"y":{},"orientation":"h","marker":{"color":"rgba(190, 192, 213, 1)","line":{"color":"rgb(248, 248, 249)","width":1}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true}},"layout":{"margin":{"b":80,"l":120,"t":140,"r":10},"xaxis":{"domain":[0.14999999999999999,1],"automargin":true,"title":"","showgrid":false,"showline":false,"showticklabels":false,"zeroline":false},"yaxis":{"domain":[0,1],"automargin":true,"title":"","showgrid":false,"showline":false,"showticklabels":false,"zeroline":false,"type":"category","categoryorder":"array","categoryarray":["I would recommend this<br>course to a friend","The course developed my<br>abilities and skills for<br>the subject","The course developed my<br>ability to think critically about<br>the subject","The course was effectively<br>organized"]},"barmode":"stack","paper_bgcolor":"rgb(248, 248, 255)","plot_bgcolor":"rgb(248, 248, 255)","showlegend":false,"annotations":[{"text":"The course was effectively<br>organized","xref":"paper","yref":"y","x":0.14000000000000001,"y":"The course was effectively<br>organized","xanchor":"right","font":{"family":"Arial","size":12,"color":"rgb(67, 67, 67)"},"showarrow":false,"align":"right"},{"text":"The course developed my<br>abilities and skills for<br>the subject","xref":"paper","yref":"y","x":0.14000000000000001,"y":"The course developed my<br>abilities and skills for<br>the subject","xanchor":"right","font":{"family":"Arial","size":12,"color":"rgb(67, 67, 67)"},"showarrow":false,"align":"right"},{"text":"The course developed my<br>ability to think critically about<br>the subject","xref":"paper","yref":"y","x":0.14000000000000001,"y":"The course developed my<br>ability to think critically about<br>the subject","xanchor":"right","font":{"family":"Arial","size":12,"color":"rgb(67, 67, 67)"},"showarrow":false,"align":"right"},{"text":"I would recommend this<br>course to a friend","xref":"paper","yref":"y","x":0.14000000000000001,"y":"I would recommend this<br>course to a friend","xanchor":"right","font":{"family":"Arial","size":12,"color":"rgb(67, 67, 67)"},"showarrow":false,"align":"right"},{"text":"21 %","xref":"x","yref":"y","x":10.5,"y":"The course was effectively<br>organized","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"24 %","xref":"x","yref":"y","x":12,"y":"The course developed my<br>abilities and skills for<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"27 %","xref":"x","yref":"y","x":13.5,"y":"The course developed my<br>ability to think critically about<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"29 %","xref":"x","yref":"y","x":14.5,"y":"I would recommend this<br>course to a friend","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"30 %","xref":"x","yref":"y","x":36,"y":"The course was effectively<br>organized","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"31 %","xref":"x","yref":"y","x":39.5,"y":"The course developed my<br>abilities and skills for<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"26 %","xref":"x","yref":"y","x":40,"y":"The course developed my<br>ability to think critically about<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"24 %","xref":"x","yref":"y","x":41,"y":"I would recommend this<br>course to a friend","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"21 %","xref":"x","yref":"y","x":61.5,"y":"The course was effectively<br>organized","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"19 %","xref":"x","yref":"y","x":64.5,"y":"The course developed my<br>abilities and skills for<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"23 %","xref":"x","yref":"y","x":64.5,"y":"The course developed my<br>ability to think critically about<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"15 %","xref":"x","yref":"y","x":60.5,"y":"I would recommend this<br>course to a friend","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"16 %","xref":"x","yref":"y","x":80,"y":"The course was effectively<br>organized","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"15 %","xref":"x","yref":"y","x":81.5,"y":"The course developed my<br>abilities and skills for<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"11 %","xref":"x","yref":"y","x":81.5,"y":"The course developed my<br>ability to think critically about<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"18 %","xref":"x","yref":"y","x":77,"y":"I would recommend this<br>course to a friend","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"12 %","xref":"x","yref":"y","x":94,"y":"The course was effectively<br>organized","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"11 %","xref":"x","yref":"y","x":94.5,"y":"The course developed my<br>abilities and skills for<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"13 %","xref":"x","yref":"y","x":93.5,"y":"The course developed my<br>ability to think critically about<br>the subject","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"14 %","xref":"x","yref":"y","x":93,"y":"I would recommend this<br>course to a friend","font":{"family":"Arial","size":12,"color":"rgb(248, 248, 255)"},"showarrow":false},{"text":"Strongly<br>agree","xref":"x","yref":"paper","x":10.5,"y":1.1499999999999999,"font":{"family":"Arial","size":12,"color":"rgb(67, 67, 67)"},"showarrow":false},{"text":"Agree","xref":"x","yref":"paper","x":36,"y":1.1499999999999999,"font":{"family":"Arial","size":12,"color":"rgb(67, 67, 67)"},"showarrow":false},{"text":"Neutral","xref":"x","yref":"paper","x":61.5,"y":1.1499999999999999,"font":{"family":"Arial","size":12,"color":"rgb(67, 67, 67)"},"showarrow":false},{"text":"Disagree","xref":"x","yref":"paper","x":80,"y":1.1499999999999999,"font":{"family":"Arial","size":12,"color":"rgb(67, 67, 67)"},"showarrow":false},{"text":"Strongly<br>disagree","xref":"x","yref":"paper","x":94,"y":1.1499999999999999,"font":{"family":"Arial","size":12,"color":"rgb(67, 67, 67)"},"showarrow":false}],"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[21,24,27,29],"y":["The course was effectively<br>organized","The course developed my<br>abilities and skills for<br>the subject","The course developed my<br>ability to think critically about<br>the subject","I would recommend this<br>course to a friend"],"orientation":"h","marker":{"color":"rgba(38, 24, 74, 0.8)","line":{"color":"rgb(248, 248, 249)","width":1}},"type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[30,31,26,24],"y":["The course was effectively<br>organized","The course developed my<br>abilities and skills for<br>the subject","The course developed my<br>ability to think critically about<br>the subject","I would recommend this<br>course to a friend"],"orientation":"h","marker":{"color":"rgba(71, 58, 131, 0.8)","line":{"color":"rgb(248, 248, 249)","width":1}},"type":"bar","error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[21,19,23,15],"y":["The course was effectively<br>organized","The course developed my<br>abilities and skills for<br>the subject","The course developed my<br>ability to think critically about<br>the subject","I would recommend this<br>course to a friend"],"orientation":"h","marker":{"color":"rgba(122, 120, 168, 0.8)","line":{"color":"rgb(248, 248, 249)","width":1}},"type":"bar","error_y":{"color":"rgba(44,160,44,1)"},"error_x":{"color":"rgba(44,160,44,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[16,15,11,18],"y":["The course was effectively<br>organized","The course developed my<br>abilities and skills for<br>the subject","The course developed my<br>ability to think critically about<br>the subject","I would recommend this<br>course to a friend"],"orientation":"h","marker":{"color":"rgba(164, 163, 204, 0.85)","line":{"color":"rgb(248, 248, 249)","width":1}},"type":"bar","error_y":{"color":"rgba(214,39,40,1)"},"error_x":{"color":"rgba(214,39,40,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[12,11,13,14],"y":["The course was effectively<br>organized","The course developed my<br>abilities and skills for<br>the subject","The course developed my<br>ability to think critically about<br>the subject","I would recommend this<br>course to a friend"],"orientation":"h","marker":{"color":"rgba(190, 192, 213, 1)","line":{"color":"rgb(248, 248, 249)","width":1}},"type":"bar","error_y":{"color":"rgba(148,103,189,1)"},"error_x":{"color":"rgba(148,103,189,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Bar Chart with Line Plot


``` r
library(plotly)

y <- c('Japan', 'United Kingdom', 'Canada', 'Netherlands', 'United States', 'Belgium', 'Sweden', 'Switzerland')
x_saving <- c(1.3586, 2.2623000000000002, 4.9821999999999997, 6.5096999999999996,
              7.4812000000000003, 7.5133000000000001, 15.2148, 17.520499999999998)
x_net_worth <- c(93453.919999999998, 81666.570000000007, 69889.619999999995, 78381.529999999999,
                 141395.29999999999, 92969.020000000004, 66090.179999999993, 122379.3)
data <- data.frame(y, x_saving, x_net_worth)

fig1 <- plot_ly(x = ~x_saving, y = ~reorder(y, x_saving), name = 'Household savings, percentage of household disposable income',
              type = 'bar', orientation = 'h',
              marker = list(color = 'rgba(50, 171, 96, 0.6)',
                            line = list(color = 'rgba(50, 171, 96, 1.0)', width = 1))) 
fig1 <- fig1 %>% layout(yaxis = list(showgrid = FALSE, showline = FALSE, showticklabels = TRUE, domain= c(0, 0.85)),
         xaxis = list(zeroline = FALSE, showline = FALSE, showticklabels = TRUE, showgrid = TRUE)) 
fig1 <- fig1 %>% add_annotations(xref = 'x1', yref = 'y',
                  x = x_saving * 2.1 + 3,  y = y,
                  text = paste(round(x_saving, 2), '%'),
                  font = list(family = 'Arial', size = 12, color = 'rgb(50, 171, 96)'),
                  showarrow = FALSE)

fig2 <- plot_ly(x = ~x_net_worth, y = ~reorder(y, x_saving), name = 'Household net worth, Million USD/capita',
              type = 'scatter', mode = 'lines+markers',
              line = list(color = 'rgb(128, 0, 128)')) 
fig2 <- fig2 %>% layout(yaxis = list(showgrid = FALSE, showline = TRUE, showticklabels = FALSE,
                       linecolor = 'rgba(102, 102, 102, 0.8)', linewidth = 2,
                       domain = c(0, 0.85)),
         xaxis = list(zeroline = FALSE, showline = FALSE, showticklabels = TRUE, showgrid = TRUE,
                       side = 'top', dtick = 25000)) 
fig2 <- fig2 %>% add_annotations(xref = 'x2', yref = 'y',
                  x = x_net_worth, y = y,
                  text = paste(x_net_worth, 'M'),
                  font = list(family = 'Arial', size = 12, color = 'rgb(128, 0, 128)'),
                  showarrow = FALSE)

fig <- subplot(fig1, fig2) 
fig <- fig %>% layout(title = 'Household savings & net worth for eight OECD countries',
         legend = list(x = 0.029, y = 1.038,
                       font = list(size = 10)),
         margin = list(l = 100, r = 20, t = 70, b = 70),
         paper_bgcolor = 'rgb(248, 248, 255)',
         plot_bgcolor = 'rgb(248, 248, 255)')
fig <- fig %>% add_annotations(xref = 'paper', yref = 'paper',
                  x = -0.14, y = -0.15,
                  text = paste('OECD (2015), Household savings (indicator), Household net worth (indicator). doi: 10.1787/cfc6f499-en (Accessed on 05 June 2015)'),
                  font = list(family = 'Arial', size = 10, color = 'rgb(150,150,150)'),
                  showarrow = FALSE)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-2b1922f38c5ecbece7a0" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-2b1922f38c5ecbece7a0">{"x":{"data":[{"x":[1.3586,2.2623000000000002,4.9821999999999997,6.5096999999999996,7.4812000000000003,7.5133000000000001,15.2148,17.520499999999998],"y":["Japan","United Kingdom","Canada","Netherlands","United States","Belgium","Sweden","Switzerland"],"orientation":"h","marker":{"color":"rgba(50, 171, 96, 0.6)","line":{"color":"rgba(50, 171, 96, 1.0)","width":1}},"name":"Household savings, percentage of household disposable income","type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[93453.919999999998,81666.570000000007,69889.619999999995,78381.529999999999,141395.29999999999,92969.020000000004,66090.179999999993,122379.3],"y":["Japan","United Kingdom","Canada","Netherlands","United States","Belgium","Sweden","Switzerland"],"mode":"lines+markers","line":{"color":"rgb(128, 0, 128)"},"name":"Household net worth, Million USD/capita","type":"scatter","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x2","yaxis":"y2","frame":null}],"layout":{"xaxis":{"domain":[0,0.47999999999999998],"automargin":true,"zeroline":false,"showline":false,"showticklabels":true,"showgrid":true,"anchor":"y"},"xaxis2":{"domain":[0.52000000000000002,1],"automargin":true,"zeroline":false,"showline":false,"showticklabels":true,"showgrid":true,"side":"top","dtick":25000,"anchor":"y2"},"yaxis2":{"domain":[0,0.84999999999999998],"automargin":true,"showgrid":false,"showline":true,"showticklabels":false,"linecolor":"rgba(102, 102, 102, 0.8)","linewidth":2,"type":"category","categoryorder":"array","categoryarray":["Japan","United Kingdom","Canada","Netherlands","United States","Belgium","Sweden","Switzerland"],"anchor":"x2"},"yaxis":{"domain":[0,0.84999999999999998],"automargin":true,"showgrid":false,"showline":false,"showticklabels":true,"type":"category","categoryorder":"array","categoryarray":["Japan","United Kingdom","Canada","Netherlands","United States","Belgium","Sweden","Switzerland"],"anchor":"x"},"annotations":[{"text":"1.36 %","xref":"x1","yref":"y","x":5.8530600000000002,"y":"Japan","font":{"family":"Arial","size":12,"color":"rgb(50, 171, 96)"},"showarrow":false},{"text":"2.26 %","xref":"x1","yref":"y","x":7.7508300000000006,"y":"United Kingdom","font":{"family":"Arial","size":12,"color":"rgb(50, 171, 96)"},"showarrow":false},{"text":"4.98 %","xref":"x1","yref":"y","x":13.462619999999999,"y":"Canada","font":{"family":"Arial","size":12,"color":"rgb(50, 171, 96)"},"showarrow":false},{"text":"6.51 %","xref":"x1","yref":"y","x":16.670369999999998,"y":"Netherlands","font":{"family":"Arial","size":12,"color":"rgb(50, 171, 96)"},"showarrow":false},{"text":"7.48 %","xref":"x1","yref":"y","x":18.710520000000002,"y":"United States","font":{"family":"Arial","size":12,"color":"rgb(50, 171, 96)"},"showarrow":false},{"text":"7.51 %","xref":"x1","yref":"y","x":18.777930000000001,"y":"Belgium","font":{"family":"Arial","size":12,"color":"rgb(50, 171, 96)"},"showarrow":false},{"text":"15.21 %","xref":"x1","yref":"y","x":34.951080000000005,"y":"Sweden","font":{"family":"Arial","size":12,"color":"rgb(50, 171, 96)"},"showarrow":false},{"text":"17.52 %","xref":"x1","yref":"y","x":39.793050000000001,"y":"Switzerland","font":{"family":"Arial","size":12,"color":"rgb(50, 171, 96)"},"showarrow":false},{"text":"93453.92 M","xref":"x2","yref":"y2","x":93453.919999999998,"y":"Japan","font":{"family":"Arial","size":12,"color":"rgb(128, 0, 128)"},"showarrow":false},{"text":"81666.57 M","xref":"x2","yref":"y2","x":81666.570000000007,"y":"United Kingdom","font":{"family":"Arial","size":12,"color":"rgb(128, 0, 128)"},"showarrow":false},{"text":"69889.62 M","xref":"x2","yref":"y2","x":69889.619999999995,"y":"Canada","font":{"family":"Arial","size":12,"color":"rgb(128, 0, 128)"},"showarrow":false},{"text":"78381.53 M","xref":"x2","yref":"y2","x":78381.529999999999,"y":"Netherlands","font":{"family":"Arial","size":12,"color":"rgb(128, 0, 128)"},"showarrow":false},{"text":"141395.3 M","xref":"x2","yref":"y2","x":141395.29999999999,"y":"United States","font":{"family":"Arial","size":12,"color":"rgb(128, 0, 128)"},"showarrow":false},{"text":"92969.02 M","xref":"x2","yref":"y2","x":92969.020000000004,"y":"Belgium","font":{"family":"Arial","size":12,"color":"rgb(128, 0, 128)"},"showarrow":false},{"text":"66090.18 M","xref":"x2","yref":"y2","x":66090.179999999993,"y":"Sweden","font":{"family":"Arial","size":12,"color":"rgb(128, 0, 128)"},"showarrow":false},{"text":"122379.3 M","xref":"x2","yref":"y2","x":122379.3,"y":"Switzerland","font":{"family":"Arial","size":12,"color":"rgb(128, 0, 128)"},"showarrow":false},{"text":"OECD (2015), Household savings (indicator), Household net worth (indicator). doi: 10.1787/cfc6f499-en (Accessed on 05 June 2015)","xref":"paper","yref":"paper","x":-0.14000000000000001,"y":-0.14999999999999999,"font":{"family":"Arial","size":10,"color":"rgb(150,150,150)"},"showarrow":false},{"text":"OECD (2015), Household savings (indicator), Household net worth (indicator). doi: 10.1787/cfc6f499-en (Accessed on 05 June 2015)","xref":"paper","yref":"paper","x":-0.14000000000000001,"y":-0.14999999999999999,"font":{"family":"Arial","size":10,"color":"rgb(150,150,150)"},"showarrow":false},{"text":"OECD (2015), Household savings (indicator), Household net worth (indicator). doi: 10.1787/cfc6f499-en (Accessed on 05 June 2015)","xref":"paper","yref":"paper","x":-0.14000000000000001,"y":-0.14999999999999999,"font":{"family":"Arial","size":10,"color":"rgb(150,150,150)"},"showarrow":false}],"shapes":[],"images":[],"margin":{"b":70,"l":100,"t":70,"r":20},"hovermode":"closest","showlegend":true,"title":"Household savings & net worth for eight OECD countries","legend":{"x":0.029000000000000001,"y":1.038,"font":{"size":10}},"paper_bgcolor":"rgb(248, 248, 255)","plot_bgcolor":"rgb(248, 248, 255)"},"attrs":{"1f1b4808ae99":{"x":{},"y":{},"orientation":"h","marker":{"color":"rgba(50, 171, 96, 0.6)","line":{"color":"rgba(50, 171, 96, 1.0)","width":1}},"name":"Household savings, percentage of household disposable income","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"1f1b1d27d1c1":{"x":{},"y":{},"mode":"lines+markers","line":{"color":"rgb(128, 0, 128)"},"name":"Household net worth, Million USD/capita","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"subplot":true,"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#Reference

See [https://plotly.com/r/reference/#bar](https://plotly.com/r/reference/#bar) for more information and chart attribute options!
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
