---
description: How to make sunburst charts in R with Plotly.
display_as: basic
language: r
layout: base
name: Sunburst Charts
order: 10
output:
  html_document:
    keep_md: true
permalink: r/sunburst-charts/
thumbnail: thumbnail/sunburst.gif
---


### Basic Sunburst Chart


``` r
library(plotly)

fig <- plot_ly(
  labels = c("Eve", "Cain", "Seth", "Enos", "Noam", "Abel", "Awan", "Enoch", "Azura"),
  parents = c("", "Eve", "Eve", "Seth", "Seth", "Eve", "Eve", "Awan", "Eve"),
  values = c(10, 14, 12, 10, 2, 6, 6, 4, 4),
  type = 'sunburst'
)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-b81dca88e6a1ceb230bd" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-b81dca88e6a1ceb230bd">{"x":{"visdat":{"29dc730961f0":["function () ","plotlyVisDat"]},"cur_data":"29dc730961f0","attrs":{"29dc730961f0":{"labels":["Eve","Cain","Seth","Enos","Noam","Abel","Awan","Enoch","Azura"],"parents":["","Eve","Eve","Seth","Seth","Eve","Eve","Awan","Eve"],"values":[10,14,12,10,2,6,6,4,4],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"sunburst"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"labels":["Eve","Cain","Seth","Enos","Noam","Abel","Awan","Enoch","Azura"],"parents":["","Eve","Eve","Seth","Seth","Eve","Eve","Awan","Eve"],"values":[10,14,12,10,2,6,6,4,4],"type":"sunburst","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(255,255,255,1)"}},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Branchvalues
With branchvalues "total", the value of the parent represents the width of its wedge. 
In the example below, "Enoch" is 4 and "Awan" is 6 and so Enoch's width is 4/6ths of Awans.
With branchvalues "remainder", the parent's width is determined by its own value plus those
of its children. So, Enoch's width is 4/10ths of Awan's (4 / (6 + 4)).


Note that this means that the sum of the values of the children cannot exceed the
value of their parent when branchvalues "total". When branchvalues "relative" (the default), children will
not take up all of the space below their parent (unless the parent is the root and it has a value of 0).


``` r
library(plotly)

fig <- plot_ly(
  labels = c("Eve", "Cain", "Seth", "Enos", "Noam", "Abel", "Awan", "Enoch", "Azura"),
  parents = c("", "Eve", "Eve", "Seth", "Seth", "Eve", "Eve", "Awan", "Eve"),
  values = c(65, 14, 12, 10, 2, 6, 6, 4, 4),
  type = 'sunburst',
  branchvalues = 'total'
)

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-8f734d598da0bc0bd68d" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-8f734d598da0bc0bd68d">{"x":{"visdat":{"29dc3a1dfc05":["function () ","plotlyVisDat"]},"cur_data":"29dc3a1dfc05","attrs":{"29dc3a1dfc05":{"labels":["Eve","Cain","Seth","Enos","Noam","Abel","Awan","Enoch","Azura"],"parents":["","Eve","Eve","Seth","Seth","Eve","Eve","Awan","Eve"],"values":[65,14,12,10,2,6,6,4,4],"branchvalues":"total","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"sunburst"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"labels":["Eve","Cain","Seth","Enos","Noam","Abel","Awan","Enoch","Azura"],"parents":["","Eve","Eve","Seth","Seth","Eve","Eve","Awan","Eve"],"values":[65,14,12,10,2,6,6,4,4],"branchvalues":"total","type":"sunburst","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(255,255,255,1)"}},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Sunburst with Repeated Labels


``` r
library(plotly)

d <- data.frame(
    ids = c(
    "North America", "Europe", "Australia", "North America - Football", "Soccer",
    "North America - Rugby", "Europe - Football", "Rugby",
    "Europe - American Football","Australia - Football", "Association",
    "Australian Rules", "Autstralia - American Football", "Australia - Rugby",
    "Rugby League", "Rugby Union"
  ),
  labels = c(
    "North<br>America", "Europe", "Australia", "Football", "Soccer", "Rugby",
    "Football", "Rugby", "American<br>Football", "Football", "Association",
    "Australian<br>Rules", "American<br>Football", "Rugby", "Rugby<br>League",
    "Rugby<br>Union"
  ),
  parents = c(
    "", "", "", "North America", "North America", "North America", "Europe",
    "Europe", "Europe","Australia", "Australia - Football", "Australia - Football",
    "Australia - Football", "Australia - Football", "Australia - Rugby",
    "Australia - Rugby"
  ),
  stringsAsFactors = FALSE
)

fig <- plot_ly(d, ids = ~ids, labels = ~labels, parents = ~parents, type = 'sunburst')

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-270d959ec2a140883220" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-270d959ec2a140883220">{"x":{"visdat":{"29dc3a384e97":["function () ","plotlyVisDat"]},"cur_data":"29dc3a384e97","attrs":{"29dc3a384e97":{"ids":{},"labels":{},"parents":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"sunburst"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"ids":["North America","Europe","Australia","North America - Football","Soccer","North America - Rugby","Europe - Football","Rugby","Europe - American Football","Australia - Football","Association","Australian Rules","Autstralia - American Football","Australia - Rugby","Rugby League","Rugby Union"],"labels":["North<br>America","Europe","Australia","Football","Soccer","Rugby","Football","Rugby","American<br>Football","Football","Association","Australian<br>Rules","American<br>Football","Rugby","Rugby<br>League","Rugby<br>Union"],"parents":["","","","North America","North America","North America","Europe","Europe","Europe","Australia","Australia - Football","Australia - Football","Australia - Football","Australia - Football","Australia - Rugby","Australia - Rugby"],"type":"sunburst","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(255,255,255,1)"}},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
#### Controlling text orientation inside sunburst sectors

The `insidetextorientation` attribute controls the orientation of text inside sectors. With "auto" the texts may automatically be rotated to fit with the maximum size inside the slice. Using "horizontal" (resp. "radial", "tangential") forces text to be horizontal (resp. radial or tangential). Note that `plotly` may reduce the font size in order to fit the text with the requested orientation.


``` r
df = read.csv('https://raw.githubusercontent.com/plotly/datasets/718417069ead87650b90472464c7565dc8c2cb1c/coffee-flavors.csv')

fig <- plot_ly()

fig <- fig %>% add_trace(
  type='sunburst',
  ids=df$ids,
  labels=df$labels,
  parents=df$parents,
  domain=list(column=1),
  maxdepth=2,
  insidetextorientation='radial'
)
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-df70ce4ce9ddc92fdafb" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-df70ce4ce9ddc92fdafb">{"x":{"visdat":{"29dc768592cd":["function () ","plotlyVisDat"]},"cur_data":"29dc768592cd","attrs":{"29dc768592cd":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"sunburst","ids":["Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Harsh","Salt-Sharp","Salt-Bland","Sweet-Mellow","Sweet-Acidy","Sour-Winey","Sour-Soury","Flowery-Floral","Flowery-Fragrant","Fruity-Citrus","Fruity-Berry-like","Herby-Alliaceous","Herby-Leguminous","Nutty-Nut-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Medicinal","Spicy-Warming","Spicy-Pungent","Carbony-Smokey","Carbony-Ashy","Pungent-Creosol","Pungent-Phenolic","Harsh-Caustic","Harsh-Alkaline","Sharp-Astringent","Sharp-Rough","Bland-Neutral","Bland-Soft","Mellow-Delicate","Mellow-Mild","Acidy-Nippy","Acidy-Piquant","Winey-Tangy","Winey-Tart","Soury-Hard","Soury-Acrid","Floral-Coffee Blossom","Floral-Tea Rose","Fragrant-Cardamon Caraway","Fragrant-Coriander Seeds","Citrus-Lemon","Citrus-Apple","Berry-like-Apricot","Berry-like-Blackberry","Alliaceous-Onion","Alliaceous-Garlic","Leguminous-Cucumber","Leguminous-Garden Peas","Nut-like-Roasted Peanuts","Nut-like-Walnuts","Malt-like-Balsamic Rice","Malt-like-Toast","Candy-like-Roasted Hazelnut","Candy-like-Roasted Almond","Syrup-like-Honey","Syrup-like-Maple Syrup","Chocolate-like-Bakers","Chocolate-like-Dark Chocolate","Vanilla-like-Swiss","Vanilla-like-Butter","Turpeny-Piney","Turpeny-Blackcurrant-like","Medicinal-Camphoric","Medicinal-Cineolic","Warming-Cedar","Warming-Pepper","Pungent-Clove","Pungent-Thyme","Smokey-Tarry","Smokey-Pipe Tobacco","Ashy-Burnt","Ashy-Charred"],"labels":["Flowery","Fruity","Herby","Nutty","Carmelly","Chocolatey","Resinous","Spicy","Carbony","Pungent","Harsh","Sharp","Bland","Mellow","Acidy","Winey","Soury","Floral","Fragrant","Citrus","Berry-like","Alliaceous","Leguminous","Nut-like","Malt-like","Candy-like","Syrup-like","Chocolate-like","Vanilla-like","Turpeny","Medicinal","Warming","Pungent","Smokey","Ashy","Creosol","Phenolic","Caustic","Alkaline","Astringent","Rough","Neutral","Soft","Delicate","Mild","Nippy","Piquant","Tangy","Tart","Hard","Acrid","Coffee Blossom","Tea Rose","Cardamon Caraway","Coriander Seeds","Lemon","Apple","Apricot","Blackberry","Onion","Garlic","Cucumber","Garden Peas","Roasted Peanuts","Walnuts","Balsamic Rice","Toast","Roasted Hazelnut","Roasted Almond","Honey","Maple Syrup","Bakers","Dark Chocolate","Swiss","Butter","Piney","Blackcurrant-like","Camphoric","Cineolic","Cedar","Pepper","Clove","Thyme","Tarry","Pipe Tobacco","Burnt","Charred"],"parents":["","","","","","","","","","","","","","","","","","Enzymatic-Flowery","Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Fruity","Enzymatic-Herby","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Spicy","Dry Distillation-Carbony","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Pungent","Bitter-Harsh","Bitter-Harsh","Salt-Sharp","Salt-Sharp","Salt-Bland","Salt-Bland","Sweet-Mellow","Sweet-Mellow","Sweet-Acidy","Sweet-Acidy","Sour-Winey","Sour-Winey","Sour-Soury","Sour-Soury","Flowery-Floral","Flowery-Floral","Flowery-Fragrant","Flowery-Fragrant","Fruity-Citrus","Fruity-Citrus","Fruity-Berry-like","Fruity-Berry-like","Herby-Alliaceous","Herby-Alliaceous","Herby-Leguminous","Herby-Leguminous","Nutty-Nut-like","Nutty-Nut-like","Nutty-Malt-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Candy-like","Carmelly-Syrup-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Turpeny","Resinous-Medicinal","Resinous-Medicinal","Spicy-Warming","Spicy-Warming","Spicy-Pungent","Spicy-Pungent","Carbony-Smokey","Carbony-Smokey","Carbony-Ashy","Carbony-Ashy"],"domain":{"column":1},"maxdepth":2,"insidetextorientation":"radial","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"type":"sunburst","ids":["Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Harsh","Salt-Sharp","Salt-Bland","Sweet-Mellow","Sweet-Acidy","Sour-Winey","Sour-Soury","Flowery-Floral","Flowery-Fragrant","Fruity-Citrus","Fruity-Berry-like","Herby-Alliaceous","Herby-Leguminous","Nutty-Nut-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Medicinal","Spicy-Warming","Spicy-Pungent","Carbony-Smokey","Carbony-Ashy","Pungent-Creosol","Pungent-Phenolic","Harsh-Caustic","Harsh-Alkaline","Sharp-Astringent","Sharp-Rough","Bland-Neutral","Bland-Soft","Mellow-Delicate","Mellow-Mild","Acidy-Nippy","Acidy-Piquant","Winey-Tangy","Winey-Tart","Soury-Hard","Soury-Acrid","Floral-Coffee Blossom","Floral-Tea Rose","Fragrant-Cardamon Caraway","Fragrant-Coriander Seeds","Citrus-Lemon","Citrus-Apple","Berry-like-Apricot","Berry-like-Blackberry","Alliaceous-Onion","Alliaceous-Garlic","Leguminous-Cucumber","Leguminous-Garden Peas","Nut-like-Roasted Peanuts","Nut-like-Walnuts","Malt-like-Balsamic Rice","Malt-like-Toast","Candy-like-Roasted Hazelnut","Candy-like-Roasted Almond","Syrup-like-Honey","Syrup-like-Maple Syrup","Chocolate-like-Bakers","Chocolate-like-Dark Chocolate","Vanilla-like-Swiss","Vanilla-like-Butter","Turpeny-Piney","Turpeny-Blackcurrant-like","Medicinal-Camphoric","Medicinal-Cineolic","Warming-Cedar","Warming-Pepper","Pungent-Clove","Pungent-Thyme","Smokey-Tarry","Smokey-Pipe Tobacco","Ashy-Burnt","Ashy-Charred"],"labels":["Flowery","Fruity","Herby","Nutty","Carmelly","Chocolatey","Resinous","Spicy","Carbony","Pungent","Harsh","Sharp","Bland","Mellow","Acidy","Winey","Soury","Floral","Fragrant","Citrus","Berry-like","Alliaceous","Leguminous","Nut-like","Malt-like","Candy-like","Syrup-like","Chocolate-like","Vanilla-like","Turpeny","Medicinal","Warming","Pungent","Smokey","Ashy","Creosol","Phenolic","Caustic","Alkaline","Astringent","Rough","Neutral","Soft","Delicate","Mild","Nippy","Piquant","Tangy","Tart","Hard","Acrid","Coffee Blossom","Tea Rose","Cardamon Caraway","Coriander Seeds","Lemon","Apple","Apricot","Blackberry","Onion","Garlic","Cucumber","Garden Peas","Roasted Peanuts","Walnuts","Balsamic Rice","Toast","Roasted Hazelnut","Roasted Almond","Honey","Maple Syrup","Bakers","Dark Chocolate","Swiss","Butter","Piney","Blackcurrant-like","Camphoric","Cineolic","Cedar","Pepper","Clove","Thyme","Tarry","Pipe Tobacco","Burnt","Charred"],"parents":["","","","","","","","","","","","","","","","","","Enzymatic-Flowery","Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Fruity","Enzymatic-Herby","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Spicy","Dry Distillation-Carbony","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Pungent","Bitter-Harsh","Bitter-Harsh","Salt-Sharp","Salt-Sharp","Salt-Bland","Salt-Bland","Sweet-Mellow","Sweet-Mellow","Sweet-Acidy","Sweet-Acidy","Sour-Winey","Sour-Winey","Sour-Soury","Sour-Soury","Flowery-Floral","Flowery-Floral","Flowery-Fragrant","Flowery-Fragrant","Fruity-Citrus","Fruity-Citrus","Fruity-Berry-like","Fruity-Berry-like","Herby-Alliaceous","Herby-Alliaceous","Herby-Leguminous","Herby-Leguminous","Nutty-Nut-like","Nutty-Nut-like","Nutty-Malt-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Candy-like","Carmelly-Syrup-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Turpeny","Resinous-Medicinal","Resinous-Medicinal","Spicy-Warming","Spicy-Warming","Spicy-Pungent","Spicy-Pungent","Carbony-Smokey","Carbony-Smokey","Carbony-Ashy","Carbony-Ashy"],"domain":{"column":1},"maxdepth":2,"insidetextorientation":"radial","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(255,255,255,1)"}},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Subplots
In order to create sunburst chart subplots, we use the [domain](https://plotly.com/r/reference/#sunburst-domain) attribute and the layout [grid](https://plotly.com/r/reference/#layout-grid) attribute.

``` r
library(plotly)

d1 <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/coffee-flavors.csv')
d2 <- read.csv('https://raw.githubusercontent.com/plotly/datasets/718417069ead87650b90472464c7565dc8c2cb1c/sunburst-coffee-flavors-complete.csv')
fig <- plot_ly() 
fig <- fig %>%
  add_trace(
    ids = d1$ids,
    labels = d1$labels,
    parents = d1$parents,
    type = 'sunburst',
    maxdepth = 2,
    domain = list(column = 0)
    ) 
fig <- fig %>%
  add_trace(
    ids = d2$ids,
    labels = d2$labels,
    parents = d2$parents,
    type = 'sunburst',
    maxdepth = 3,
    domain = list(column = 1)
  ) 
fig <- fig %>%
    layout(
      grid = list(columns =2, rows = 1),
      margin = list(l = 0, r = 0, b = 0, t = 0),
      sunburstcolorway = c(
        "#636efa","#EF553B","#00cc96","#ab63fa","#19d3f3",
        "#e763fa", "#FECB52","#FFA15A","#FF6692","#B6E880"
      ),
      extendsunburstcolors = TRUE)
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-4d858e2532767142ea18" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-4d858e2532767142ea18">{"x":{"visdat":{"29dc3a8c8f26":["function () ","plotlyVisDat"]},"cur_data":"29dc3a8c8f26","attrs":{"29dc3a8c8f26":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"ids":["Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Harsh","Salt-Sharp","Salt-Bland","Sweet-Mellow","Sweet-Acidy","Sour-Winey","Sour-Soury","Flowery-Floral","Flowery-Fragrant","Fruity-Citrus","Fruity-Berry-like","Herby-Alliaceous","Herby-Leguminous","Nutty-Nut-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Medicinal","Spicy-Warming","Spicy-Pungent","Carbony-Smokey","Carbony-Ashy","Pungent-Creosol","Pungent-Phenolic","Harsh-Caustic","Harsh-Alkaline","Sharp-Astringent","Sharp-Rough","Bland-Neutral","Bland-Soft","Mellow-Delicate","Mellow-Mild","Acidy-Nippy","Acidy-Piquant","Winey-Tangy","Winey-Tart","Soury-Hard","Soury-Acrid","Floral-Coffee Blossom","Floral-Tea Rose","Fragrant-Cardamon Caraway","Fragrant-Coriander Seeds","Citrus-Lemon","Citrus-Apple","Berry-like-Apricot","Berry-like-Blackberry","Alliaceous-Onion","Alliaceous-Garlic","Leguminous-Cucumber","Leguminous-Garden Peas","Nut-like-Roasted Peanuts","Nut-like-Walnuts","Malt-like-Balsamic Rice","Malt-like-Toast","Candy-like-Roasted Hazelnut","Candy-like-Roasted Almond","Syrup-like-Honey","Syrup-like-Maple Syrup","Chocolate-like-Bakers","Chocolate-like-Dark Chocolate","Vanilla-like-Swiss","Vanilla-like-Butter","Turpeny-Piney","Turpeny-Blackcurrant-like","Medicinal-Camphoric","Medicinal-Cineolic","Warming-Cedar","Warming-Pepper","Pungent-Clove","Pungent-Thyme","Smokey-Tarry","Smokey-Pipe Tobacco","Ashy-Burnt","Ashy-Charred"],"labels":["Flowery","Fruity","Herby","Nutty","Carmelly","Chocolatey","Resinous","Spicy","Carbony","Pungent","Harsh","Sharp","Bland","Mellow","Acidy","Winey","Soury","Floral","Fragrant","Citrus","Berry-like","Alliaceous","Leguminous","Nut-like","Malt-like","Candy-like","Syrup-like","Chocolate-like","Vanilla-like","Turpeny","Medicinal","Warming","Pungent","Smokey","Ashy","Creosol","Phenolic","Caustic","Alkaline","Astringent","Rough","Neutral","Soft","Delicate","Mild","Nippy","Piquant","Tangy","Tart","Hard","Acrid","Coffee Blossom","Tea Rose","Cardamon Caraway","Coriander Seeds","Lemon","Apple","Apricot","Blackberry","Onion","Garlic","Cucumber","Garden Peas","Roasted Peanuts","Walnuts","Balsamic Rice","Toast","Roasted Hazelnut","Roasted Almond","Honey","Maple Syrup","Bakers","Dark Chocolate","Swiss","Butter","Piney","Blackcurrant-like","Camphoric","Cineolic","Cedar","Pepper","Clove","Thyme","Tarry","Pipe Tobacco","Burnt","Charred"],"parents":["","","","","","","","","","","","","","","","","","Enzymatic-Flowery","Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Fruity","Enzymatic-Herby","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Spicy","Dry Distillation-Carbony","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Pungent","Bitter-Harsh","Bitter-Harsh","Salt-Sharp","Salt-Sharp","Salt-Bland","Salt-Bland","Sweet-Mellow","Sweet-Mellow","Sweet-Acidy","Sweet-Acidy","Sour-Winey","Sour-Winey","Sour-Soury","Sour-Soury","Flowery-Floral","Flowery-Floral","Flowery-Fragrant","Flowery-Fragrant","Fruity-Citrus","Fruity-Citrus","Fruity-Berry-like","Fruity-Berry-like","Herby-Alliaceous","Herby-Alliaceous","Herby-Leguminous","Herby-Leguminous","Nutty-Nut-like","Nutty-Nut-like","Nutty-Malt-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Candy-like","Carmelly-Syrup-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Turpeny","Resinous-Medicinal","Resinous-Medicinal","Spicy-Warming","Spicy-Warming","Spicy-Pungent","Spicy-Pungent","Carbony-Smokey","Carbony-Smokey","Carbony-Ashy","Carbony-Ashy"],"type":"sunburst","maxdepth":2,"domain":{"column":0},"inherit":true},"29dc3a8c8f26.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"ids":["Aromas","Tastes","Aromas-Enzymatic","Aromas-Sugar Browning","Aromas-Dry Distillation","Tastes-Bitter","Tastes-Salt","Tastes-Sweet","Tastes-Sour","Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Harsh","Salt-Sharp","Salt-Bland","Sweet-Mellow","Sweet-Acidy","Sour-Winey","Sour-Soury","Flowery-Floral","Flowery-Fragrant","Fruity-Citrus","Fruity-Berry-like","Herby-Alliaceous","Herby-Leguminous","Nutty-Nut-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Medicinal","Spicy-Warming","Spicy-Pungent","Carbony-Smokey","Carbony-Ashy","Pungent-Creosol","Pungent-Phenolic","Harsh-Caustic","Harsh-Alkaline","Sharp-Astringent","Sharp-Rough","Bland-Neutral","Bland-Soft","Mellow-Delicate","Mellow-Mild","Acidy-Nippy","Acidy-Piquant","Winey-Tangy","Winey-Tart","Soury-Hard","Soury-Acrid","Floral-Coffee Blossom","Floral-Tea Rose","Fragrant-Cardamon Caraway","Fragrant-Coriander Seeds","Citrus-Lemon","Citrus-Apple","Berry-like-Apricot","Berry-like-Blackberry","Alliaceous-Onion","Alliaceous-Garlic","Leguminous-Cucumber","Leguminous-Garden Peas","Nut-like-Roasted Peanuts","Nut-like-Walnuts","Malt-like-Balsamic Rice","Malt-like-Toast","Candy-like-Roasted Hazelnut","Candy-like-Roasted Almond","Syrup-like-Honey","Syrup-like-Maple Syrup","Chocolate-like-Bakers","Chocolate-like-Dark Chocolate","Vanilla-like-Swiss","Vanilla-like-Butter","Turpeny-Piney","Turpeny-Blackcurrant-like","Medicinal-Camphoric","Medicinal-Cineolic","Warming-Cedar","Warming-Pepper","Pungent-Clove","Pungent-Thyme","Smokey-Tarry","Smokey-Pipe Tobacco","Ashy-Burnt","Ashy-Charred"],"labels":["Aromas","Tastes","Enzymatic","Sugar Browning","Dry Distillation","Bitter","Salt","Sweet","Sour","Flowery","Fruity","Herby","Nutty","Carmelly","Chocolatey","Resinous","Spicy","Carbony","Pungent","Harsh","Sharp","Bland","Mellow","Acidy","Winey","Soury","Floral","Fragrant","Citrus","Berry-like","Alliaceous","Leguminous","Nut-like","Malt-like","Candy-like","Syrup-like","Chocolate-like","Vanilla-like","Turpeny","Medicinal","Warming","Pungent","Smokey","Ashy","Creosol","Phenolic","Caustic","Alkaline","Astringent","Rough","Neutral","Soft","Delicate","Mild","Nippy","Piquant","Tangy","Tart","Hard","Acrid","Coffee Blossom","Tea Rose","Cardamon Caraway","Coriander Seeds","Lemon","Apple","Apricot","Blackberry","Onion","Garlic","Cucumber","Garden Peas","Roasted Peanuts","Walnuts","Balsamic Rice","Toast","Roasted Hazelnut","Roasted Almond","Honey","Maple Syrup","Bakers","Dark Chocolate","Swiss","Butter","Piney","Blackcurrant-like","Camphoric","Cineolic","Cedar","Pepper","Clove","Thyme","Tarry","Pipe Tobacco","Burnt","Charred"],"parents":["","","Aromas","Aromas","Aromas","Tastes","Tastes","Tastes","Tastes","Aromas-Enzymatic","Aromas-Enzymatic","Aromas-Enzymatic","Aromas-Sugar Browning","Aromas-Sugar Browning","Aromas-Sugar Browning","Aromas-Dry Distillation","Aromas-Dry Distillation","Aromas-Dry Distillation","Tastes-Bitter","Tastes-Bitter","Tastes-Salt","Tastes-Salt","Tastes-Sweet","Tastes-Sweet","Tastes-Sour","Tastes-Sour","Enzymatic-Flowery","Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Fruity","Enzymatic-Herby","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Spicy","Dry Distillation-Carbony","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Pungent","Bitter-Harsh","Bitter-Harsh","Salt-Sharp","Salt-Sharp","Salt-Bland","Salt-Bland","Sweet-Mellow","Sweet-Mellow","Sweet-Acidy","Sweet-Acidy","Sour-Winey","Sour-Winey","Sour-Soury","Sour-Soury","Flowery-Floral","Flowery-Floral","Flowery-Fragrant","Flowery-Fragrant","Fruity-Citrus","Fruity-Citrus","Fruity-Berry-like","Fruity-Berry-like","Herby-Alliaceous","Herby-Alliaceous","Herby-Leguminous","Herby-Leguminous","Nutty-Nut-like","Nutty-Nut-like","Nutty-Malt-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Candy-like","Carmelly-Syrup-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Turpeny","Resinous-Medicinal","Resinous-Medicinal","Spicy-Warming","Spicy-Warming","Spicy-Pungent","Spicy-Pungent","Carbony-Smokey","Carbony-Smokey","Carbony-Ashy","Carbony-Ashy"],"type":"sunburst","maxdepth":3,"domain":{"column":1},"inherit":true}},"layout":{"margin":{"b":0,"l":0,"t":0,"r":0},"grid":{"columns":2,"rows":1},"sunburstcolorway":["#636efa","#EF553B","#00cc96","#ab63fa","#19d3f3","#e763fa","#FECB52","#FFA15A","#FF6692","#B6E880"],"extendsunburstcolors":true,"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"ids":["Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Harsh","Salt-Sharp","Salt-Bland","Sweet-Mellow","Sweet-Acidy","Sour-Winey","Sour-Soury","Flowery-Floral","Flowery-Fragrant","Fruity-Citrus","Fruity-Berry-like","Herby-Alliaceous","Herby-Leguminous","Nutty-Nut-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Medicinal","Spicy-Warming","Spicy-Pungent","Carbony-Smokey","Carbony-Ashy","Pungent-Creosol","Pungent-Phenolic","Harsh-Caustic","Harsh-Alkaline","Sharp-Astringent","Sharp-Rough","Bland-Neutral","Bland-Soft","Mellow-Delicate","Mellow-Mild","Acidy-Nippy","Acidy-Piquant","Winey-Tangy","Winey-Tart","Soury-Hard","Soury-Acrid","Floral-Coffee Blossom","Floral-Tea Rose","Fragrant-Cardamon Caraway","Fragrant-Coriander Seeds","Citrus-Lemon","Citrus-Apple","Berry-like-Apricot","Berry-like-Blackberry","Alliaceous-Onion","Alliaceous-Garlic","Leguminous-Cucumber","Leguminous-Garden Peas","Nut-like-Roasted Peanuts","Nut-like-Walnuts","Malt-like-Balsamic Rice","Malt-like-Toast","Candy-like-Roasted Hazelnut","Candy-like-Roasted Almond","Syrup-like-Honey","Syrup-like-Maple Syrup","Chocolate-like-Bakers","Chocolate-like-Dark Chocolate","Vanilla-like-Swiss","Vanilla-like-Butter","Turpeny-Piney","Turpeny-Blackcurrant-like","Medicinal-Camphoric","Medicinal-Cineolic","Warming-Cedar","Warming-Pepper","Pungent-Clove","Pungent-Thyme","Smokey-Tarry","Smokey-Pipe Tobacco","Ashy-Burnt","Ashy-Charred"],"labels":["Flowery","Fruity","Herby","Nutty","Carmelly","Chocolatey","Resinous","Spicy","Carbony","Pungent","Harsh","Sharp","Bland","Mellow","Acidy","Winey","Soury","Floral","Fragrant","Citrus","Berry-like","Alliaceous","Leguminous","Nut-like","Malt-like","Candy-like","Syrup-like","Chocolate-like","Vanilla-like","Turpeny","Medicinal","Warming","Pungent","Smokey","Ashy","Creosol","Phenolic","Caustic","Alkaline","Astringent","Rough","Neutral","Soft","Delicate","Mild","Nippy","Piquant","Tangy","Tart","Hard","Acrid","Coffee Blossom","Tea Rose","Cardamon Caraway","Coriander Seeds","Lemon","Apple","Apricot","Blackberry","Onion","Garlic","Cucumber","Garden Peas","Roasted Peanuts","Walnuts","Balsamic Rice","Toast","Roasted Hazelnut","Roasted Almond","Honey","Maple Syrup","Bakers","Dark Chocolate","Swiss","Butter","Piney","Blackcurrant-like","Camphoric","Cineolic","Cedar","Pepper","Clove","Thyme","Tarry","Pipe Tobacco","Burnt","Charred"],"parents":["","","","","","","","","","","","","","","","","","Enzymatic-Flowery","Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Fruity","Enzymatic-Herby","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Spicy","Dry Distillation-Carbony","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Pungent","Bitter-Harsh","Bitter-Harsh","Salt-Sharp","Salt-Sharp","Salt-Bland","Salt-Bland","Sweet-Mellow","Sweet-Mellow","Sweet-Acidy","Sweet-Acidy","Sour-Winey","Sour-Winey","Sour-Soury","Sour-Soury","Flowery-Floral","Flowery-Floral","Flowery-Fragrant","Flowery-Fragrant","Fruity-Citrus","Fruity-Citrus","Fruity-Berry-like","Fruity-Berry-like","Herby-Alliaceous","Herby-Alliaceous","Herby-Leguminous","Herby-Leguminous","Nutty-Nut-like","Nutty-Nut-like","Nutty-Malt-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Candy-like","Carmelly-Syrup-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Turpeny","Resinous-Medicinal","Resinous-Medicinal","Spicy-Warming","Spicy-Warming","Spicy-Pungent","Spicy-Pungent","Carbony-Smokey","Carbony-Smokey","Carbony-Ashy","Carbony-Ashy"],"type":"sunburst","maxdepth":2,"domain":{"column":0},"marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(255,255,255,1)"}},"frame":null},{"ids":["Aromas","Tastes","Aromas-Enzymatic","Aromas-Sugar Browning","Aromas-Dry Distillation","Tastes-Bitter","Tastes-Salt","Tastes-Sweet","Tastes-Sour","Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Harsh","Salt-Sharp","Salt-Bland","Sweet-Mellow","Sweet-Acidy","Sour-Winey","Sour-Soury","Flowery-Floral","Flowery-Fragrant","Fruity-Citrus","Fruity-Berry-like","Herby-Alliaceous","Herby-Leguminous","Nutty-Nut-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Medicinal","Spicy-Warming","Spicy-Pungent","Carbony-Smokey","Carbony-Ashy","Pungent-Creosol","Pungent-Phenolic","Harsh-Caustic","Harsh-Alkaline","Sharp-Astringent","Sharp-Rough","Bland-Neutral","Bland-Soft","Mellow-Delicate","Mellow-Mild","Acidy-Nippy","Acidy-Piquant","Winey-Tangy","Winey-Tart","Soury-Hard","Soury-Acrid","Floral-Coffee Blossom","Floral-Tea Rose","Fragrant-Cardamon Caraway","Fragrant-Coriander Seeds","Citrus-Lemon","Citrus-Apple","Berry-like-Apricot","Berry-like-Blackberry","Alliaceous-Onion","Alliaceous-Garlic","Leguminous-Cucumber","Leguminous-Garden Peas","Nut-like-Roasted Peanuts","Nut-like-Walnuts","Malt-like-Balsamic Rice","Malt-like-Toast","Candy-like-Roasted Hazelnut","Candy-like-Roasted Almond","Syrup-like-Honey","Syrup-like-Maple Syrup","Chocolate-like-Bakers","Chocolate-like-Dark Chocolate","Vanilla-like-Swiss","Vanilla-like-Butter","Turpeny-Piney","Turpeny-Blackcurrant-like","Medicinal-Camphoric","Medicinal-Cineolic","Warming-Cedar","Warming-Pepper","Pungent-Clove","Pungent-Thyme","Smokey-Tarry","Smokey-Pipe Tobacco","Ashy-Burnt","Ashy-Charred"],"labels":["Aromas","Tastes","Enzymatic","Sugar Browning","Dry Distillation","Bitter","Salt","Sweet","Sour","Flowery","Fruity","Herby","Nutty","Carmelly","Chocolatey","Resinous","Spicy","Carbony","Pungent","Harsh","Sharp","Bland","Mellow","Acidy","Winey","Soury","Floral","Fragrant","Citrus","Berry-like","Alliaceous","Leguminous","Nut-like","Malt-like","Candy-like","Syrup-like","Chocolate-like","Vanilla-like","Turpeny","Medicinal","Warming","Pungent","Smokey","Ashy","Creosol","Phenolic","Caustic","Alkaline","Astringent","Rough","Neutral","Soft","Delicate","Mild","Nippy","Piquant","Tangy","Tart","Hard","Acrid","Coffee Blossom","Tea Rose","Cardamon Caraway","Coriander Seeds","Lemon","Apple","Apricot","Blackberry","Onion","Garlic","Cucumber","Garden Peas","Roasted Peanuts","Walnuts","Balsamic Rice","Toast","Roasted Hazelnut","Roasted Almond","Honey","Maple Syrup","Bakers","Dark Chocolate","Swiss","Butter","Piney","Blackcurrant-like","Camphoric","Cineolic","Cedar","Pepper","Clove","Thyme","Tarry","Pipe Tobacco","Burnt","Charred"],"parents":["","","Aromas","Aromas","Aromas","Tastes","Tastes","Tastes","Tastes","Aromas-Enzymatic","Aromas-Enzymatic","Aromas-Enzymatic","Aromas-Sugar Browning","Aromas-Sugar Browning","Aromas-Sugar Browning","Aromas-Dry Distillation","Aromas-Dry Distillation","Aromas-Dry Distillation","Tastes-Bitter","Tastes-Bitter","Tastes-Salt","Tastes-Salt","Tastes-Sweet","Tastes-Sweet","Tastes-Sour","Tastes-Sour","Enzymatic-Flowery","Enzymatic-Flowery","Enzymatic-Fruity","Enzymatic-Fruity","Enzymatic-Herby","Enzymatic-Herby","Sugar Browning-Nutty","Sugar Browning-Nutty","Sugar Browning-Carmelly","Sugar Browning-Carmelly","Sugar Browning-Chocolatey","Sugar Browning-Chocolatey","Dry Distillation-Resinous","Dry Distillation-Resinous","Dry Distillation-Spicy","Dry Distillation-Spicy","Dry Distillation-Carbony","Dry Distillation-Carbony","Bitter-Pungent","Bitter-Pungent","Bitter-Harsh","Bitter-Harsh","Salt-Sharp","Salt-Sharp","Salt-Bland","Salt-Bland","Sweet-Mellow","Sweet-Mellow","Sweet-Acidy","Sweet-Acidy","Sour-Winey","Sour-Winey","Sour-Soury","Sour-Soury","Flowery-Floral","Flowery-Floral","Flowery-Fragrant","Flowery-Fragrant","Fruity-Citrus","Fruity-Citrus","Fruity-Berry-like","Fruity-Berry-like","Herby-Alliaceous","Herby-Alliaceous","Herby-Leguminous","Herby-Leguminous","Nutty-Nut-like","Nutty-Nut-like","Nutty-Malt-like","Nutty-Malt-like","Carmelly-Candy-like","Carmelly-Candy-like","Carmelly-Syrup-like","Carmelly-Syrup-like","Chocolatey-Chocolate-like","Chocolatey-Chocolate-like","Chocolatey-Vanilla-like","Chocolatey-Vanilla-like","Resinous-Turpeny","Resinous-Turpeny","Resinous-Medicinal","Resinous-Medicinal","Spicy-Warming","Spicy-Warming","Spicy-Pungent","Spicy-Pungent","Carbony-Smokey","Carbony-Smokey","Carbony-Ashy","Carbony-Ashy"],"type":"sunburst","maxdepth":3,"domain":{"column":1},"marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,255,255,1)"}},"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>


#Reference

See [https://plotly.com/r/reference/#sunburst](https://plotly.com/r/reference/#sunburst) for more information and chart attribute options!

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
