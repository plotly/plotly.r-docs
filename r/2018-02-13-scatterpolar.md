---
description: How to create Polar Charts in R with Plotly.
display_as: scientific
language: r
layout: base
name: Polar Charts
order: 10
output:
  html_document:
    keep_md: true
page_type: u-guide
permalink: r/polar-chart/
thumbnail: thumbnail/polar.gif
---


#### Polar Charts 1.0

Looking for the old polar chart docs? See [legacy polar charts](https://plotly.com/r/legacy-polar-chart/)

#### Basic Polar Charts


``` r
library(plotly)

fig <- plot_ly(
  type = 'scatterpolar',
  r = c(0,1,2,2),
  theta = c(0,45,90,0),
  mode = 'markers'
)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-31935d751720781e62ff" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-31935d751720781e62ff">{"x":{"visdat":{"25e04c4d64f9":["function () ","plotlyVisDat"]},"cur_data":"25e04c4d64f9","attrs":{"25e04c4d64f9":{"r":[0,1,2,2],"theta":[0,45,90,0],"mode":"markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"r":[0,1,2,2],"theta":[0,45,90,0],"mode":"markers","type":"scatterpolar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Line Polar Charts


``` r
library(plotly)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/polar_dataset.csv")

fig <- plot_ly(
  df,
  type = 'scatterpolar',
  mode = 'lines'
  ) 
fig <- fig %>%
  add_trace(
    r = ~x1,
    theta = ~y,
    name = 'Figure8',
    line = list(
      color = 'peru'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = ~x2,
    theta = ~y,
    name = 'Cardioid',
    line = list(
      color = 'darkviolet'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = ~x3,
    theta = ~y,
    name = 'Hypercardioid',
    line = list(
      color = 'deepskyblue'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = ~x4,
    theta = ~y,
    name = 'Subcardioid',
    line = list(
      color = 'orangered'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = ~x5,
    theta = ~y,
    name = 'Supercardioid',
    line = list(
      color = 'green'
    )
  ) 

fig <- fig %>%
  layout(
    title = 'Mic Patterns',
    font = list(
      family = 'Arial',
      size = 12,
      color = '#000'
    ),
    showlegend = F
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-de2cc573a71e3da7c183" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-de2cc573a71e3da7c183">{"x":{"visdat":{"25e07277c722":["function () ","plotlyVisDat"]},"cur_data":"25e07277c722","attrs":{"25e07277c722":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar"},"25e07277c722.1":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":{},"theta":{},"name":"Figure8","line":{"color":"peru"},"inherit":true},"25e07277c722.2":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":{},"theta":{},"name":"Cardioid","line":{"color":"darkviolet"},"inherit":true},"25e07277c722.3":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":{},"theta":{},"name":"Hypercardioid","line":{"color":"deepskyblue"},"inherit":true},"25e07277c722.4":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":{},"theta":{},"name":"Subcardioid","line":{"color":"orangered"},"inherit":true},"25e07277c722.5":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":{},"theta":{},"name":"Supercardioid","line":{"color":"green"},"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Mic Patterns","font":{"family":"Arial","size":12,"color":"#000"},"showlegend":false,"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"mode":"lines","type":"scatterpolar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"frame":null},{"mode":"lines","type":"scatterpolar","r":[1,0.995,0.97799999999999998,0.95099999999999996,0.91400000000000003,0.86599999999999999,0.80900000000000005,0.74299999999999999,0.66900000000000004,0.58799999999999997,0.5,0.40699999999999997,0.309,0.20799999999999999,0.105,0.105,0.20799999999999999,0.309,0.40699999999999997,0.5,0.58799999999999997,0.66900000000000004,0.74299999999999999,0.80900000000000005,0.86599999999999999,0.91400000000000003,0.95099999999999996,0.97799999999999998,0.995,1,0.995,0.97799999999999998,0.95099999999999996,0.91400000000000003,0.86599999999999999,0.80900000000000005,0.74299999999999999,0.66900000000000004,0.58799999999999997,0.5,0.40699999999999997,0.309,0.20799999999999999,0.105,0,0.105,0.20799999999999999,0.309,0.40699999999999997,0.5,0.58799999999999997,0.66900000000000004,0.74299999999999999,0.80900000000000005,0.86599999999999999,0.91400000000000003,0.95099999999999996,0.97799999999999998,0.995,1,1],"theta":[0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,216,222,228,234,240,246,252,258,264,270,276,282,288,294,300,306,312,318,324,330,336,342,348,354,360],"name":"Figure8","line":{"color":"peru"},"marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"frame":null},{"mode":"lines","type":"scatterpolar","r":[1,0.997,0.98899999999999999,0.97599999999999998,0.95699999999999996,0.93300000000000005,0.90500000000000003,0.872,0.83499999999999996,0.79400000000000004,0.75,0.70299999999999996,0.65500000000000003,0.60399999999999998,0.55200000000000005,0.5,0.44800000000000001,0.39600000000000002,0.34499999999999997,0.29699999999999999,0.25,0.20599999999999999,0.16500000000000001,0.128,0.095000000000000001,0.067000000000000004,0.042999999999999997,0.024,0.010999999999999999,0.0030000000000000001,0,0.0030000000000000001,0.010999999999999999,0.024,0.042999999999999997,0.067000000000000004,0.095000000000000001,0.128,0.16500000000000001,0.20599999999999999,0.25,0.29699999999999999,0.34499999999999997,0.39600000000000002,0.44800000000000001,0.5,0.55200000000000005,0.60399999999999998,0.65500000000000003,0.70299999999999996,0.75,0.79400000000000004,0.83499999999999996,0.872,0.90500000000000003,0.93300000000000005,0.95699999999999996,0.97599999999999998,0.98899999999999999,0.997,1],"theta":[0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,216,222,228,234,240,246,252,258,264,270,276,282,288,294,300,306,312,318,324,330,336,342,348,354,360],"name":"Cardioid","line":{"color":"darkviolet"},"marker":{"color":"rgba(44,160,44,1)","line":{"color":"rgba(44,160,44,1)"}},"frame":null},{"mode":"lines","type":"scatterpolar","r":[1,0.996,0.98399999999999999,0.96299999999999997,0.93500000000000005,0.90000000000000002,0.85699999999999998,0.80700000000000005,0.752,0.69099999999999995,0.625,0.55500000000000005,0.48199999999999998,0.40600000000000003,0.32800000000000001,0.25,0.17199999999999999,0.094,0.017999999999999999,0.055,0.125,0.191,0.252,0.307,0.35699999999999998,0.40000000000000002,0.435,0.46300000000000002,0.48399999999999999,0.496,0.5,0.496,0.48399999999999999,0.46300000000000002,0.435,0.40000000000000002,0.35699999999999998,0.307,0.252,0.191,0.125,0.055,0.017999999999999999,0.094,0.17199999999999999,0.25,0.32800000000000001,0.40600000000000003,0.48199999999999998,0.55500000000000005,0.625,0.69099999999999995,0.752,0.80700000000000005,0.85699999999999998,0.90000000000000002,0.93500000000000005,0.96299999999999997,0.98399999999999999,0.996,1],"theta":[0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,216,222,228,234,240,246,252,258,264,270,276,282,288,294,300,306,312,318,324,330,336,342,348,354,360],"name":"Hypercardioid","line":{"color":"deepskyblue"},"marker":{"color":"rgba(214,39,40,1)","line":{"color":"rgba(214,39,40,1)"}},"frame":null},{"mode":"lines","type":"scatterpolar","r":[1,0.998,0.99299999999999999,0.98499999999999999,0.97399999999999998,0.95999999999999996,0.94299999999999995,0.92300000000000004,0.90100000000000002,0.876,0.84999999999999998,0.82199999999999995,0.79300000000000004,0.76200000000000001,0.73099999999999998,0.69999999999999996,0.66900000000000004,0.63800000000000001,0.60699999999999998,0.57799999999999996,0.55000000000000004,0.52400000000000002,0.499,0.47699999999999998,0.45700000000000002,0.44,0.42599999999999999,0.41499999999999998,0.40699999999999997,0.40200000000000002,0.40000000000000002,0.40200000000000002,0.40699999999999997,0.41499999999999998,0.42599999999999999,0.44,0.45700000000000002,0.47699999999999998,0.499,0.52400000000000002,0.55000000000000004,0.57799999999999996,0.60699999999999998,0.63800000000000001,0.66900000000000004,0.69999999999999996,0.73099999999999998,0.76200000000000001,0.79300000000000004,0.82199999999999995,0.84999999999999998,0.876,0.90100000000000002,0.92300000000000004,0.94299999999999995,0.95999999999999996,0.97399999999999998,0.98499999999999999,0.99299999999999999,0.998,1],"theta":[0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,216,222,228,234,240,246,252,258,264,270,276,282,288,294,300,306,312,318,324,330,336,342,348,354,360],"name":"Subcardioid","line":{"color":"orangered"},"marker":{"color":"rgba(148,103,189,1)","line":{"color":"rgba(148,103,189,1)"}},"frame":null},{"mode":"lines","type":"scatterpolar","r":[1,0.997,0.98599999999999999,0.96899999999999997,0.94599999999999995,0.91600000000000004,0.88,0.83799999999999997,0.79200000000000004,0.73999999999999999,0.68500000000000005,0.626,0.56499999999999995,0.501,0.436,0.37,0.30399999999999999,0.23899999999999999,0.17499999999999999,0.114,0.055,0,0.051999999999999998,0.098000000000000004,0.14000000000000001,0.17599999999999999,0.20599999999999999,0.22900000000000001,0.246,0.25700000000000001,0.26000000000000001,0.25700000000000001,0.246,0.22900000000000001,0.20599999999999999,0.17599999999999999,0.14000000000000001,0.098000000000000004,0.051999999999999998,0,0.055,0.114,0.17499999999999999,0.23899999999999999,0.30399999999999999,0.37,0.436,0.501,0.56499999999999995,0.626,0.68500000000000005,0.73999999999999999,0.79200000000000004,0.83799999999999997,0.88,0.91600000000000004,0.94599999999999995,0.96899999999999997,0.98599999999999999,0.997,1],"theta":[0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,216,222,228,234,240,246,252,258,264,270,276,282,288,294,300,306,312,318,324,330,336,342,348,354,360],"name":"Supercardioid","line":{"color":"green"},"marker":{"color":"rgba(140,86,75,1)","line":{"color":"rgba(140,86,75,1)"}},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Area Polar Charts


``` r
library(plotly)

fig <- plot_ly(
    type = 'scatterpolar',
    mode = 'lines'
  ) 
fig <- fig %>%
  add_trace(
    r = c(0, 1.5, 1.5, 0, 2.5, 2.5, 0),
    theta = c(0, 10, 25, 0, 205, 215, 0),
    fill = 'toself',
    fillcolor = '#709Bff',
    line = list(
      color = 'black'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = c(0, 3.5, 3.5, 0),
    theta = c(0, 55, 75, 0),
    fill = 'toself',
    fillcolor = '#E4FF87',
    line = list(
      color = 'black'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = c(0, 4.5, 4.5, 0, 4.5, 4.5, 0),
    theta = c(0, 100, 120, 0, 305, 320, 0),
    fill = 'toself',
    fillcolor = '#FFAA70',
    line = list(
      color = 'black'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = c(0, 4, 4, 0),
    theta = c(0, 165, 195, 0),
    fill = 'toself',
    fillcolor = '#FFDF70',
    line = list(
      color = 'black'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = c(0, 3, 3, 0),
    theta = c(0, 262.5, 277.5, 0),
    fill = 'toself',
    fillcolor = '#B6FFB4',
    line = list(
      color = 'black'
    )
  ) 
fig <- fig %>%
  layout(
    polar = list(
      radialaxis = list(
        visible = T,
        range = c(0,5)
      )
    ),
    showlegend = F
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-94e1aafe73c9732307f7" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-94e1aafe73c9732307f7">{"x":{"visdat":{"25e06f121131":["function () ","plotlyVisDat"]},"cur_data":"25e06f121131","attrs":{"25e06f121131":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar"},"25e06f121131.1":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[0,1.5,1.5,0,2.5,2.5,0],"theta":[0,10,25,0,205,215,0],"fill":"toself","fillcolor":"#709Bff","line":{"color":"black"},"inherit":true},"25e06f121131.2":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[0,3.5,3.5,0],"theta":[0,55,75,0],"fill":"toself","fillcolor":"#E4FF87","line":{"color":"black"},"inherit":true},"25e06f121131.3":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[0,4.5,4.5,0,4.5,4.5,0],"theta":[0,100,120,0,305,320,0],"fill":"toself","fillcolor":"#FFAA70","line":{"color":"black"},"inherit":true},"25e06f121131.4":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[0,4,4,0],"theta":[0,165,195,0],"fill":"toself","fillcolor":"#FFDF70","line":{"color":"black"},"inherit":true},"25e06f121131.5":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[0,3,3,0],"theta":[0,262.5,277.5,0],"fill":"toself","fillcolor":"#B6FFB4","line":{"color":"black"},"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"polar":{"radialaxis":{"visible":true,"range":[0,5]}},"showlegend":false,"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"mode":"lines","type":"scatterpolar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"frame":null},{"fillcolor":"#709Bff","mode":"lines","type":"scatterpolar","r":[0,1.5,1.5,0,2.5,2.5,0],"theta":[0,10,25,0,205,215,0],"fill":"toself","line":{"color":"black"},"name":"#709Bff","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"frame":null},{"fillcolor":"#E4FF87","mode":"lines","type":"scatterpolar","r":[0,3.5,3.5,0],"theta":[0,55,75,0],"fill":"toself","line":{"color":"black"},"name":"#E4FF87","marker":{"color":"rgba(44,160,44,1)","line":{"color":"rgba(44,160,44,1)"}},"frame":null},{"fillcolor":"#FFAA70","mode":"lines","type":"scatterpolar","r":[0,4.5,4.5,0,4.5,4.5,0],"theta":[0,100,120,0,305,320,0],"fill":"toself","line":{"color":"black"},"name":"#FFAA70","marker":{"color":"rgba(214,39,40,1)","line":{"color":"rgba(214,39,40,1)"}},"frame":null},{"fillcolor":"#FFDF70","mode":"lines","type":"scatterpolar","r":[0,4,4,0],"theta":[0,165,195,0],"fill":"toself","line":{"color":"black"},"name":"#FFDF70","marker":{"color":"rgba(148,103,189,1)","line":{"color":"rgba(148,103,189,1)"}},"frame":null},{"fillcolor":"#B6FFB4","mode":"lines","type":"scatterpolar","r":[0,3,3,0],"theta":[0,262.5,277.5,0],"fill":"toself","line":{"color":"black"},"name":"#B6FFB4","marker":{"color":"rgba(140,86,75,1)","line":{"color":"rgba(140,86,75,1)"}},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Categorical Polar Charts


``` r
library(plotly)

fig <- plot_ly(
    type = 'scatterpolar',
    mode = 'lines'
  ) 
fig <- fig %>%
  add_trace(
    r = c(5, 4, 2, 4, 5),
    theta = c("a", "b", "c", "d", "a"),
    name = 'angular categories',
    fill = 'toself'
  ) 
fig <- fig %>%
  add_trace(
    r = c("a", "b", "c", "d", "b", "f", "a"),
    theta = c(1, 4, 2, 1.5, 1.5, 6, 5),
    thetaunit = 'radians',
    name = 'radial categories',
    fill = 'toself',
    subplot = 'polar2'
  ) 
fig <- fig %>%
  add_trace(
    r = c(5, 4, 2, 4, 5),
    theta = c("a", "b", "c", "d", "a"),
    name = 'angular categories (w/ categoryarray)',
    fill = 'toself',
    subplot = 'polar3'
  ) 
fig <- fig %>%
  add_trace(
    r = c("a", "b", "c", "d", "b", "f", "a", "a"),
    theta = c(45, 90, 180, 200, 300, 15, 20, 45),
    name = 'radial categories (w/ category descending)',
    fill = 'toself',
    subplot = 'polar4'
  ) 
fig <- fig %>%
  layout(
    polar = list(
      domain = list(
        x = c(0,0.46),
        y = c(0.56,1)
      ),
      radialaxis = list(
        angle = 45
      ),
      angularaxis = list(
        direction = 'clockwise',
        period = 6
      )
    ),
    polar2 = list(
      domain = list(
        x = c(0,0.46),
        y = c(0,0.44)
      ),
      radialaxis = list(
        angle = 180,
        tickangle = -180
      )
    ),
    polar3 = list(
      domain = list(
        x = c(0.54,1),
        y = c(0.56,1)
      ),
      sector = c(150,400),
      radialaxis = list(
        angle = -45
      ),
      angularaxis = list(
        categoryarray = c("d", "a", "c", "b")
      )
    ),
    polar4 = list(
      domain = list(
        x = c(0.54,1),
        y = c(0,0.44)
      ),
      radialaxis = list(
        categoryorder = "category descending"
      ),
      angularaxis = list(
        thetaunit= "radians",
        dtick = 0.3141592653589793
      )
    )
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-bbe3a01d99275134a9a8" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-bbe3a01d99275134a9a8">{"x":{"visdat":{"25e077611e07":["function () ","plotlyVisDat"]},"cur_data":"25e077611e07","attrs":{"25e077611e07":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar"},"25e077611e07.1":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[5,4,2,4,5],"theta":["a","b","c","d","a"],"name":"angular categories","fill":"toself","inherit":true},"25e077611e07.2":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":["a","b","c","d","b","f","a"],"theta":[1,4,2,1.5,1.5,6,5],"thetaunit":"radians","name":"radial categories","fill":"toself","subplot":"polar2","inherit":true},"25e077611e07.3":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[5,4,2,4,5],"theta":["a","b","c","d","a"],"name":"angular categories (w/ categoryarray)","fill":"toself","subplot":"polar3","inherit":true},"25e077611e07.4":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":["a","b","c","d","b","f","a","a"],"theta":[45,90,180,200,300,15,20,45],"name":"radial categories (w/ category descending)","fill":"toself","subplot":"polar4","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"polar":{"domain":{"x":[0,0.46000000000000002],"y":[0.56000000000000005,1]},"radialaxis":{"angle":45},"angularaxis":{"direction":"clockwise","period":6}},"polar2":{"domain":{"x":[0,0.46000000000000002],"y":[0,0.44]},"radialaxis":{"angle":180,"tickangle":-180}},"polar3":{"domain":{"x":[0.54000000000000004,1],"y":[0.56000000000000005,1]},"sector":[150,400],"radialaxis":{"angle":-45},"angularaxis":{"categoryarray":["d","a","c","b"]}},"polar4":{"domain":{"x":[0.54000000000000004,1],"y":[0,0.44]},"radialaxis":{"categoryorder":"category descending"},"angularaxis":{"thetaunit":"radians","dtick":0.31415926535897931}},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"mode":"lines","type":"scatterpolar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"frame":null},{"fillcolor":"rgba(255,127,14,0.5)","mode":"lines","type":"scatterpolar","r":[5,4,2,4,5],"theta":["a","b","c","d","a"],"name":"angular categories","fill":"toself","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"line":{"color":"rgba(255,127,14,1)"},"frame":null},{"fillcolor":"rgba(44,160,44,0.5)","mode":"lines","type":"scatterpolar","r":["a","b","c","d","b","f","a"],"theta":[1,4,2,1.5,1.5,6,5],"thetaunit":"radians","name":"radial categories","fill":"toself","subplot":"polar2","marker":{"color":"rgba(44,160,44,1)","line":{"color":"rgba(44,160,44,1)"}},"line":{"color":"rgba(44,160,44,1)"},"frame":null},{"fillcolor":"rgba(214,39,40,0.5)","mode":"lines","type":"scatterpolar","r":[5,4,2,4,5],"theta":["a","b","c","d","a"],"name":"angular categories (w/ categoryarray)","fill":"toself","subplot":"polar3","marker":{"color":"rgba(214,39,40,1)","line":{"color":"rgba(214,39,40,1)"}},"line":{"color":"rgba(214,39,40,1)"},"frame":null},{"fillcolor":"rgba(148,103,189,0.5)","mode":"lines","type":"scatterpolar","r":["a","b","c","d","b","f","a","a"],"theta":[45,90,180,200,300,15,20,45],"name":"radial categories (w/ category descending)","fill":"toself","subplot":"polar4","marker":{"color":"rgba(148,103,189,1)","line":{"color":"rgba(148,103,189,1)"}},"line":{"color":"rgba(148,103,189,1)"},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Polar Charts Directions


``` r
library(plotly)

fig <- plot_ly(
    type = 'scatterpolar',
    mode = "lines+markers"
  ) 
fig <- fig %>%
  add_trace(
    r = c(1,2,3,4,5),
    theta = c(0,90,180,360,0),
    line = list(
      color = "#ff66ab"
    ),
    marker = list(
      color = "#8090c7",
      symbol = 'square',
      size = 8
    ),
    text = "sector: 135->225<br>rotation: 90<br>direction: counterclockwise"
  ) 
fig <- fig %>%
  add_trace(
    r = c(1,2,3,4,5),
    theta = c(0,90,180,360,0),
    line = list(
      color = "#ff66ab"
    ),
    marker = list(
      color = "#8090c7",
      symbol = 'square',
      size = 8
    ),
    text = "sector: 135->225<br>rotation: 90<br>direction: counterclockwise",
    subplot = 'polar2'
  ) 
fig <- fig %>%
  layout(
    polar = list(
      domain = list(
        x = c(0,0.4),
        y = c(0,1)
      ),
      radialaxis = list(
        tickfont = list(
          size = 8
        )
      ),
      angularaxis = list(
        tickfont = list(
          size = 8
        ),
        rotation = 90,
        direction = 'counterclockwise'
      )
    ),
    polar2 = list(
      domain = list(
        x = c(0.6,1),
        y = c(0,1)
      ),
      radialaxis = list(
        tickfont = list(
          size = 8
        )
      ),
      angularaxis = list(
        tickfont = list(
          size = 8
        ),
        rotation = 90,
        direction = 'clockwise'
      )
    ),
    showlegend = F
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-cd67486181a2a190abee" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-cd67486181a2a190abee">{"x":{"visdat":{"25e05c4c5bbe":["function () ","plotlyVisDat"]},"cur_data":"25e05c4c5bbe","attrs":{"25e05c4c5bbe":{"mode":"lines+markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar"},"25e05c4c5bbe.1":{"mode":"lines+markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[1,2,3,4,5],"theta":[0,90,180,360,0],"line":{"color":"#ff66ab"},"marker":{"color":"#8090c7","symbol":"square","size":8},"text":"sector: 135->225<br>rotation: 90<br>direction: counterclockwise","inherit":true},"25e05c4c5bbe.2":{"mode":"lines+markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[1,2,3,4,5],"theta":[0,90,180,360,0],"line":{"color":"#ff66ab"},"marker":{"color":"#8090c7","symbol":"square","size":8},"text":"sector: 135->225<br>rotation: 90<br>direction: counterclockwise","subplot":"polar2","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"polar":{"domain":{"x":[0,0.40000000000000002],"y":[0,1]},"radialaxis":{"tickfont":{"size":8}},"angularaxis":{"tickfont":{"size":8},"rotation":90,"direction":"counterclockwise"}},"polar2":{"domain":{"x":[0.59999999999999998,1],"y":[0,1]},"radialaxis":{"tickfont":{"size":8}},"angularaxis":{"tickfont":{"size":8},"rotation":90,"direction":"clockwise"}},"showlegend":false,"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"mode":"lines+markers","type":"scatterpolar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"frame":null},{"mode":"lines+markers","type":"scatterpolar","r":[1,2,3,4,5],"theta":[0,90,180,360,0],"line":{"color":"#ff66ab"},"marker":{"color":"#8090c7","symbol":"square","size":8,"line":{"color":"rgba(255,127,14,1)"}},"text":["sector: 135->225<br>rotation: 90<br>direction: counterclockwise","sector: 135->225<br>rotation: 90<br>direction: counterclockwise","sector: 135->225<br>rotation: 90<br>direction: counterclockwise","sector: 135->225<br>rotation: 90<br>direction: counterclockwise","sector: 135->225<br>rotation: 90<br>direction: counterclockwise"],"frame":null},{"mode":"lines+markers","type":"scatterpolar","r":[1,2,3,4,5],"theta":[0,90,180,360,0],"line":{"color":"#ff66ab"},"marker":{"color":"#8090c7","symbol":"square","size":8,"line":{"color":"rgba(44,160,44,1)"}},"text":["sector: 135->225<br>rotation: 90<br>direction: counterclockwise","sector: 135->225<br>rotation: 90<br>direction: counterclockwise","sector: 135->225<br>rotation: 90<br>direction: counterclockwise","sector: 135->225<br>rotation: 90<br>direction: counterclockwise","sector: 135->225<br>rotation: 90<br>direction: counterclockwise"],"subplot":"polar2","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Polar Charts Sector


``` r
library(plotly)

fig <- plot_ly(
  type = 'scatterpolar',
  mode = "lines+markers"
) 
fig <- fig %>%
  add_trace(
    r = c(1,2,3,4,5),
    theta = c(0,90,180,360,0),
    line = list(
      color = "#ff66ab"
    ),
    marker = list(
      color = "#8090c7",
      symbol = 'square',
      size = 8
    )
  ) 
fig <- fig %>%
  add_trace(
    r = c(1,2,3,4,5),
    theta = c(0,90,180,360,0),
    line = list(
      color = "#ff66ab"
    ),
    marker = list(
      color = "#8090c7",
      symbol = 'square',
      size = 8
    ),
    subplot = 'polar2'
  ) 
fig <- fig %>%
  layout(
    polar = list(
      domain = list(
        x = c(0,0.4),
        y = c(0,1)
      ),
      sector = c(150,210),
      radialaxis = list(
        tickfont = list(
          size = 8
        )
      ),
      angularaxis = list(
        tickfont = list(
          size = 8
        )
      )
    ),
    polar2 = list(
      domain = list(
        x = c(0.6,1),
        y = c(0,1)
      ),
      radialaxis = list(
        tickfont = list(
          size = 8
        )
      ),
      angularaxis = list(
        tickfont = list(
          size = 8
        )
      )
    ),
    showlegend = F
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-d9a301909d78bfc7eac9" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-d9a301909d78bfc7eac9">{"x":{"visdat":{"25e045cd1f17":["function () ","plotlyVisDat"]},"cur_data":"25e045cd1f17","attrs":{"25e045cd1f17":{"mode":"lines+markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar"},"25e045cd1f17.1":{"mode":"lines+markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[1,2,3,4,5],"theta":[0,90,180,360,0],"line":{"color":"#ff66ab"},"marker":{"color":"#8090c7","symbol":"square","size":8},"inherit":true},"25e045cd1f17.2":{"mode":"lines+markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[1,2,3,4,5],"theta":[0,90,180,360,0],"line":{"color":"#ff66ab"},"marker":{"color":"#8090c7","symbol":"square","size":8},"subplot":"polar2","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"polar":{"domain":{"x":[0,0.40000000000000002],"y":[0,1]},"sector":[150,210],"radialaxis":{"tickfont":{"size":8}},"angularaxis":{"tickfont":{"size":8}}},"polar2":{"domain":{"x":[0.59999999999999998,1],"y":[0,1]},"radialaxis":{"tickfont":{"size":8}},"angularaxis":{"tickfont":{"size":8}}},"showlegend":false,"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"mode":"lines+markers","type":"scatterpolar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"frame":null},{"mode":"lines+markers","type":"scatterpolar","r":[1,2,3,4,5],"theta":[0,90,180,360,0],"line":{"color":"#ff66ab"},"marker":{"color":"#8090c7","symbol":"square","size":8,"line":{"color":"rgba(255,127,14,1)"}},"frame":null},{"mode":"lines+markers","type":"scatterpolar","r":[1,2,3,4,5],"theta":[0,90,180,360,0],"line":{"color":"#ff66ab"},"marker":{"color":"#8090c7","symbol":"square","size":8,"line":{"color":"rgba(44,160,44,1)"}},"subplot":"polar2","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Polar Charts Subplot


``` r
library(plotly)

fig <- plot_ly(
    type = 'scatterpolar',
    mode = 'lines'
) 
fig <- fig %>%
  add_trace(
    r = c(1,2,3),
    theta = c(50,100,200),
    marker = list(
      symbol = 'square'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = c(1,2,3),
    theta = c(1,2,3),
    thetaunit = 'radians'
  ) 
fig <- fig %>%
  add_trace(
    r = c("a", "b", "c", "d"),
    theta = c("D","C","B","A"),
    subplot = 'polar2'
  ) 
fig <- fig %>%
  add_trace(
    r = c(50,300,900),
    theta = c(0,90,180),
    subplot = 'polar3'
  ) 
fig <- fig %>%
  add_trace(
    r = c(3,3,4,3),
    theta = c(0,45,90,270),
    fill = 'toself',
    subplot = 'polar4'
  ) 
fig <- fig %>%
  layout(
    polar = list(
      domain = list(
        x = c(0,0.46),
        y = c(0.56,1)
      ),
      radialaxis = list(
        range = c(1,4)
      ),
      angularaxis = list(
        thetaunit = 'radians'
      )
    ),
    polar2 = list(
      domain = list(
        x = c(0,0.46),
        y = c(0,0.42)
      )
    ),
    polar3 = list(
      domain = list(
        x = c(0.54,1),
        y = c(0.56,1)
      ),
      sector = c(0,180),
      radialaxis = list(
        type = 'log',
        angle = 45
      )
    ),
    polar4 = list(
      domain = list(
        x = c(0.54,1),
        y = c(0,0.44)
      ),
      radialaxis = list(
        visible = F,
        range = c(0,6)
      )
    ),
    showlegend = F
  )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-b1f062fdaeb61c3ac611" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-b1f062fdaeb61c3ac611">{"x":{"visdat":{"25e03dc282e6":["function () ","plotlyVisDat"]},"cur_data":"25e03dc282e6","attrs":{"25e03dc282e6":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar"},"25e03dc282e6.1":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[1,2,3],"theta":[50,100,200],"marker":{"symbol":"square"},"inherit":true},"25e03dc282e6.2":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[1,2,3],"theta":[1,2,3],"thetaunit":"radians","inherit":true},"25e03dc282e6.3":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":["a","b","c","d"],"theta":["D","C","B","A"],"subplot":"polar2","inherit":true},"25e03dc282e6.4":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[50,300,900],"theta":[0,90,180],"subplot":"polar3","inherit":true},"25e03dc282e6.5":{"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolar","r":[3,3,4,3],"theta":[0,45,90,270],"fill":"toself","subplot":"polar4","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"polar":{"domain":{"x":[0,0.46000000000000002],"y":[0.56000000000000005,1]},"radialaxis":{"range":[1,4]},"angularaxis":{"thetaunit":"radians"}},"polar2":{"domain":{"x":[0,0.46000000000000002],"y":[0,0.41999999999999998]}},"polar3":{"domain":{"x":[0.54000000000000004,1],"y":[0.56000000000000005,1]},"sector":[0,180],"radialaxis":{"type":"log","angle":45}},"polar4":{"domain":{"x":[0.54000000000000004,1],"y":[0,0.44]},"radialaxis":{"visible":false,"range":[0,6]}},"showlegend":false,"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"mode":"lines","type":"scatterpolar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"frame":null},{"mode":"lines+markers","type":"scatterpolar","r":[1,2,3],"theta":[50,100,200],"marker":{"color":"rgba(255,127,14,1)","symbol":"square","line":{"color":"rgba(255,127,14,1)"}},"line":{"color":"rgba(255,127,14,1)"},"frame":null},{"mode":"lines","type":"scatterpolar","r":[1,2,3],"theta":[1,2,3],"thetaunit":"radians","marker":{"color":"rgba(44,160,44,1)","line":{"color":"rgba(44,160,44,1)"}},"line":{"color":"rgba(44,160,44,1)"},"frame":null},{"mode":"lines","type":"scatterpolar","r":["a","b","c","d"],"theta":["D","C","B","A"],"subplot":"polar2","marker":{"color":"rgba(214,39,40,1)","line":{"color":"rgba(214,39,40,1)"}},"line":{"color":"rgba(214,39,40,1)"},"frame":null},{"mode":"lines","type":"scatterpolar","r":[50,300,900],"theta":[0,90,180],"subplot":"polar3","marker":{"color":"rgba(148,103,189,1)","line":{"color":"rgba(148,103,189,1)"}},"line":{"color":"rgba(148,103,189,1)"},"frame":null},{"fillcolor":"rgba(140,86,75,0.5)","mode":"lines","type":"scatterpolar","r":[3,3,4,3],"theta":[0,45,90,270],"fill":"toself","subplot":"polar4","marker":{"color":"rgba(140,86,75,1)","line":{"color":"rgba(140,86,75,1)"}},"line":{"color":"rgba(140,86,75,1)"},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Webgl Polar Charts


``` r
library(plotly)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/hobbs-pearson-trials.csv")

fig <- plot_ly(
    type = 'scatterpolargl',
    mode = 'markers'
  )

j = 1
k = 2
for (i in 1:(length(df)/2)){
 fig <- add_trace(
    fig,
    r = df[,j],
    theta = df[,k],
    name = paste('Trial ', i),
    marker = list(
      size = 15,
      line = list(
        color = '#FFF'
      ),
      opacity = 0.7
    )
  )
  j <- j + 2
  k <- k + 2
}

fig <- layout(
  fig,
  title = "Hobbs-Pearson Trials",
  showlegend = F,
  paper_bgcolor = "rgb(223, 223, 223)",
  polar = list(
    bgcolor = "rgb(223, 223, 223)",
    angularaxis = list(
      tickwidth = 2,
      linewidth = 3,
      layer = 'below traces'
    ),
    radialaxis = list(
      side = 'counterclockwise',
      showline = T,
      linewidth = 2,
      tickwidth = 2,
      gridcolor = '#FFF',
      gridwidth = 2
    )
  )
)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-dd2b014263953ec324e0" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-dd2b014263953ec324e0">{"x":{"visdat":{"25e0e966bd":["function () ","plotlyVisDat"]},"cur_data":"25e0e966bd","attrs":{"25e0e966bd":{"mode":"markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolargl"},"25e0e966bd.1":{"mode":"markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolargl","r":[6.8049857850000004,3.3895960110000001,5.3814721109999999,8.0595402190000005,5.3182292279999999,2.9850999360000001,1.966587002,6.7692654079999999,4.0734018990000003,6.5043718249999998,7.5563698190000004,4.0474560940000002,7.3866624959999996,5.4136247370000001,7.4707165309999999,7.9821102169999998,4.7378140799999997,4.2064530429999998,5.4786048049999998,4.8245202809999999,5.5996006100000004,6.866795217,3.0856713660000001,7.7718109430000002,3.6877944349999998,5.3603566850000002,5.1404467389999997,6.0454456810000003,6.8339209399999996,3.6207694629999998,3.9894305829999999,5.3118245000000002,4.6082134799999999,6.6405847160000002,3.0551888539999998,7.492564164,5.4850781780000002,3.8977949970000001,5.9762451140000001,5.4470615609999999,5.377034117,4.6908057879999996,4.7116404909999998,3.6299193289999998,5.957668076,5.3571212839999998,3.8492352830000001,6.2505071360000004,7.1222433570000003,3.3994042339999999,3.5105566719999999,4.1009976039999998,4.0963820999999996,6.2335830750000003,3.939488527,3.925445077,6.1181325009999998,3.940450346,7.583015573,3.5132021450000002],"theta":[-30.352944359999999,-25.611459849999999,-12.42522745,13.961380520000001,-4.9509328410000002,-25.692274189999999,12.468764159999999,-4.9137641070000004,-10.967380289999999,30.814194050000001,2.4749594309999998,17.97554375,0.77113059299999998,6.1374884859999996,-14.45196357,28.184534110000001,12.53868007,-8.9832303370000002,5.2312851650000001,-64.489002540000001,11.357486679999999,3.4540747920000001,13.924346610000001,-25.36400205,-16.818006390000001,-10.26005103,-13.212134130000001,2.579338865,8.7175749660000008,-10.67549872,-2.926366013,25.195880750000001,40.590329320000002,-9.1214336300000003,-24.297362379999999,-3.1769445059999999,10.850498419999999,-31.332059749999999,4.8495674620000004,15.04827695,3.2951046989999999,-6.1970918729999998,-8.7785741359999996,29.54917412,-5.1374487929999999,23.026860490000001,-6.6348165779999997,2.755014992,21.73325011,-24.816994959999999,-7.830547063,28.32579621,12.300977469999999,-21.563157239999999,-19.33551628,26.146443170000001,-1.706071203,16.0717237,2.053266303,-5.0979116119999999],"name":"Trial  1","marker":{"size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"inherit":true},"25e0e966bd.2":{"mode":"markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolargl","r":[3.4880439230000002,2.918478576,4.2018273600000002,8.2273246069999999,4.7766904270000001,3.0419123030000002,4.7899477189999997,5.6638807800000004,3.858262393,8.2602128809999993,6.8686244859999999,5.7401976000000001,6.5949792819999997,5.6927037780000003,5.3379165740000003,9.2836041849999997,5.7645908930000003,4.0288645519999999,5.6623447479999998,0.42283723099999998,6.2012664639999997,6.4392653810000002,5.0967585130000002,4.6320819090000001,3.4218461360000001,4.3694047029999998,4.0283344190000001,5.8057671979999999,6.8481899210000003,3.8092955129999999,4.3852681840000001,6.9833268459999998,7.3962731860000002,5.2151250029999998,3.0861487790000002,6.3353944909999997,6.0904147139999996,2.4480560069999999,5.9427840200000004,6.3731298860000001,5.4542053409999998,4.3933376170000003,4.20594468,6.1555422880000004,5.1190871710000003,6.8698608309999996,4.1045998609999996,5.9543481260000002,8.0923328770000005,2.961769705,3.9740121880000001,6.3733841289999997,5.4154091429999998,3.8768909200000001,3.261446947,6.14580853,5.5024519869999997,5.5715532950000002,6.8530492609999998,4.1403550750000004],"theta":[14.806625779999999,79.006340370000004,49.02206554,49.699083139999999,54.137491079999997,86.419321019999998,96.952391939999998,41.463488259999998,67.137691689999997,68.061039440000002,42.681930319999999,76.398656610000003,42.19479347,59.577888969999997,27.510866799999999,60.753444829999999,68.370832800000002,65.748028149999996,58.533008369999997,-176.74410649999999,61.174018580000002,47.451508590000003,84.426653189999996,12.479346550000001,72.480802760000003,50.57883176,51.560228240000001,52.437856179999997,51.586827990000003,73.872944779999997,70.217056929999998,70.714299150000002,82.234394429999995,38.93539045,84.709366669999994,38.165828439999999,61.704053649999999,70.196956290000003,54.454292590000001,64.334894969999993,58.273893149999999,60.499822389999999,59.15523254,83.865618470000001,47.873409899999999,69.282601569999997,71.189910429999998,51.048396459999999,59.42758242,78.598736959999997,75.755864520000003,79.970483720000004,73.893780250000006,31.73341113,68.084751179999998,80.411079979999997,48.924250710000003,76.650255759999993,42.182864360000004,76.033335890000004],"name":"Trial  2","marker":{"size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"inherit":true},"25e0e966bd.3":{"mode":"markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolargl","r":[1.8558708349999999,5.2869620619999997,3.8860133920000002,6.282863313,4.4534148480000004,5.6880080509999997,7.3308642830000004,3.825660595,4.9896041770000004,7.8974314699999999,4.6566931130000002,6.6671536959999997,4.4310062869999998,5.3461132530000004,2.4799456960000001,8.1134773490000001,6.0813116819999999,4.9682168960000004,5.2444539209999999,5.4222078839999996,5.792774616,4.7875805920000003,6.7843186370000002,1.1089369090000001,5.138911105,4.0429296570000002,4.0228920300000004,4.8284287910000003,5.4173783740000001,5.3786352109999997,5.4210971749999999,7.1205619789999997,8.3493085399999991,3.4104855879999998,5.6283784710000004,3.9149369759999999,5.7639402620000002,4.7643741070000001,5.0762362679999997,6.1655581829999999,5.1055765160000002,4.7610363769999999,4.5962495409999997,7.5041884110000003,4.107031418,6.9204222990000002,5.3491289499999999,4.7980657190000002,7.0232515319999997,5.2836809650000003,5.5690711520000002,7.3837949079999996,6.2692332100000003,2.656529645,4.8439843390000004,7.2479923619999997,4.3729593940000004,6.5709810810000002,4.6024792440000004,5.6700520509999999],"theta":[151.29425520000001,147.18802500000001,125.28215710000001,87.067297969999998,119.62789840000001,147.7408241,139.56459810000001,101.3914971,134.5601843,104.0244447,89.393142940000004,123.1940314,91.474340519999998,113.3323736,96.149925569999994,93.280734519999996,118.2155652,132.3229374,112.94118640000001,-179.74623310000001,110.3035136,97.750836169999999,131.60808929999999,115.49691919999999,140.5811822,123.3966621,128.34200899999999,107.6088104,97.904689790000006,137.12844799999999,130.4312449,112.2270845,118.6302022,106.0582256,146.90810970000001,90.277349560000005,111.5052824,151.0897425,107.72139420000001,111.300855,114.68027789999999,126.5693795,128.21895219999999,125.3548572,112.4180683,111.7973557,133.4180523,105.1841168,97.231036119999999,146.66803680000001,136.23931519999999,121.7918442,123.911328,129.862245,141.34395090000001,123.2709677,108.4588217,124.4123771,89.027110739999998,134.87670109999999],"name":"Trial  3","marker":{"size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"inherit":true},"25e0e966bd.4":{"mode":"markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolargl","r":[5.3724709239999999,7.0963555720000002,4.8838239029999997,2.9201354410000002,4.7239630459999997,7.4236939509999997,8.0909460749999997,3.3068445909999999,6.0508284830000001,5.5302320739999997,2.4723069529999999,6.2756705369999999,2.615896174,4.6535399450000003,3.335440014,4.7958836050000002,5.4727113459999996,5.8819304910000003,4.5715870719999998,9.03986117,4.6429076,3.1727677359999999,7.0442481389999996,4.466336514,6.5573302900000003,4.8208494369999997,5.1319155150000002,3.9700122370000002,3.4063238130000002,6.4767229640000004,6.0192185089999999,5.6645015350000003,7.1587585230000004,3.6007126619999998,7.3241271689999996,2.552946156,4.7271338600000004,6.9717552070000002,4.0765783610000002,4.9462234069999997,4.6421554489999997,5.3605748640000002,5.3917190670000004,7.072524305,4.1011115699999996,5.4857326210000004,6.192535286,3.7687113920000002,4.2903113900000003,7.0601953699999997,6.539691844,6.6797444060000002,6.0608253589999999,4.7865740409999997,6.4166865299999998,6.7032813329999996,3.8888478100000001,6.3085910810000003,2.4370447710000001,6.5081863479999997],"theta":[-140.20332759999999,-168.08424539999999,-166.28514129999999,138.2488668,-174.4243864,-169.96048279999999,176.9918227,-169.9014162,-172.64158159999999,142.95166879999999,172.41574639999999,168.5193592,177.8220537,172.8551903,-146.01452169999999,128.17729299999999,169.1670728,-173.58857380000001,173.72699270000001,-151.20610479999999,166.2604772,172.50756609999999,173.94918390000001,-131.8068409,-170.63527379999999,-168.57708550000001,-166.7655034,176.0704873,162.29750150000001,-174.05574630000001,-178.06092989999999,156.47126890000001,155.23914210000001,-163.00052640000001,-170.11671329999999,-170.6392725,167.38314370000001,-163.09881709999999,172.88073700000001,163.38600769999999,176.18254200000001,-174.57968020000001,-172.33584490000001,165.3380257,-172.52566429999999,157.54287769999999,-175.88151110000001,175.42764399999999,142.06967470000001,-168.340734,-175.80583110000001,163.06374539999999,171.72097500000001,-151.4039046,-168.27136909999999,165.04532789999999,-177.31533669999999,170.04241289999999,173.5991966,-177.25065670000001],"name":"Trial  4","marker":{"size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"inherit":true},"25e0e966bd.5":{"mode":"markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolargl","r":[7.9375578710000001,7.3027464919999998,5.9293022210000004,2.407178713,5.2709218870000001,7.4005961280000001,6.8108203380000001,4.9677590340000002,6.19022937,2.1585186580000002,4.0041258940000004,4.7766173219999999,4.2322504519999997,4.3076548729999997,6.2002751729999996,0.72751384900000005,4.378006804,6.0049649389999997,4.3419317030000002,10.23798294,3.8021588890000002,3.9692811699999999,5.7589801420000004,7.674179069,6.6999535330000004,5.7343103879999999,6.0442759150000001,4.3129430659999999,3.3775452819999998,6.3676667269999996,5.7372441820000004,3.3963514720000001,4.2164674809999996,5.4648850170000003,7.311135578,4.7454007689999997,3.9164685320000001,7.6029729899999996,4.1252048290000003,3.6767949500000001,4.5512357889999997,5.6069605320000004,5.7948442570000003,5.0305281559999999,5.1095862409999997,3.4054402079999999,6.0263061249999996,4.2211092639999999,1.9097829369999999,7.2546693940000004,6.2688758719999997,4.5625805670000004,4.918057965,6.8365609630000002,6.7864865490000001,4.7510143339999997,4.7199263480000004,4.9278052150000002,4.0591905869999998,6.128338984],"theta":[-101.8337858,-127.47839159999999,-112.244285,-82.325910870000001,-114.6888556,-130.53786339999999,-145.010265,-98.748845009999997,-124.4417488,-152.4541193,-89.294236549999994,-139.83245170000001,-91.543595179999997,-119.44216299999999,-92.455838529999994,-129.6599243,-131.05123510000001,-123.8529175,-118.08673899999999,-121.9792171,-121.91503,-99.361847580000003,-141.467702,-93.566263190000001,-126.3369014,-112.8349442,-114.3864799,-109.79607230000001,-102.7432647,-128.24672889999999,-127.7920926,-142.4736297,-161.5872942,-99.94061078,-130.16311730000001,-90.228812009999999,-122.6504912,-123.2677506,-111.9973088,-127.5283168,-117.9312953,-120.3916342,-119.3868715,-149.67469550000001,-107.8505175,-138.98993129999999,-127.59547019999999,-107.32083540000001,-117.57380740000001,-127.481661,-129.9120332,-148.4952117,-135.3316414,-104.4216593,-123.8754402,-146.81682660000001,-107.0584854,-138.90256489999999,-88.896882520000005,-130.75446740000001],"name":"Trial  5","marker":{"size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"inherit":true},"25e0e966bd.6":{"mode":"markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatterpolargl","r":[8.4691805280000008,5.8219975670000004,6.1409183279999997,5.831724285,5.5467544719999999,5.6274877090000004,3.948328976,6.4901846150000004,5.3206182450000004,3.243593041,6.4440853320000002,3.3637781009999999,6.4631168109999999,4.7309449260000003,7.7965784109999996,4.5701278299999997,3.9262068160000001,5.2543481400000003,4.8384111069999998,8.6945239989999994,4.3995318179999998,5.8564839050000002,3.6215770389999999,8.8949123730000004,5.4945428359999999,5.9689808910000002,6.0478995739999997,5.384671397,5.3812200179999996,5.1115746230000001,4.7705611049999996,3.098330883,1.6650831719999999,6.7402585330000004,5.5944949289999997,6.8796308259999996,4.3827924659999997,6.4108436160000002,5.1542043179999997,4.0151585189999999,4.9391488680000002,5.298297314,5.4904171770000003,2.6237512590000001,5.9535886619999996,3.3014793720000002,4.9548890009999997,5.5000536699999998,4.4505123500000003,5.7866245129999996,4.9068344240000004,2.6299694730000001,3.7697036079999999,7.3967357160000002,5.764481902,2.7945851959999999,5.7820332700000003,3.4853519180000001,6.5006535989999996,4.7486407100000001],"theta":[-66.535836329999995,-84.514422679999996,-63.339741699999998,-24.146812740000001,-59.701245319999998,-88.065372679999996,-98.444204540000001,-49.15839682,-73.636223310000005,-17.923874680000001,-38.412399450000002,-66.340362380000002,-40.888838739999997,-52.460633209999997,-52.610462560000002,-7.0393510509999997,-57.235458690000002,-71.642203499999994,-52.345396170000001,-92.783038669999996,-47.187163060000003,-41.969208459999997,-82.144228249999998,-59.439165600000003,-79.194822590000001,-62.299908539999997,-65.537904040000001,-48.906055449999997,-37.748311039999997,-78.053333460000005,-71.873117660000005,-41.891092829999998,-53.115455490000002,-52.9976281,-87.084361020000003,-43.611904840000001,-48.797998409999998,-82.566803160000006,-47.909962999999998,-46.570485589999997,-54.50048322,-65.900727130000007,-66.873317459999996,-75.480807249999998,-54.77769387,-42.59833459,-74.508166270000004,-47.110218439999997,-22.356873180000001,-84.192986750000003,-78.505284759999995,-65.036371790000004,-66.513733680000001,-63.526776560000002,-77.809078549999995,-68.510179739999998,-51.296869309999998,-68.339913030000005,-38.631733070000003,-77.851848590000003],"name":"Trial  6","marker":{"size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Hobbs-Pearson Trials","showlegend":false,"paper_bgcolor":"rgb(223, 223, 223)","polar":{"bgcolor":"rgb(223, 223, 223)","angularaxis":{"tickwidth":2,"linewidth":3,"layer":"below traces"},"radialaxis":{"side":"counterclockwise","showline":true,"linewidth":2,"tickwidth":2,"gridcolor":"#FFF","gridwidth":2}},"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"mode":"markers","type":"scatterpolargl","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"frame":null},{"mode":"markers","type":"scatterpolargl","r":[6.8049857850000004,3.3895960110000001,5.3814721109999999,8.0595402190000005,5.3182292279999999,2.9850999360000001,1.966587002,6.7692654079999999,4.0734018990000003,6.5043718249999998,7.5563698190000004,4.0474560940000002,7.3866624959999996,5.4136247370000001,7.4707165309999999,7.9821102169999998,4.7378140799999997,4.2064530429999998,5.4786048049999998,4.8245202809999999,5.5996006100000004,6.866795217,3.0856713660000001,7.7718109430000002,3.6877944349999998,5.3603566850000002,5.1404467389999997,6.0454456810000003,6.8339209399999996,3.6207694629999998,3.9894305829999999,5.3118245000000002,4.6082134799999999,6.6405847160000002,3.0551888539999998,7.492564164,5.4850781780000002,3.8977949970000001,5.9762451140000001,5.4470615609999999,5.377034117,4.6908057879999996,4.7116404909999998,3.6299193289999998,5.957668076,5.3571212839999998,3.8492352830000001,6.2505071360000004,7.1222433570000003,3.3994042339999999,3.5105566719999999,4.1009976039999998,4.0963820999999996,6.2335830750000003,3.939488527,3.925445077,6.1181325009999998,3.940450346,7.583015573,3.5132021450000002],"theta":[-30.352944359999999,-25.611459849999999,-12.42522745,13.961380520000001,-4.9509328410000002,-25.692274189999999,12.468764159999999,-4.9137641070000004,-10.967380289999999,30.814194050000001,2.4749594309999998,17.97554375,0.77113059299999998,6.1374884859999996,-14.45196357,28.184534110000001,12.53868007,-8.9832303370000002,5.2312851650000001,-64.489002540000001,11.357486679999999,3.4540747920000001,13.924346610000001,-25.36400205,-16.818006390000001,-10.26005103,-13.212134130000001,2.579338865,8.7175749660000008,-10.67549872,-2.926366013,25.195880750000001,40.590329320000002,-9.1214336300000003,-24.297362379999999,-3.1769445059999999,10.850498419999999,-31.332059749999999,4.8495674620000004,15.04827695,3.2951046989999999,-6.1970918729999998,-8.7785741359999996,29.54917412,-5.1374487929999999,23.026860490000001,-6.6348165779999997,2.755014992,21.73325011,-24.816994959999999,-7.830547063,28.32579621,12.300977469999999,-21.563157239999999,-19.33551628,26.146443170000001,-1.706071203,16.0717237,2.053266303,-5.0979116119999999],"name":"Trial  1","marker":{"color":"rgba(255,127,14,1)","size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"line":{"color":"rgba(255,127,14,1)"},"frame":null},{"mode":"markers","type":"scatterpolargl","r":[3.4880439230000002,2.918478576,4.2018273600000002,8.2273246069999999,4.7766904270000001,3.0419123030000002,4.7899477189999997,5.6638807800000004,3.858262393,8.2602128809999993,6.8686244859999999,5.7401976000000001,6.5949792819999997,5.6927037780000003,5.3379165740000003,9.2836041849999997,5.7645908930000003,4.0288645519999999,5.6623447479999998,0.42283723099999998,6.2012664639999997,6.4392653810000002,5.0967585130000002,4.6320819090000001,3.4218461360000001,4.3694047029999998,4.0283344190000001,5.8057671979999999,6.8481899210000003,3.8092955129999999,4.3852681840000001,6.9833268459999998,7.3962731860000002,5.2151250029999998,3.0861487790000002,6.3353944909999997,6.0904147139999996,2.4480560069999999,5.9427840200000004,6.3731298860000001,5.4542053409999998,4.3933376170000003,4.20594468,6.1555422880000004,5.1190871710000003,6.8698608309999996,4.1045998609999996,5.9543481260000002,8.0923328770000005,2.961769705,3.9740121880000001,6.3733841289999997,5.4154091429999998,3.8768909200000001,3.261446947,6.14580853,5.5024519869999997,5.5715532950000002,6.8530492609999998,4.1403550750000004],"theta":[14.806625779999999,79.006340370000004,49.02206554,49.699083139999999,54.137491079999997,86.419321019999998,96.952391939999998,41.463488259999998,67.137691689999997,68.061039440000002,42.681930319999999,76.398656610000003,42.19479347,59.577888969999997,27.510866799999999,60.753444829999999,68.370832800000002,65.748028149999996,58.533008369999997,-176.74410649999999,61.174018580000002,47.451508590000003,84.426653189999996,12.479346550000001,72.480802760000003,50.57883176,51.560228240000001,52.437856179999997,51.586827990000003,73.872944779999997,70.217056929999998,70.714299150000002,82.234394429999995,38.93539045,84.709366669999994,38.165828439999999,61.704053649999999,70.196956290000003,54.454292590000001,64.334894969999993,58.273893149999999,60.499822389999999,59.15523254,83.865618470000001,47.873409899999999,69.282601569999997,71.189910429999998,51.048396459999999,59.42758242,78.598736959999997,75.755864520000003,79.970483720000004,73.893780250000006,31.73341113,68.084751179999998,80.411079979999997,48.924250710000003,76.650255759999993,42.182864360000004,76.033335890000004],"name":"Trial  2","marker":{"color":"rgba(44,160,44,1)","size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"line":{"color":"rgba(44,160,44,1)"},"frame":null},{"mode":"markers","type":"scatterpolargl","r":[1.8558708349999999,5.2869620619999997,3.8860133920000002,6.282863313,4.4534148480000004,5.6880080509999997,7.3308642830000004,3.825660595,4.9896041770000004,7.8974314699999999,4.6566931130000002,6.6671536959999997,4.4310062869999998,5.3461132530000004,2.4799456960000001,8.1134773490000001,6.0813116819999999,4.9682168960000004,5.2444539209999999,5.4222078839999996,5.792774616,4.7875805920000003,6.7843186370000002,1.1089369090000001,5.138911105,4.0429296570000002,4.0228920300000004,4.8284287910000003,5.4173783740000001,5.3786352109999997,5.4210971749999999,7.1205619789999997,8.3493085399999991,3.4104855879999998,5.6283784710000004,3.9149369759999999,5.7639402620000002,4.7643741070000001,5.0762362679999997,6.1655581829999999,5.1055765160000002,4.7610363769999999,4.5962495409999997,7.5041884110000003,4.107031418,6.9204222990000002,5.3491289499999999,4.7980657190000002,7.0232515319999997,5.2836809650000003,5.5690711520000002,7.3837949079999996,6.2692332100000003,2.656529645,4.8439843390000004,7.2479923619999997,4.3729593940000004,6.5709810810000002,4.6024792440000004,5.6700520509999999],"theta":[151.29425520000001,147.18802500000001,125.28215710000001,87.067297969999998,119.62789840000001,147.7408241,139.56459810000001,101.3914971,134.5601843,104.0244447,89.393142940000004,123.1940314,91.474340519999998,113.3323736,96.149925569999994,93.280734519999996,118.2155652,132.3229374,112.94118640000001,-179.74623310000001,110.3035136,97.750836169999999,131.60808929999999,115.49691919999999,140.5811822,123.3966621,128.34200899999999,107.6088104,97.904689790000006,137.12844799999999,130.4312449,112.2270845,118.6302022,106.0582256,146.90810970000001,90.277349560000005,111.5052824,151.0897425,107.72139420000001,111.300855,114.68027789999999,126.5693795,128.21895219999999,125.3548572,112.4180683,111.7973557,133.4180523,105.1841168,97.231036119999999,146.66803680000001,136.23931519999999,121.7918442,123.911328,129.862245,141.34395090000001,123.2709677,108.4588217,124.4123771,89.027110739999998,134.87670109999999],"name":"Trial  3","marker":{"color":"rgba(214,39,40,1)","size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"line":{"color":"rgba(214,39,40,1)"},"frame":null},{"mode":"markers","type":"scatterpolargl","r":[5.3724709239999999,7.0963555720000002,4.8838239029999997,2.9201354410000002,4.7239630459999997,7.4236939509999997,8.0909460749999997,3.3068445909999999,6.0508284830000001,5.5302320739999997,2.4723069529999999,6.2756705369999999,2.615896174,4.6535399450000003,3.335440014,4.7958836050000002,5.4727113459999996,5.8819304910000003,4.5715870719999998,9.03986117,4.6429076,3.1727677359999999,7.0442481389999996,4.466336514,6.5573302900000003,4.8208494369999997,5.1319155150000002,3.9700122370000002,3.4063238130000002,6.4767229640000004,6.0192185089999999,5.6645015350000003,7.1587585230000004,3.6007126619999998,7.3241271689999996,2.552946156,4.7271338600000004,6.9717552070000002,4.0765783610000002,4.9462234069999997,4.6421554489999997,5.3605748640000002,5.3917190670000004,7.072524305,4.1011115699999996,5.4857326210000004,6.192535286,3.7687113920000002,4.2903113900000003,7.0601953699999997,6.539691844,6.6797444060000002,6.0608253589999999,4.7865740409999997,6.4166865299999998,6.7032813329999996,3.8888478100000001,6.3085910810000003,2.4370447710000001,6.5081863479999997],"theta":[-140.20332759999999,-168.08424539999999,-166.28514129999999,138.2488668,-174.4243864,-169.96048279999999,176.9918227,-169.9014162,-172.64158159999999,142.95166879999999,172.41574639999999,168.5193592,177.8220537,172.8551903,-146.01452169999999,128.17729299999999,169.1670728,-173.58857380000001,173.72699270000001,-151.20610479999999,166.2604772,172.50756609999999,173.94918390000001,-131.8068409,-170.63527379999999,-168.57708550000001,-166.7655034,176.0704873,162.29750150000001,-174.05574630000001,-178.06092989999999,156.47126890000001,155.23914210000001,-163.00052640000001,-170.11671329999999,-170.6392725,167.38314370000001,-163.09881709999999,172.88073700000001,163.38600769999999,176.18254200000001,-174.57968020000001,-172.33584490000001,165.3380257,-172.52566429999999,157.54287769999999,-175.88151110000001,175.42764399999999,142.06967470000001,-168.340734,-175.80583110000001,163.06374539999999,171.72097500000001,-151.4039046,-168.27136909999999,165.04532789999999,-177.31533669999999,170.04241289999999,173.5991966,-177.25065670000001],"name":"Trial  4","marker":{"color":"rgba(148,103,189,1)","size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"line":{"color":"rgba(148,103,189,1)"},"frame":null},{"mode":"markers","type":"scatterpolargl","r":[7.9375578710000001,7.3027464919999998,5.9293022210000004,2.407178713,5.2709218870000001,7.4005961280000001,6.8108203380000001,4.9677590340000002,6.19022937,2.1585186580000002,4.0041258940000004,4.7766173219999999,4.2322504519999997,4.3076548729999997,6.2002751729999996,0.72751384900000005,4.378006804,6.0049649389999997,4.3419317030000002,10.23798294,3.8021588890000002,3.9692811699999999,5.7589801420000004,7.674179069,6.6999535330000004,5.7343103879999999,6.0442759150000001,4.3129430659999999,3.3775452819999998,6.3676667269999996,5.7372441820000004,3.3963514720000001,4.2164674809999996,5.4648850170000003,7.311135578,4.7454007689999997,3.9164685320000001,7.6029729899999996,4.1252048290000003,3.6767949500000001,4.5512357889999997,5.6069605320000004,5.7948442570000003,5.0305281559999999,5.1095862409999997,3.4054402079999999,6.0263061249999996,4.2211092639999999,1.9097829369999999,7.2546693940000004,6.2688758719999997,4.5625805670000004,4.918057965,6.8365609630000002,6.7864865490000001,4.7510143339999997,4.7199263480000004,4.9278052150000002,4.0591905869999998,6.128338984],"theta":[-101.8337858,-127.47839159999999,-112.244285,-82.325910870000001,-114.6888556,-130.53786339999999,-145.010265,-98.748845009999997,-124.4417488,-152.4541193,-89.294236549999994,-139.83245170000001,-91.543595179999997,-119.44216299999999,-92.455838529999994,-129.6599243,-131.05123510000001,-123.8529175,-118.08673899999999,-121.9792171,-121.91503,-99.361847580000003,-141.467702,-93.566263190000001,-126.3369014,-112.8349442,-114.3864799,-109.79607230000001,-102.7432647,-128.24672889999999,-127.7920926,-142.4736297,-161.5872942,-99.94061078,-130.16311730000001,-90.228812009999999,-122.6504912,-123.2677506,-111.9973088,-127.5283168,-117.9312953,-120.3916342,-119.3868715,-149.67469550000001,-107.8505175,-138.98993129999999,-127.59547019999999,-107.32083540000001,-117.57380740000001,-127.481661,-129.9120332,-148.4952117,-135.3316414,-104.4216593,-123.8754402,-146.81682660000001,-107.0584854,-138.90256489999999,-88.896882520000005,-130.75446740000001],"name":"Trial  5","marker":{"color":"rgba(140,86,75,1)","size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"line":{"color":"rgba(140,86,75,1)"},"frame":null},{"mode":"markers","type":"scatterpolargl","r":[8.4691805280000008,5.8219975670000004,6.1409183279999997,5.831724285,5.5467544719999999,5.6274877090000004,3.948328976,6.4901846150000004,5.3206182450000004,3.243593041,6.4440853320000002,3.3637781009999999,6.4631168109999999,4.7309449260000003,7.7965784109999996,4.5701278299999997,3.9262068160000001,5.2543481400000003,4.8384111069999998,8.6945239989999994,4.3995318179999998,5.8564839050000002,3.6215770389999999,8.8949123730000004,5.4945428359999999,5.9689808910000002,6.0478995739999997,5.384671397,5.3812200179999996,5.1115746230000001,4.7705611049999996,3.098330883,1.6650831719999999,6.7402585330000004,5.5944949289999997,6.8796308259999996,4.3827924659999997,6.4108436160000002,5.1542043179999997,4.0151585189999999,4.9391488680000002,5.298297314,5.4904171770000003,2.6237512590000001,5.9535886619999996,3.3014793720000002,4.9548890009999997,5.5000536699999998,4.4505123500000003,5.7866245129999996,4.9068344240000004,2.6299694730000001,3.7697036079999999,7.3967357160000002,5.764481902,2.7945851959999999,5.7820332700000003,3.4853519180000001,6.5006535989999996,4.7486407100000001],"theta":[-66.535836329999995,-84.514422679999996,-63.339741699999998,-24.146812740000001,-59.701245319999998,-88.065372679999996,-98.444204540000001,-49.15839682,-73.636223310000005,-17.923874680000001,-38.412399450000002,-66.340362380000002,-40.888838739999997,-52.460633209999997,-52.610462560000002,-7.0393510509999997,-57.235458690000002,-71.642203499999994,-52.345396170000001,-92.783038669999996,-47.187163060000003,-41.969208459999997,-82.144228249999998,-59.439165600000003,-79.194822590000001,-62.299908539999997,-65.537904040000001,-48.906055449999997,-37.748311039999997,-78.053333460000005,-71.873117660000005,-41.891092829999998,-53.115455490000002,-52.9976281,-87.084361020000003,-43.611904840000001,-48.797998409999998,-82.566803160000006,-47.909962999999998,-46.570485589999997,-54.50048322,-65.900727130000007,-66.873317459999996,-75.480807249999998,-54.77769387,-42.59833459,-74.508166270000004,-47.110218439999997,-22.356873180000001,-84.192986750000003,-78.505284759999995,-65.036371790000004,-66.513733680000001,-63.526776560000002,-77.809078549999995,-68.510179739999998,-51.296869309999998,-68.339913030000005,-38.631733070000003,-77.851848590000003],"name":"Trial  6","marker":{"color":"rgba(227,119,194,1)","size":15,"line":{"color":"#FFF"},"opacity":0.69999999999999996},"line":{"color":"rgba(227,119,194,1)"},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Reference

See [https://plotly.com/r/reference/#polar](https://plotly.com/r/reference/#polar) for more information and options!
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
