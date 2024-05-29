---
description: How to make a graph with multiple axes (dual y-axis plots, plots with
  secondary axes) in R.
display_as: file_settings
language: r
layout: base
name: Multiple Axes
order: 11
output:
  html_document:
    keep_md: true
page_type: example_index
permalink: r/multiple-axes/
thumbnail: thumbnail/multiple-axes.jpg
---

### Multiple Y Axes and Plotly

## Two Y Axes


``` r
library(plotly)

fig <- plot_ly()
# Add traces
fig <- fig %>% add_trace(x = ~1:3, y = ~10*(4:6), name = "yaxis data", mode = "lines+markers", type = "scatter")

ay <- list(
  tickfont = list(color = "red"),
  overlaying = "y",
  side = "right",
  title = "<b>secondary</b> yaxis title")

fig <- fig %>% add_trace(x = ~2:4, y = ~4:6, name = "yaxis 2 data", yaxis = "y2", mode = "lines+markers", type = "scatter")

# Set figure title, x and y-axes titles
fig <- fig %>% layout(
  title = "Double Y Axis Example", yaxis2 = ay,
  xaxis = list(title="xaxis title "),
  yaxis = list(title="<b>primary</b> yaxis title")
)%>%
  layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-20ab945b20aff7cf25d6" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-20ab945b20aff7cf25d6">{"x":{"visdat":{"30934f186c3f":["function () ","plotlyVisDat"]},"cur_data":"30934f186c3f","attrs":{"30934f186c3f":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"name":"yaxis data","mode":"lines+markers","type":"scatter","inherit":true},"30934f186c3f.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"name":"yaxis 2 data","yaxis":"y2","mode":"lines+markers","type":"scatter","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Double Y Axis Example","yaxis2":{"tickfont":{"color":"red"},"overlaying":"y","side":"right","title":"<b>secondary<\/b> yaxis title"},"xaxis":{"domain":[0,1],"automargin":true,"title":"xaxis title ","zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"yaxis":{"domain":[0,1],"automargin":true,"title":"<b>primary<\/b> yaxis title","zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"plot_bgcolor":"#e5ecf6","hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[40,50,60],"name":"yaxis data","mode":"lines+markers","type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[2,3,4],"y":[4,5,6],"name":"yaxis 2 data","yaxis":"y2","mode":"lines+markers","type":"scatter","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"line":{"color":"rgba(255,127,14,1)"},"xaxis":"x","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

## Multiple axes in Dash

[Dash for R](https://dashr.plotly.com) is an open-source framework for building analytical applications, with no Javascript required, and it is tightly integrated with the Plotly graphing library.

Learn about how to install Dash for R at https://dashr.plot.ly/installation.

Everywhere in this page that you see fig, you can display the same figure in a Dash for R application by passing it to the figure argument.


``` r
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(plotly)

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccGraph(id = 'graph'),
      htmlLabel("Red line's axis:"),
      dccRadioItems(
        id='radio',
        options = list(list(label = "Primary", value = "Primary"),
                       list(label = "Secondary", value = "Secondary")),
        value = 'Secondary'
      )
    )
  )
)
app$callback(
  output(id = 'graph', property='figure'),
  params=list(input(id='radio', property='value')),
  function(value) {
    if(value == 'Primary'){
      fig <- plot_ly()
      fig <- fig %>% add_trace(x = ~1:3, y = ~10*(4:6), name = "yaxis data", mode = "lines+markers", type = "scatter")
      fig <- fig %>% add_trace(x = ~2:4, y = ~4:6, name = "yaxis 2 data", mode = "lines+markers", type = "scatter")
      fig <- fig %>% layout(
        title = "Double Y Axis Example",
        xaxis = list(title="xaxis title"),
        yaxis = list(title="<b>primary</b> yaxis title")
      )%>%
        layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
      return(fig)
    }
    else{
      fig <- plot_ly()
      fig <- fig %>% add_trace(x = ~1:3, y = ~10*(4:6), name = "yaxis data", mode = "lines+markers", type = "scatter")

      ay <- list(
        overlaying = "y",
        side = "right",
        title = "<b>secondary</b> yaxis title")

      fig <- fig %>% add_trace(x = ~2:4, y = ~4:6, name = "yaxis 2 data", yaxis = "y2", mode = "lines+markers", type = "scatter")

      fig <- fig %>% layout(
        title = "Double Y Axis Example", yaxis2 = ay,
        xaxis = list(title="xaxis title"),
        yaxis = list(title="<b>primary</b> yaxis title")
      )%>%
        layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
      return(fig)
    }
  })
#app$run_server()
```

Use `app$run_server()` to run the dash file.

## Multiple Y-Axes Subplots


``` r
library(plotly)
# Top left
p1 <- plot_ly() %>%
  add_trace(x = c(1, 2, 3), y = c(2, 52, 62),
                              type="scatter",mode="lines+markers",yaxis="y", name="yaxis data") %>%
  add_trace(x = c(1, 2, 3), y = c(40, 50, 60),
            type="scatter",mode="lines+markers",yaxis="y2", name="yaxis2 data") %>%
  layout(yaxis=list(side="left"),
         yaxis2=list(side="right",overlaying="y"),
         showlegend=TRUE)
# Top right
p2 <-plot_ly() %>%
  add_trace(x = c(1, 2, 3), y = c(2, 52, 62),
                             type="scatter",mode="lines+markers",yaxis="y", name="yaxis3 data") %>%
  add_trace(x = c(1, 2, 3), y = c(40, 50, 60),
            type="scatter",mode="lines+markers",yaxis="y2", name="yaxis4 data") %>%
  layout(yaxis=list(side="left"),
         yaxis2=list(side="right",overlaying="y3"),
         showlegend=TRUE)
# Bottom left
p3 <- plot_ly() %>%
  add_trace(x = c(1, 2, 3), y = c(2, 52, 62),
            type="scatter",mode="lines+markers",yaxis="y", name="yaxis5 data") %>%
  add_trace(x = c(1, 2, 3), y = c(40, 50, 60),
            type="scatter",mode="lines+markers",yaxis="y2", name="yaxis6 data") %>%
  layout(yaxis=list(side="left"),
         yaxis2=list(side="right",overlaying="y5"),
         showlegend=TRUE)
# Bottom right
p4 <-plot_ly() %>%
  add_trace(x = c(1, 2, 3), y = c(2, 52, 62),
                             type="scatter",mode="lines+markers",yaxis="y", name="yaxis7 data") %>%
  add_trace(x = c(1, 2, 3), y = c(40, 50, 60),
            type="scatter",mode="lines+markers",yaxis="y2", name="yaxis8 data") %>%
  layout(yaxis=list(side="left"),
         yaxis2=list(side="right",overlaying="y7"),
         showlegend=TRUE)

p <- subplot(p1,p2,p3,p4,nrows = 2, margin = 0.05)%>%
  layout(legend = list(x = 1.05, y = 1))%>%
  layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
p
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-ae7e4223efc05fbaaa76" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-ae7e4223efc05fbaaa76">{"x":{"data":[{"x":[1,2,3],"y":[2,52,62],"type":"scatter","mode":"lines+markers","yaxis":"y","name":"yaxis data","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","frame":null},{"x":[1,2,3],"y":[40,50,60],"type":"scatter","mode":"lines+markers","yaxis":"y2","name":"yaxis2 data","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"line":{"color":"rgba(255,127,14,1)"},"xaxis":"x","frame":null},{"x":[1,2,3],"y":[2,52,62],"type":"scatter","mode":"lines+markers","yaxis":"y3","name":"yaxis3 data","marker":{"color":"rgba(44,160,44,1)","line":{"color":"rgba(44,160,44,1)"}},"error_y":{"color":"rgba(44,160,44,1)"},"error_x":{"color":"rgba(44,160,44,1)"},"line":{"color":"rgba(44,160,44,1)"},"xaxis":"x2","frame":null},{"x":[1,2,3],"y":[40,50,60],"type":"scatter","mode":"lines+markers","yaxis":"y4","name":"yaxis4 data","marker":{"color":"rgba(214,39,40,1)","line":{"color":"rgba(214,39,40,1)"}},"error_y":{"color":"rgba(214,39,40,1)"},"error_x":{"color":"rgba(214,39,40,1)"},"line":{"color":"rgba(214,39,40,1)"},"xaxis":"x2","frame":null},{"x":[1,2,3],"y":[2,52,62],"type":"scatter","mode":"lines+markers","yaxis":"y5","name":"yaxis5 data","marker":{"color":"rgba(148,103,189,1)","line":{"color":"rgba(148,103,189,1)"}},"error_y":{"color":"rgba(148,103,189,1)"},"error_x":{"color":"rgba(148,103,189,1)"},"line":{"color":"rgba(148,103,189,1)"},"xaxis":"x3","frame":null},{"x":[1,2,3],"y":[40,50,60],"type":"scatter","mode":"lines+markers","yaxis":"y6","name":"yaxis6 data","marker":{"color":"rgba(140,86,75,1)","line":{"color":"rgba(140,86,75,1)"}},"error_y":{"color":"rgba(140,86,75,1)"},"error_x":{"color":"rgba(140,86,75,1)"},"line":{"color":"rgba(140,86,75,1)"},"xaxis":"x3","frame":null},{"x":[1,2,3],"y":[2,52,62],"type":"scatter","mode":"lines+markers","yaxis":"y7","name":"yaxis7 data","marker":{"color":"rgba(227,119,194,1)","line":{"color":"rgba(227,119,194,1)"}},"error_y":{"color":"rgba(227,119,194,1)"},"error_x":{"color":"rgba(227,119,194,1)"},"line":{"color":"rgba(227,119,194,1)"},"xaxis":"x4","frame":null},{"x":[1,2,3],"y":[40,50,60],"type":"scatter","mode":"lines+markers","yaxis":"y8","name":"yaxis8 data","marker":{"color":"rgba(127,127,127,1)","line":{"color":"rgba(127,127,127,1)"}},"error_y":{"color":"rgba(127,127,127,1)"},"error_x":{"color":"rgba(127,127,127,1)"},"line":{"color":"rgba(127,127,127,1)"},"xaxis":"x4","frame":null}],"layout":{"xaxis":{"domain":[0,0.45000000000000001],"automargin":true,"anchor":"y","zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"xaxis2":{"domain":[0.55000000000000004,1],"automargin":true,"anchor":"y3"},"xaxis3":{"domain":[0,0.45000000000000001],"automargin":true,"anchor":"y5"},"xaxis4":{"domain":[0.55000000000000004,1],"automargin":true,"anchor":"y7"},"yaxis7":{"domain":[0,0.45000000000000001],"automargin":true,"side":"left","anchor":"x4"},"yaxis8":{"side":"right","overlaying":"y7","anchor":"x4","domain":[0,0.45000000000000001]},"yaxis5":{"domain":[0,0.45000000000000001],"automargin":true,"side":"left","anchor":"x3"},"yaxis6":{"side":"right","overlaying":"y5","anchor":"x3","domain":[0,0.45000000000000001]},"yaxis3":{"domain":[0.55000000000000004,1],"automargin":true,"side":"left","anchor":"x2"},"yaxis4":{"side":"right","overlaying":"y3","anchor":"x2","domain":[0.55000000000000004,1]},"yaxis":{"domain":[0.55000000000000004,1],"automargin":true,"side":"left","anchor":"x","zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"yaxis2":{"side":"right","overlaying":"y","anchor":"x","domain":[0.55000000000000004,1]},"annotations":[],"shapes":[],"images":[],"margin":{"b":40,"l":60,"t":25,"r":10},"showlegend":true,"hovermode":"closest","legend":{"x":1.05,"y":1},"plot_bgcolor":"#e5ecf6"},"attrs":{"30932acd4c6b":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[2,52,62],"type":"scatter","mode":"lines+markers","yaxis":"y","name":"yaxis data","inherit":true},"30932acd4c6b.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[40,50,60],"type":"scatter","mode":"lines+markers","yaxis":"y2","name":"yaxis2 data","inherit":true},"3093440a85e8":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[2,52,62],"type":"scatter","mode":"lines+markers","yaxis":"y","name":"yaxis3 data","inherit":true},"3093440a85e8.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[40,50,60],"type":"scatter","mode":"lines+markers","yaxis":"y2","name":"yaxis4 data","inherit":true},"3093166cde80":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[2,52,62],"type":"scatter","mode":"lines+markers","yaxis":"y","name":"yaxis5 data","inherit":true},"3093166cde80.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[40,50,60],"type":"scatter","mode":"lines+markers","yaxis":"y2","name":"yaxis6 data","inherit":true},"309350d83121":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[2,52,62],"type":"scatter","mode":"lines+markers","yaxis":"y","name":"yaxis7 data","inherit":true},"309350d83121.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[40,50,60],"type":"scatter","mode":"lines+markers","yaxis":"y2","name":"yaxis8 data","inherit":true}},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"subplot":true,"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

## Multiple Axes

Using Plotly for creating a figure with multiple axes


``` r
library(plotly)

fig <- plot_ly(width = 700)
fig <- fig %>% add_trace(x = ~1:3, y = ~4:6, name = "yaxis1 data", mode = "lines+markers", type = "scatter")

y2 <- list(
  tickfont = list(color = "#ff7f0e"),
  titlefont = list(color = "#ff7f0e"),
  overlaying = "y",
  side = "left",
  anchor="free",
  position=0.15,
  title = "yaxis2 title")


fig <- fig %>% add_trace(x = ~2:4, y = ~10*(4:6), name = "yaxis2 data", yaxis = "y2", mode = "lines+markers", type = "scatter")

y3 <- list(
  tickfont = list(color = "#d62728"),
  titlefont = list(color = "#d62728"),
  overlaying = "y",
  side = "right",
  title = "yaxis3 title")


fig <- fig %>% add_trace(x = ~4:6, y = ~1000*(4:6), name = "yaxis3 data", yaxis = "y3", mode = "lines+markers", type = "scatter")

y4 <- list(
  tickfont = list(color = "#9467bd"),
  titlefont = list(color = "#9467bd"),
  overlaying = "y",
  side = "right",
  anchor="free",
  position=0.85,
  title = "yaxis4 title")


fig <- fig %>% add_trace(x = ~5:7, y = ~10000*(4:6), name = "yaxis4 data", yaxis = "y4", mode = "lines+markers", type = "scatter")

fig <- fig %>% layout(
  title = "multiple y-axes example", yaxis2 = y2, yaxis3 = y3, yaxis4 = y4,
  xaxis = list(title = '', domain = c(0.3, 0.7)),
  yaxis = list(title="yaxis title",
               tickfont = list(color = "#1f77b4"),
               titlefont = list(color = "#1f77b4")
               )
)%>%
  layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )

fig
```

<div id="htmlwidget-5afdec69d4215b066600" style="width:700px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-5afdec69d4215b066600">{"x":{"visdat":{"309361186a3e":["function () ","plotlyVisDat"]},"cur_data":"309361186a3e","attrs":{"309361186a3e":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"name":"yaxis1 data","mode":"lines+markers","type":"scatter","inherit":true},"309361186a3e.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"name":"yaxis2 data","yaxis":"y2","mode":"lines+markers","type":"scatter","inherit":true},"309361186a3e.2":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"name":"yaxis3 data","yaxis":"y3","mode":"lines+markers","type":"scatter","inherit":true},"309361186a3e.3":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"name":"yaxis4 data","yaxis":"y4","mode":"lines+markers","type":"scatter","inherit":true}},"layout":{"width":700,"margin":{"b":40,"l":60,"t":25,"r":10},"title":"multiple y-axes example","yaxis2":{"tickfont":{"color":"#ff7f0e"},"titlefont":{"color":"#ff7f0e"},"overlaying":"y","side":"left","anchor":"free","position":0.14999999999999999,"title":"yaxis2 title"},"yaxis3":{"tickfont":{"color":"#d62728"},"titlefont":{"color":"#d62728"},"overlaying":"y","side":"right","title":"yaxis3 title"},"yaxis4":{"tickfont":{"color":"#9467bd"},"titlefont":{"color":"#9467bd"},"overlaying":"y","side":"right","anchor":"free","position":0.84999999999999998,"title":"yaxis4 title"},"xaxis":{"domain":[0.29999999999999999,0.69999999999999996],"automargin":true,"title":"","zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"yaxis":{"domain":[0,1],"automargin":true,"title":"yaxis title","tickfont":{"color":"#1f77b4"},"titlefont":{"color":"#1f77b4"},"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"plot_bgcolor":"#e5ecf6","hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[4,5,6],"name":"yaxis1 data","mode":"lines+markers","type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[2,3,4],"y":[40,50,60],"name":"yaxis2 data","yaxis":"y2","mode":"lines+markers","type":"scatter","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"line":{"color":"rgba(255,127,14,1)"},"xaxis":"x","frame":null},{"x":[4,5,6],"y":[4000,5000,6000],"name":"yaxis3 data","yaxis":"y3","mode":"lines+markers","type":"scatter","marker":{"color":"rgba(44,160,44,1)","line":{"color":"rgba(44,160,44,1)"}},"error_y":{"color":"rgba(44,160,44,1)"},"error_x":{"color":"rgba(44,160,44,1)"},"line":{"color":"rgba(44,160,44,1)"},"xaxis":"x","frame":null},{"x":[5,6,7],"y":[40000,50000,60000],"name":"yaxis4 data","yaxis":"y4","mode":"lines+markers","type":"scatter","marker":{"color":"rgba(214,39,40,1)","line":{"color":"rgba(214,39,40,1)"}},"error_y":{"color":"rgba(214,39,40,1)"},"error_x":{"color":"rgba(214,39,40,1)"},"line":{"color":"rgba(214,39,40,1)"},"xaxis":"x","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Reference
All of the y-axis properties are found here: https://plotly.com/r/reference/layout/yaxis/.  For more information on creating subplots see the [Subplots in R](https://plotly.com/r/subplot-charts/) section.

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