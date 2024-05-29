---
description: How to make a bar chart in R. Examples of grouped, stacked, overlaid,
  and colored bar charts.
display_as: basic
language: r
layout: base
name: Bar Charts
order: 3
output:
  html_document:
    keep_md: true
page_type: example_index
permalink: r/bar-charts/
thumbnail: thumbnail/bar.jpg
---


### Basic Bar Chart


``` r
library(plotly)

fig <- plot_ly(
  x = c("giraffes", "orangutans", "monkeys"),
  y = c(20, 14, 23),
  name = "SF Zoo",
  type = "bar"
)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-7bcc9792b6a3d8e6b24d" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-7bcc9792b6a3d8e6b24d">{"x":{"visdat":{"15004dcce858":["function () ","plotlyVisDat"]},"cur_data":"15004dcce858","attrs":{"15004dcce858":{"x":["giraffes","orangutans","monkeys"],"y":[20,14,23],"name":"SF Zoo","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":[],"type":"category","categoryorder":"array","categoryarray":["giraffes","monkeys","orangutans"]},"yaxis":{"domain":[0,1],"automargin":true,"title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["giraffes","orangutans","monkeys"],"y":[20,14,23],"name":"SF Zoo","type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Grouped Bar Chart


``` r
library(plotly)

Animals <- c("giraffes", "orangutans", "monkeys")
SF_Zoo <- c(20, 14, 23)
LA_Zoo <- c(12, 18, 29)
data <- data.frame(Animals, SF_Zoo, LA_Zoo)

fig <- plot_ly(data, x = ~Animals, y = ~SF_Zoo, type = 'bar', name = 'SF Zoo')
fig <- fig %>% add_trace(y = ~LA_Zoo, name = 'LA Zoo')
fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'group')

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-bbf022143cfa3b3c9e12" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-bbf022143cfa3b3c9e12">{"x":{"visdat":{"15006972293b":["function () ","plotlyVisDat"]},"cur_data":"15006972293b","attrs":{"15006972293b":{"x":{},"y":{},"name":"SF Zoo","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"15006972293b.1":{"x":{},"y":{},"name":"LA Zoo","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"yaxis":{"domain":[0,1],"automargin":true,"title":"Count"},"barmode":"group","xaxis":{"domain":[0,1],"automargin":true,"title":"Animals","type":"category","categoryorder":"array","categoryarray":["giraffes","monkeys","orangutans"]},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["giraffes","orangutans","monkeys"],"y":[20,14,23],"name":"SF Zoo","type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["giraffes","orangutans","monkeys"],"y":[12,18,29],"name":"LA Zoo","type":"bar","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Stacked Bar Chart


``` r
library(plotly)

Animals <- c("giraffes", "orangutans", "monkeys")
SF_Zoo <- c(20, 14, 23)
LA_Zoo <- c(12, 18, 29)
data <- data.frame(Animals, SF_Zoo, LA_Zoo)

fig <- plot_ly(data, x = ~Animals, y = ~SF_Zoo, type = 'bar', name = 'SF Zoo')
fig <- fig %>% add_trace(y = ~LA_Zoo, name = 'LA Zoo')
fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'stack')

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-ff1775cce9b49c220719" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-ff1775cce9b49c220719">{"x":{"visdat":{"1500ef69a2":["function () ","plotlyVisDat"]},"cur_data":"1500ef69a2","attrs":{"1500ef69a2":{"x":{},"y":{},"name":"SF Zoo","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"1500ef69a2.1":{"x":{},"y":{},"name":"LA Zoo","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"yaxis":{"domain":[0,1],"automargin":true,"title":"Count"},"barmode":"stack","xaxis":{"domain":[0,1],"automargin":true,"title":"Animals","type":"category","categoryorder":"array","categoryarray":["giraffes","monkeys","orangutans"]},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["giraffes","orangutans","monkeys"],"y":[20,14,23],"name":"SF Zoo","type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["giraffes","orangutans","monkeys"],"y":[12,18,29],"name":"LA Zoo","type":"bar","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Bar Chart with Hover Text


``` r
library(plotly)

x <- c('Product A', 'Product B', 'Product C')
y <- c(20, 14, 23)
text <- c('27% market share', '24% market share', '19% market share')
data <- data.frame(x, y, text)

fig <- plot_ly(data, x = ~x, y = ~y, type = 'bar', text = text,
        marker = list(color = 'rgb(158,202,225)',
                      line = list(color = 'rgb(8,48,107)',
                      			  width = 1.5)))
fig <- fig %>% layout(title = "January 2013 Sales Report",
         xaxis = list(title = ""),
         yaxis = list(title = ""))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-42db60204e2190d9e5ae" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-42db60204e2190d9e5ae">{"x":{"visdat":{"15003b4d180d":["function () ","plotlyVisDat"]},"cur_data":"15003b4d180d","attrs":{"15003b4d180d":{"x":{},"y":{},"text":["27% market share","24% market share","19% market share"],"marker":{"color":"rgb(158,202,225)","line":{"color":"rgb(8,48,107)","width":1.5}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"January 2013 Sales Report","xaxis":{"domain":[0,1],"automargin":true,"title":"","type":"category","categoryorder":"array","categoryarray":["Product A","Product B","Product C"]},"yaxis":{"domain":[0,1],"automargin":true,"title":""},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["Product A","Product B","Product C"],"y":[20,14,23],"text":["27% market share","24% market share","19% market share"],"marker":{"color":"rgb(158,202,225)","line":{"color":"rgb(8,48,107)","width":1.5}},"type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Bar Chart with Direct Labels


``` r
library(plotly)

x <- c('Product A', 'Product B', 'Product C')
y <- c(20, 14, 23)
text <- c('27% market share', '24% market share', '19% market share')
data <- data.frame(x, y, text)

fig <- plot_ly(data, x = ~x, y = ~y, type = 'bar',
             text = y, textposition = 'auto',
             marker = list(color = 'rgb(158,202,225)',
                           line = list(color = 'rgb(8,48,107)', width = 1.5)))
fig <- fig %>% layout(title = "January 2013 Sales Report",
         xaxis = list(title = ""),
         yaxis = list(title = ""))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-d41d15adfc096ff7b5c2" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-d41d15adfc096ff7b5c2">{"x":{"visdat":{"1500842b45d":["function () ","plotlyVisDat"]},"cur_data":"1500842b45d","attrs":{"1500842b45d":{"x":{},"y":{},"text":[20,14,23],"textposition":"auto","marker":{"color":"rgb(158,202,225)","line":{"color":"rgb(8,48,107)","width":1.5}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"January 2013 Sales Report","xaxis":{"domain":[0,1],"automargin":true,"title":"","type":"category","categoryorder":"array","categoryarray":["Product A","Product B","Product C"]},"yaxis":{"domain":[0,1],"automargin":true,"title":""},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["Product A","Product B","Product C"],"y":[20,14,23],"text":[20,14,23],"textposition":["auto","auto","auto"],"marker":{"color":"rgb(158,202,225)","line":{"color":"rgb(8,48,107)","width":1.5}},"type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Grouped Bar Chart with Direct Labels


``` r
library(plotly)

x <- c('Product A', 'Product B', 'Product C')
y <- c(20, 14, 23)
y2 <- c(16,12,27)
text <- c('27% market share', '24% market share', '19% market share')
data <- data.frame(x, y, y2, text)

fig <- data %>% plot_ly()
fig <- fig %>% add_trace(x = ~x, y = ~y, type = 'bar',
             text = y, textposition = 'auto',
             marker = list(color = 'rgb(158,202,225)',
                           line = list(color = 'rgb(8,48,107)', width = 1.5)))
fig <- fig %>% add_trace(x = ~x, y = ~y2, type = 'bar',
            text = y2, textposition = 'auto',
            marker = list(color = 'rgb(58,200,225)',
                          line = list(color = 'rgb(8,48,107)', width = 1.5)))
fig <- fig %>% layout(title = "January 2013 Sales Report",
         barmode = 'group',
         xaxis = list(title = ""),
         yaxis = list(title = ""))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-ccd8dd15459d9453b7a6" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-ccd8dd15459d9453b7a6">{"x":{"visdat":{"15003640bd4e":["function () ","plotlyVisDat"]},"cur_data":"15003640bd4e","attrs":{"15003640bd4e":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"bar","text":[20,14,23],"textposition":"auto","marker":{"color":"rgb(158,202,225)","line":{"color":"rgb(8,48,107)","width":1.5}},"inherit":true},"15003640bd4e.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"bar","text":[16,12,27],"textposition":"auto","marker":{"color":"rgb(58,200,225)","line":{"color":"rgb(8,48,107)","width":1.5}},"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"January 2013 Sales Report","barmode":"group","xaxis":{"domain":[0,1],"automargin":true,"title":"","type":"category","categoryorder":"array","categoryarray":["Product A","Product B","Product C"]},"yaxis":{"domain":[0,1],"automargin":true,"title":""},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["Product A","Product B","Product C"],"y":[20,14,23],"type":"bar","text":[20,14,23],"textposition":["auto","auto","auto"],"marker":{"color":"rgb(158,202,225)","line":{"color":"rgb(8,48,107)","width":1.5}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Product A","Product B","Product C"],"y":[16,12,27],"type":"bar","text":[16,12,27],"textposition":["auto","auto","auto"],"marker":{"color":"rgb(58,200,225)","line":{"color":"rgb(8,48,107)","width":1.5}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Rotated Bar Chart Labels


``` r
library(plotly)

x <- c('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December')
y1 <- c(20, 14, 25, 16, 18, 22, 19, 15, 12, 16, 14, 17)
y2 <- c(19, 14, 22, 14, 16, 19, 15, 14, 10, 12, 12, 16)
data <- data.frame(x, y1, y2)

#The default order will be alphabetized unless specified as below:
data$x <- factor(data$x, levels = data[["x"]])

fig <- plot_ly(data, x = ~x, y = ~y1, type = 'bar', name = 'Primary Product', marker = list(color = 'rgb(49,130,189)'))
fig <- fig %>% add_trace(y = ~y2, name = 'Secondary Product', marker = list(color = 'rgb(204,204,204)'))
fig <- fig %>% layout(xaxis = list(title = "", tickangle = -45),
         yaxis = list(title = ""),
         margin = list(b = 100),
         barmode = 'group')

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-a11b1f931db61b722280" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-a11b1f931db61b722280">{"x":{"visdat":{"1500718b506":["function () ","plotlyVisDat"]},"cur_data":"1500718b506","attrs":{"1500718b506":{"x":{},"y":{},"marker":{"color":"rgb(49,130,189)"},"name":"Primary Product","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"1500718b506.1":{"x":{},"y":{},"marker":{"color":"rgb(204,204,204)"},"name":"Secondary Product","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true}},"layout":{"margin":{"b":100,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"","tickangle":-45,"type":"category","categoryorder":"array","categoryarray":["January","February","March","April","May","June","July","August","September","October","November","December"]},"yaxis":{"domain":[0,1],"automargin":true,"title":""},"barmode":"group","hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["January","February","March","April","May","June","July","August","September","October","November","December"],"y":[20,14,25,16,18,22,19,15,12,16,14,17],"marker":{"color":"rgb(49,130,189)","line":{"color":"rgba(31,119,180,1)"}},"name":"Primary Product","type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["January","February","March","April","May","June","July","August","September","October","November","December"],"y":[19,14,22,14,16,19,15,14,10,12,12,16],"marker":{"color":"rgb(204,204,204)","line":{"color":"rgba(255,127,14,1)"}},"name":"Secondary Product","type":"bar","error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Customizing Bar Color


``` r
library(plotly)

x <- c('Feature A', 'Feature B', 'Feature C', 'Feature D', 'Feature E')
y <- c(20, 14, 23, 25, 22)
data <- data.frame(x, y)

fig <- plot_ly(data, x = ~x, y = ~y, type = 'bar', color = I("black"))
fig <- fig %>% layout(title = "Features",
         xaxis = list(title = ""),
         yaxis = list(title = ""))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-647f4f8e26cc02ed8859" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-647f4f8e26cc02ed8859">{"x":{"visdat":{"15001e6fc80a":["function () ","plotlyVisDat"]},"cur_data":"15001e6fc80a","attrs":{"15001e6fc80a":{"x":{},"y":{},"color":["black"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Features","xaxis":{"domain":[0,1],"automargin":true,"title":"","type":"category","categoryorder":"array","categoryarray":["Feature A","Feature B","Feature C","Feature D","Feature E"]},"yaxis":{"domain":[0,1],"automargin":true,"title":""},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["Feature A","Feature B","Feature C","Feature D","Feature E"],"y":[20,14,23,25,22],"type":"bar","marker":{"color":"rgba(0,0,0,1)","line":{"color":"rgba(0,0,0,1)"}},"textfont":{"color":"rgba(0,0,0,1)"},"error_y":{"color":"rgba(0,0,0,1)"},"error_x":{"color":"rgba(0,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Customizing Individual Bar Colors


``` r
library(plotly)

x <- c('Feature A', 'Feature B', 'Feature C', 'Feature D', 'Feature E')
y <- c(20, 14, 23, 25, 22)
data <- data.frame(x, y)

fig <- plot_ly(data, x = ~x, y = ~y, type = 'bar',
        marker = list(color = c('rgba(204,204,204,1)', 'rgba(222,45,38,0.8)',
                                'rgba(204,204,204,1)', 'rgba(204,204,204,1)',
                                'rgba(204,204,204,1)')))
fig <- fig %>% layout(title = "Least Used Features",
         xaxis = list(title = ""),
         yaxis = list(title = ""))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-4ffde2e507108a0ddd0d" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-4ffde2e507108a0ddd0d">{"x":{"visdat":{"15003cb03156":["function () ","plotlyVisDat"]},"cur_data":"15003cb03156","attrs":{"15003cb03156":{"x":{},"y":{},"marker":{"color":["rgba(204,204,204,1)","rgba(222,45,38,0.8)","rgba(204,204,204,1)","rgba(204,204,204,1)","rgba(204,204,204,1)"]},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Least Used Features","xaxis":{"domain":[0,1],"automargin":true,"title":"","type":"category","categoryorder":"array","categoryarray":["Feature A","Feature B","Feature C","Feature D","Feature E"]},"yaxis":{"domain":[0,1],"automargin":true,"title":""},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["Feature A","Feature B","Feature C","Feature D","Feature E"],"y":[20,14,23,25,22],"marker":{"color":["rgba(204,204,204,1)","rgba(222,45,38,0.8)","rgba(204,204,204,1)","rgba(204,204,204,1)","rgba(204,204,204,1)"],"line":{"color":"rgba(31,119,180,1)"}},"type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Customizing Individual Bar Widths


``` r
library(plotly)

x= c(1, 2, 3, 5.5, 10)
y= c(10, 8, 6, 4, 2)
width = c(0.8, 0.8, 0.8, 3.5, 4)
data <- data.frame(x, y, width)

fig <- plot_ly(data)
fig <- fig %>% add_bars(
    x= ~x,
    y= ~y,
    width = ~width
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-013f6aacf30a0f9e2c5d" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-013f6aacf30a0f9e2c5d">{"x":{"visdat":{"1500655c2e01":["function () ","plotlyVisDat"]},"cur_data":"1500655c2e01","attrs":{"1500655c2e01":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"bar","width":{},"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"x"},"yaxis":{"domain":[0,1],"automargin":true,"title":"y"},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3,5.5,10],"y":[10,8,6,4,2],"type":"bar","width":[0.80000000000000004,0.80000000000000004,0.80000000000000004,3.5,4],"marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Customizing Individual Bar Base


``` r
library(plotly)

fig <- plot_ly()
fig <- fig %>% add_bars(
    x = c("2016", "2017", "2018"),
    y = c(500,600,700),
    base = c(-500,-600,-700),
    marker = list(
      color = 'red'
    ),
    name = 'expenses'
  )
fig <- fig %>% add_bars(
    x = c("2016", "2017", "2018"),
    y = c(300,400,700),
    base = 0,
    marker = list(
      color = 'blue'
    ),
    name = 'revenue'
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-f011b160b1aeaad4f457" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-f011b160b1aeaad4f457">{"x":{"visdat":{"1500e6dcb03":["function () ","plotlyVisDat"]},"cur_data":"1500e6dcb03","attrs":{"1500e6dcb03":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":["2016","2017","2018"],"y":[500,600,700],"type":"bar","base":[-500,-600,-700],"marker":{"color":"red"},"name":"expenses","inherit":true},"1500e6dcb03.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":["2016","2017","2018"],"y":[300,400,700],"type":"bar","base":0,"marker":{"color":"blue"},"name":"revenue","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":[],"type":"category","categoryorder":"array","categoryarray":["2016","2017","2018"]},"yaxis":{"domain":[0,1],"automargin":true,"title":[]},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["2016","2017","2018"],"y":[500,600,700],"type":"bar","base":[-500,-600,-700],"marker":{"color":"red","line":{"color":"rgba(31,119,180,1)"}},"name":"expenses","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["2016","2017","2018"],"y":[300,400,700],"type":"bar","base":[0,0,0],"marker":{"color":"blue","line":{"color":"rgba(255,127,14,1)"}},"name":"revenue","error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Mapping a Color Variable


``` r
library(plotly)
library(dplyr)

fig <- ggplot2::diamonds
fig <- fig %>% count(cut, clarity)
fig <- fig %>% plot_ly(x = ~cut, y = ~n, color = ~clarity)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-953547b864972870946f" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-953547b864972870946f">{"x":{"visdat":{"150072de1397":["function () ","plotlyVisDat"]},"cur_data":"150072de1397","attrs":{"150072de1397":{"x":{},"y":{},"color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20]}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"cut","type":"category","categoryorder":"array","categoryarray":["Fair","Good","Very Good","Premium","Ideal"]},"yaxis":{"domain":[0,1],"automargin":true,"title":"n"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["Fair","Good","Very Good","Premium","Ideal"],"y":[9,71,268,230,1212],"type":"bar","name":"IF","marker":{"color":"rgba(253,231,37,1)","line":{"color":"rgba(253,231,37,1)"}},"textfont":{"color":"rgba(253,231,37,1)"},"error_y":{"color":"rgba(253,231,37,1)"},"error_x":{"color":"rgba(253,231,37,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Fair","Good","Very Good","Premium","Ideal"],"y":[17,186,789,616,2047],"type":"bar","name":"VVS1","marker":{"color":"rgba(159,218,58,1)","line":{"color":"rgba(159,218,58,1)"}},"textfont":{"color":"rgba(159,218,58,1)"},"error_y":{"color":"rgba(159,218,58,1)"},"error_x":{"color":"rgba(159,218,58,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Fair","Good","Very Good","Premium","Ideal"],"y":[69,286,1235,870,2606],"type":"bar","name":"VVS2","marker":{"color":"rgba(74,193,109,1)","line":{"color":"rgba(74,193,109,1)"}},"textfont":{"color":"rgba(74,193,109,1)"},"error_y":{"color":"rgba(74,193,109,1)"},"error_x":{"color":"rgba(74,193,109,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Fair","Good","Very Good","Premium","Ideal"],"y":[170,648,1775,1989,3589],"type":"bar","name":"VS1","marker":{"color":"rgba(31,161,135,1)","line":{"color":"rgba(31,161,135,1)"}},"textfont":{"color":"rgba(31,161,135,1)"},"error_y":{"color":"rgba(31,161,135,1)"},"error_x":{"color":"rgba(31,161,135,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Fair","Good","Very Good","Premium","Ideal"],"y":[261,978,2591,3357,5071],"type":"bar","name":"VS2","marker":{"color":"rgba(39,127,142,1)","line":{"color":"rgba(39,127,142,1)"}},"textfont":{"color":"rgba(39,127,142,1)"},"error_y":{"color":"rgba(39,127,142,1)"},"error_x":{"color":"rgba(39,127,142,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Fair","Good","Very Good","Premium","Ideal"],"y":[408,1560,3240,3575,4282],"type":"bar","name":"SI1","marker":{"color":"rgba(54,92,141,1)","line":{"color":"rgba(54,92,141,1)"}},"textfont":{"color":"rgba(54,92,141,1)"},"error_y":{"color":"rgba(54,92,141,1)"},"error_x":{"color":"rgba(54,92,141,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Fair","Good","Very Good","Premium","Ideal"],"y":[466,1081,2100,2949,2598],"type":"bar","name":"SI2","marker":{"color":"rgba(70,51,126,1)","line":{"color":"rgba(70,51,126,1)"}},"textfont":{"color":"rgba(70,51,126,1)"},"error_y":{"color":"rgba(70,51,126,1)"},"error_x":{"color":"rgba(70,51,126,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Fair","Good","Very Good","Premium","Ideal"],"y":[210,96,84,205,146],"type":"bar","name":"I1","marker":{"color":"rgba(68,1,84,1)","line":{"color":"rgba(68,1,84,1)"}},"textfont":{"color":"rgba(68,1,84,1)"},"error_y":{"color":"rgba(68,1,84,1)"},"error_x":{"color":"rgba(68,1,84,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Colored and Styled Bar Chart


``` r
library(plotly)

x <- c(1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012)
roW <- c(219, 146, 112, 127, 124, 180, 236, 207, 236, 263, 350, 430, 474, 526, 488, 537, 500, 439)
China <- c(16, 13, 10, 11, 28, 37, 43, 55, 56, 88, 105, 156, 270, 299, 340, 403, 549, 499)
data <- data.frame(x, roW, China)

fig <- plot_ly(data, x = ~x, y = ~roW, type = 'bar', name = 'Rest of the World',
        marker = list(color = 'rgb(55, 83, 109)'))
fig <- fig %>% add_trace(y = ~China, name = 'China', marker = list(color = 'rgb(26, 118, 255)'))
fig <- fig %>% layout(title = 'US Export of Plastic Scrap',
         xaxis = list(
           title = "",
           tickfont = list(
             size = 14,
             color = 'rgb(107, 107, 107)')),
         yaxis = list(
           title = 'USD (millions)',
           titlefont = list(
             size = 16,
             color = 'rgb(107, 107, 107)'),
           tickfont = list(
             size = 14,
             color = 'rgb(107, 107, 107)')),
         legend = list(x = 0, y = 1, bgcolor = 'rgba(255, 255, 255, 0)', bordercolor = 'rgba(255, 255, 255, 0)'),
         barmode = 'group', bargap = 0.15, bargroupgap = 0.1)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-7ca52b6e6235ee87a06e" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-7ca52b6e6235ee87a06e">{"x":{"visdat":{"1500783afe5":["function () ","plotlyVisDat"]},"cur_data":"1500783afe5","attrs":{"1500783afe5":{"x":{},"y":{},"marker":{"color":"rgb(55, 83, 109)"},"name":"Rest of the World","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"1500783afe5.1":{"x":{},"y":{},"marker":{"color":"rgb(26, 118, 255)"},"name":"China","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"US Export of Plastic Scrap","xaxis":{"domain":[0,1],"automargin":true,"title":"","tickfont":{"size":14,"color":"rgb(107, 107, 107)"}},"yaxis":{"domain":[0,1],"automargin":true,"title":"USD (millions)","titlefont":{"size":16,"color":"rgb(107, 107, 107)"},"tickfont":{"size":14,"color":"rgb(107, 107, 107)"}},"legend":{"x":0,"y":1,"bgcolor":"rgba(255, 255, 255, 0)","bordercolor":"rgba(255, 255, 255, 0)"},"barmode":"group","bargap":0.14999999999999999,"bargroupgap":0.10000000000000001,"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012],"y":[219,146,112,127,124,180,236,207,236,263,350,430,474,526,488,537,500,439],"marker":{"color":"rgb(55, 83, 109)","line":{"color":"rgba(31,119,180,1)"}},"name":"Rest of the World","type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012],"y":[16,13,10,11,28,37,43,55,56,88,105,156,270,299,340,403,549,499],"marker":{"color":"rgb(26, 118, 255)","line":{"color":"rgba(255,127,14,1)"}},"name":"China","type":"bar","error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Waterfall Bar Chart


``` r
library(plotly)

x <- c('Product<br>Revenue', 'Services<br>Revenue', 'Total<br>Revenue', 'Fixed<br>Costs', 'Variable<br>Costs', 'Total<br>Costs', 'Total')
y <- c(400, 660, 660, 590, 400, 400, 340)
base <- c(0, 430, 0, 570, 370, 370, 0)
revenue <- c(430, 260, 690, 0, 0, 0, 0)
costs <- c(0, 0, 0, 120, 200, 320, 0)
profit <- c(0, 0, 0, 0, 0, 0, 370)
text <- c('$430K', '$260K', '$690K', '$-120K', '$-200K', '$-320K', '$370K')
data <- data.frame(x, base, revenue, costs, profit, text)

#The default order will be alphabetized unless specified as below:
data$x <- factor(data$x, levels = data[["x"]])

fig <- plot_ly(data, x = ~x, y = ~base, type = 'bar', marker = list(color = 'rgba(1,1,1, 0.0)'))
fig <- fig %>% add_trace(y = ~revenue, marker = list(color = 'rgba(55, 128, 191, 0.7)',
                                        line = list(color = 'rgba(55, 128, 191, 0.7)',
                                                    width = 2)))
fig <- fig %>% add_trace(y = ~costs, marker = list(color = 'rgba(219, 64, 82, 0.7)',
                                      line = list(color = 'rgba(219, 64, 82, 1.0)',
                                                  width = 2)))
fig <- fig %>% add_trace(y = ~profit, marker = list(color = 'rgba(50, 171, 96, 0.7)',
                                      line = list(color = 'rgba(50, 171, 96, 1.0)',
                                                  width = 2)))
fig <- fig %>% layout(title = 'Annual Profit - 2015',
         xaxis = list(title = ""),
         yaxis = list(title = ""),
         barmode = 'stack',
         paper_bgcolor = 'rgba(245, 246, 249, 1)',
         plot_bgcolor = 'rgba(245, 246, 249, 1)',
         showlegend = FALSE)
fig <- fig %>% add_annotations(text = text,
                  x = x,
                  y = y,
                  xref = "x",
                  yref = "y",
                  font = list(family = 'Arial',
                              size = 14,
                              color = 'rgba(245, 246, 249, 1)'),
                  showarrow = FALSE)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-c006afc547f00b6c94b7" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-c006afc547f00b6c94b7">{"x":{"visdat":{"15001e652d05":["function () ","plotlyVisDat"]},"cur_data":"15001e652d05","attrs":{"15001e652d05":{"x":{},"y":{},"marker":{"color":"rgba(1,1,1, 0.0)"},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"15001e652d05.1":{"x":{},"y":{},"marker":{"color":"rgba(55, 128, 191, 0.7)","line":{"color":"rgba(55, 128, 191, 0.7)","width":2}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true},"15001e652d05.2":{"x":{},"y":{},"marker":{"color":"rgba(219, 64, 82, 0.7)","line":{"color":"rgba(219, 64, 82, 1.0)","width":2}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true},"15001e652d05.3":{"x":{},"y":{},"marker":{"color":"rgba(50, 171, 96, 0.7)","line":{"color":"rgba(50, 171, 96, 1.0)","width":2}},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Annual Profit - 2015","xaxis":{"domain":[0,1],"automargin":true,"title":"","type":"category","categoryorder":"array","categoryarray":["Product<br>Revenue","Services<br>Revenue","Total<br>Revenue","Fixed<br>Costs","Variable<br>Costs","Total<br>Costs","Total"]},"yaxis":{"domain":[0,1],"automargin":true,"title":""},"barmode":"stack","paper_bgcolor":"rgba(245, 246, 249, 1)","plot_bgcolor":"rgba(245, 246, 249, 1)","showlegend":false,"annotations":[{"text":"$430K","x":"Product<br>Revenue","y":400,"xref":"x","yref":"y","font":{"family":"Arial","size":14,"color":"rgba(245, 246, 249, 1)"},"showarrow":false},{"text":"$260K","x":"Services<br>Revenue","y":660,"xref":"x","yref":"y","font":{"family":"Arial","size":14,"color":"rgba(245, 246, 249, 1)"},"showarrow":false},{"text":"$690K","x":"Total<br>Revenue","y":660,"xref":"x","yref":"y","font":{"family":"Arial","size":14,"color":"rgba(245, 246, 249, 1)"},"showarrow":false},{"text":"$-120K","x":"Fixed<br>Costs","y":590,"xref":"x","yref":"y","font":{"family":"Arial","size":14,"color":"rgba(245, 246, 249, 1)"},"showarrow":false},{"text":"$-200K","x":"Variable<br>Costs","y":400,"xref":"x","yref":"y","font":{"family":"Arial","size":14,"color":"rgba(245, 246, 249, 1)"},"showarrow":false},{"text":"$-320K","x":"Total<br>Costs","y":400,"xref":"x","yref":"y","font":{"family":"Arial","size":14,"color":"rgba(245, 246, 249, 1)"},"showarrow":false},{"text":"$370K","x":"Total","y":340,"xref":"x","yref":"y","font":{"family":"Arial","size":14,"color":"rgba(245, 246, 249, 1)"},"showarrow":false}],"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["Product<br>Revenue","Services<br>Revenue","Total<br>Revenue","Fixed<br>Costs","Variable<br>Costs","Total<br>Costs","Total"],"y":[0,430,0,570,370,370,0],"marker":{"color":"rgba(1,1,1, 0.0)","line":{"color":"rgba(31,119,180,1)"}},"type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Product<br>Revenue","Services<br>Revenue","Total<br>Revenue","Fixed<br>Costs","Variable<br>Costs","Total<br>Costs","Total"],"y":[430,260,690,0,0,0,0],"marker":{"color":"rgba(55, 128, 191, 0.7)","line":{"color":"rgba(55, 128, 191, 0.7)","width":2}},"type":"bar","error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Product<br>Revenue","Services<br>Revenue","Total<br>Revenue","Fixed<br>Costs","Variable<br>Costs","Total<br>Costs","Total"],"y":[0,0,0,120,200,320,0],"marker":{"color":"rgba(219, 64, 82, 0.7)","line":{"color":"rgba(219, 64, 82, 1.0)","width":2}},"type":"bar","error_y":{"color":"rgba(44,160,44,1)"},"error_x":{"color":"rgba(44,160,44,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["Product<br>Revenue","Services<br>Revenue","Total<br>Revenue","Fixed<br>Costs","Variable<br>Costs","Total<br>Costs","Total"],"y":[0,0,0,0,0,0,370],"marker":{"color":"rgba(50, 171, 96, 0.7)","line":{"color":"rgba(50, 171, 96, 1.0)","width":2}},"type":"bar","error_y":{"color":"rgba(214,39,40,1)"},"error_x":{"color":"rgba(214,39,40,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Horizontal Bar Chart

See examples of horizontal bar charts [here](https://plotly.com/r/horizontal-bar-charts/).

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
