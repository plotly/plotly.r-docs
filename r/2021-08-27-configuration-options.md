---
description: How to set the configuration options of figures using the Plotly R graphing
  library.
display_as: file_settings
language: r
layout: base
name: Configuration
order: 5
output:
  html_document:
    keep_md: true
page_type: u-guide
permalink: r/configuration-options/
thumbnail: thumbnail/modebar-icons.png
---

## Configuration Options

The `config()` method sets the configuration options for your figure.

You can set the configuration options for your figure by passing a list to this parameter which contains the options you want to set.

If you don't set an option's value, it will automatically be set to the default value for that option.

For the complete list of configuration options and their defaults see: https://github.com/plotly/plotly.js/blob/master/src/plot_api/plot_config.js

### Enabling Scroll Zoom

This option allows users to zoom in and out of figures using the scroll wheel on their mouse and/or a two-finger scroll.


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'scatter', mode = 'lines+markers')
config(fig, scrollZoom = TRUE)%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-0abb7569f6ff35b37346" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-0abb7569f6ff35b37346">{"x":{"visdat":{"339b77b2f5ba":["function () ","plotlyVisDat"]},"cur_data":"339b77b2f5ba","attrs":{"339b77b2f5ba":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"scrollZoom":true},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Turning Off Responsiveness

By default, figures you create with the `plotly` package are [responsive](https://en.wikipedia.org/wiki/Responsive_web_design). Responsive figures automatically change their height and width when the size of the window they are displayed in changes. This is true for figures which are displayed in web browsers on desktops and mobile, Jupyter Notebooks, and other rendering environments.

Try resizing your browser window to see this behavior in effect on this page.

If you would like to disable this default behavior and force your figures to always have the same height and width regardless of the window size, set the value of the `responsive` key to `FALSE` in your figure's configuration dictionary.


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'scatter', mode = 'lines+markers')
config(fig, responsive = FALSE)%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-831ae8ef0ea97c3fb16b" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-831ae8ef0ea97c3fb16b">{"x":{"visdat":{"339bffafbc1":["function () ","plotlyVisDat"]},"cur_data":"339bffafbc1","attrs":{"339bffafbc1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"responsive":false},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Making A Static Chart


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'scatter', mode = 'lines+markers')
config(fig, staticPlot = TRUE)%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-75cb147d03393218aff9" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-75cb147d03393218aff9">{"x":{"visdat":{"339b37ff0675":["function () ","plotlyVisDat"]},"cur_data":"339b37ff0675","attrs":{"339b37ff0675":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"staticPlot":true},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Forcing The Modebar to Always Be Visible

When users hover over a figure generated with `plotly`, a **modebar** appears in the top-right of the figure. This presents users with several options for interacting with the figure.

By default, the modebar is only visible while the user is hovering over the chart. If you would like the modebar to always be visible regardless of whether or not the user is currently hovering over the figure, set the displayModeBar attribute in the configuration of your figure to true.


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'scatter', mode = 'lines+markers')
config(fig, displayModeBar = TRUE)%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-641dfc0654e30bce4a99" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-641dfc0654e30bce4a99">{"x":{"visdat":{"339b3fee19ee":["function () ","plotlyVisDat"]},"cur_data":"339b3fee19ee","attrs":{"339b3fee19ee":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"displayModeBar":true},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Preventing the Modebar from Appearing

When users hover over a figure generated with `plotly`, a modebar appears in the top-right of the figure. This presents users with several options for interacting with the figure.

By default, the modebar is only visible while the user is hovering over the chart. If you would like the modebar to never be visible, then set the `displayModeBar` attribute in the config of your figure to FALSE.


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'scatter', mode = 'lines+markers')
config(fig, displayModeBar = FALSE)%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-6ae70becb2dbbf2d13af" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-6ae70becb2dbbf2d13af">{"x":{"visdat":{"339b44530dac":["function () ","plotlyVisDat"]},"cur_data":"339b44530dac","attrs":{"339b44530dac":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"displayModeBar":false},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>


### Hiding the Plotly Logo on the Modebar


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'scatter', mode = 'lines+markers')
config(fig, displaylogo = FALSE)%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-0f37372e7736464bf7d5" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-0f37372e7736464bf7d5">{"x":{"visdat":{"339b2e631b69":["function () ","plotlyVisDat"]},"cur_data":"339b2e631b69","attrs":{"339b2e631b69":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"displaylogo":false},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Customizing Modebar "Download Plot" Button

The camera icon on the modebar causes a static version of the figure to be downloaded via the user's browser. The default behaviour is to download a PNG of size 700 by 450 pixels.

This behavior can be controlled via the `toImageButtonOptions` configuration key.


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'bar')
config(fig, toImageButtonOptions = list(format= 'svg', # one of png, svg, jpeg, webp
                                        filename= 'custom_image',
                                        height= 500,
                                        width= 700,
                                        scale= 1 ))%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-a1c92cd82fdfe1d0299d" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-a1c92cd82fdfe1d0299d">{"x":{"visdat":{"339b43268766":["function () ","plotlyVisDat"]},"cur_data":"339b43268766","attrs":{"339b43268766":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"toImageButtonOptions":{"format":"svg","filename":"custom_image","height":500,"width":700,"scale":1}},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

Figures can be set to download at the currently-rendered size by setting `height` and `width` to `NULL`:



``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'bar')
config(fig, toImageButtonOptions = list(height= NULL,
                                        width= NULL))%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-8b38fe8197577aef98ec" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-8b38fe8197577aef98ec">{"x":{"visdat":{"339b47962a08":["function () ","plotlyVisDat"]},"cur_data":"339b47962a08","attrs":{"339b47962a08":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"toImageButtonOptions":{"height":null,"width":null}},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Removing Modebar Buttons

To delete buttons from the modebar, pass an array of strings containing the names of the buttons you want to remove to the `modeBarButtonsToRemove` attribute in the figure's configuration dictionary. Note that different chart types have different default modebars. The following is a list of all the modebar buttons and the chart types they are associated with:

  - **High-level**: `zoom`, `pan`, `select`, `zoomIn`, `zoomOut`, `autoScale`, `resetScale`
  - **2D**: `zoom2d`, `pan2d`, `select2d`, `lasso2d`, `zoomIn2d`, `zoomOut2d`, `autoScale2d`, `resetScale2d`
  - **2D Shape Drawing**: `drawline`, `drawopenpath`, `drawclosedpath`, `drawcircle`, `drawrect`, `eraseshape`
  - **3D**: `zoom3d`, `pan3d`, `orbitRotation`, `tableRotation`, `handleDrag3d`, `resetCameraDefault3d`, `resetCameraLastSave3d`, `hoverClosest3d`
  - **Cartesian**: `hoverClosestCartesian`, `hoverCompareCartesian`
  - **Geo**: `zoomInGeo`, `zoomOutGeo`, `resetGeo`, `hoverClosestGeo`
  - **Other**: `hoverClosestGl2d`, `hoverClosestPie`, `toggleHover`, `resetViews`, `toImage`, `sendDataToCloud`, `toggleSpikelines`, `resetViewMapbox`


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'scatter', mode = 'lines+markers')
config(fig, modeBarButtonsToRemove = c('zoom2d','pan2d'))%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-ec0aa681158d019e97fb" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-ec0aa681158d019e97fb">{"x":{"visdat":{"339b489c330a":["function () ","plotlyVisDat"]},"cur_data":"339b489c330a","attrs":{"339b489c330a":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"modeBarButtonsToRemove":["zoom2d","pan2d"]},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

You can also use a pipe instead of the approach used above:


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 1), type = 'scatter', mode = 'lines+markers')%>%
  config(modeBarButtonsToRemove = c('zoom2d','pan2d'))%>%layout(plot_bgcolor='#e5ecf6',
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

<div class="plotly html-widget html-fill-item" id="htmlwidget-9863ae3c1129172e617b" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-9863ae3c1129172e617b">{"x":{"visdat":{"339b2be45576":["function () ","plotlyVisDat"]},"cur_data":"339b2be45576","attrs":{"339b2be45576":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"modeBarButtonsToRemove":["zoom2d","pan2d"]},"data":[{"x":[1,2,3],"y":[1,3,1],"type":"scatter","mode":"lines+markers","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Add optional shape-drawing buttons to modebar

Some modebar buttons of Cartesian plots are optional and have to be added explicitly, using the `modeBarButtonsToAdd` config attribute. These buttons are used for drawing or erasing shapes. See [the tutorial on shapes and shape drawing](https://plotly.com/r/shapes/#drawing-shapes-on-cartesian-plots) for more details.


``` r
library(plotly) 
data(iris) 
 
fig <- plot_ly(data = iris, x = ~Petal.Width, y = ~Sepal.Length, color = ~Species,  
               type = "scatter", mode = "markers")%>% 
  layout(title="A Plotly Figure", legend=list(title=list(text='species'))) 
 
fig <- fig %>% layout(dragmode='drawopenpath', 
                      newshape=list(line = list(color='cyan')), 
                      title = 'Draw a path to separate versicolor and virginica') 
 
#Add modebar buttons 
config(fig,modeBarButtonsToAdd = list('drawline', 
                                 'drawopenpath', 
                                 'drawclosedpath', 
                                 'drawcircle', 
                                 'drawrect', 
                                 'eraseshape')) %>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-99ec2789763a65147ecb" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-99ec2789763a65147ecb">{"x":{"visdat":{"339b15940268":["function () ","plotlyVisDat"]},"cur_data":"339b15940268","attrs":{"339b15940268":{"x":{},"y":{},"mode":"markers","color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Draw a path to separate versicolor and virginica","legend":{"title":{"text":"species"}},"dragmode":"drawopenpath","newshape":{"line":{"color":"cyan"}},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":"Petal.Width"},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":"Sepal.Length"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["drawline","drawopenpath","drawclosedpath","drawcircle","drawrect","eraseshape","hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.40000000000000002,0.29999999999999999,0.20000000000000001,0.20000000000000001,0.10000000000000001,0.20000000000000001,0.20000000000000001,0.10000000000000001,0.10000000000000001,0.20000000000000001,0.40000000000000002,0.40000000000000002,0.29999999999999999,0.29999999999999999,0.29999999999999999,0.20000000000000001,0.40000000000000002,0.20000000000000001,0.5,0.20000000000000001,0.20000000000000001,0.40000000000000002,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.40000000000000002,0.10000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.10000000000000001,0.20000000000000001,0.20000000000000001,0.29999999999999999,0.29999999999999999,0.20000000000000001,0.59999999999999998,0.40000000000000002,0.29999999999999999,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001],"y":[5.0999999999999996,4.9000000000000004,4.7000000000000002,4.5999999999999996,5,5.4000000000000004,4.5999999999999996,5,4.4000000000000004,4.9000000000000004,5.4000000000000004,4.7999999999999998,4.7999999999999998,4.2999999999999998,5.7999999999999998,5.7000000000000002,5.4000000000000004,5.0999999999999996,5.7000000000000002,5.0999999999999996,5.4000000000000004,5.0999999999999996,4.5999999999999996,5.0999999999999996,4.7999999999999998,5,5,5.2000000000000002,5.2000000000000002,4.7000000000000002,4.7999999999999998,5.4000000000000004,5.2000000000000002,5.5,4.9000000000000004,5,5.5,4.9000000000000004,4.4000000000000004,5.0999999999999996,5,4.5,4.4000000000000004,5,5.0999999999999996,4.7999999999999998,5.0999999999999996,4.5999999999999996,5.2999999999999998,5],"mode":"markers","type":"scatter","name":"setosa","marker":{"color":"rgba(102,194,165,1)","line":{"color":"rgba(102,194,165,1)"}},"textfont":{"color":"rgba(102,194,165,1)"},"error_y":{"color":"rgba(102,194,165,1)"},"error_x":{"color":"rgba(102,194,165,1)"},"line":{"color":"rgba(102,194,165,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[1.3999999999999999,1.5,1.5,1.3,1.5,1.3,1.6000000000000001,1,1.3,1.3999999999999999,1,1.5,1,1.3999999999999999,1.3,1.3999999999999999,1.5,1,1.5,1.1000000000000001,1.8,1.3,1.5,1.2,1.3,1.3999999999999999,1.3999999999999999,1.7,1.5,1,1.1000000000000001,1,1.2,1.6000000000000001,1.5,1.6000000000000001,1.5,1.3,1.3,1.3,1.2,1.3999999999999999,1.2,1,1.3,1.2,1.3,1.3,1.1000000000000001,1.3],"y":[7,6.4000000000000004,6.9000000000000004,5.5,6.5,5.7000000000000002,6.2999999999999998,4.9000000000000004,6.5999999999999996,5.2000000000000002,5,5.9000000000000004,6,6.0999999999999996,5.5999999999999996,6.7000000000000002,5.5999999999999996,5.7999999999999998,6.2000000000000002,5.5999999999999996,5.9000000000000004,6.0999999999999996,6.2999999999999998,6.0999999999999996,6.4000000000000004,6.5999999999999996,6.7999999999999998,6.7000000000000002,6,5.7000000000000002,5.5,5.5,5.7999999999999998,6,5.4000000000000004,6,6.7000000000000002,6.2999999999999998,5.5999999999999996,5.5,5.5,6.0999999999999996,5.7999999999999998,5,5.5999999999999996,5.7000000000000002,5.7000000000000002,6.2000000000000002,5.0999999999999996,5.7000000000000002],"mode":"markers","type":"scatter","name":"versicolor","marker":{"color":"rgba(252,141,98,1)","line":{"color":"rgba(252,141,98,1)"}},"textfont":{"color":"rgba(252,141,98,1)"},"error_y":{"color":"rgba(252,141,98,1)"},"error_x":{"color":"rgba(252,141,98,1)"},"line":{"color":"rgba(252,141,98,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[2.5,1.8999999999999999,2.1000000000000001,1.8,2.2000000000000002,2.1000000000000001,1.7,1.8,1.8,2.5,2,1.8999999999999999,2.1000000000000001,2,2.3999999999999999,2.2999999999999998,1.8,2.2000000000000002,2.2999999999999998,1.5,2.2999999999999998,2,2,1.8,2.1000000000000001,1.8,1.8,1.8,2.1000000000000001,1.6000000000000001,1.8999999999999999,2,2.2000000000000002,1.5,1.3999999999999999,2.2999999999999998,2.3999999999999999,1.8,1.8,2.1000000000000001,2.3999999999999999,2.2999999999999998,1.8999999999999999,2.2999999999999998,2.5,2.2999999999999998,1.8999999999999999,2,2.2999999999999998,1.8],"y":[6.2999999999999998,5.7999999999999998,7.0999999999999996,6.2999999999999998,6.5,7.5999999999999996,4.9000000000000004,7.2999999999999998,6.7000000000000002,7.2000000000000002,6.5,6.4000000000000004,6.7999999999999998,5.7000000000000002,5.7999999999999998,6.4000000000000004,6.5,7.7000000000000002,7.7000000000000002,6,6.9000000000000004,5.5999999999999996,7.7000000000000002,6.2999999999999998,6.7000000000000002,7.2000000000000002,6.2000000000000002,6.0999999999999996,6.4000000000000004,7.2000000000000002,7.4000000000000004,7.9000000000000004,6.4000000000000004,6.2999999999999998,6.0999999999999996,7.7000000000000002,6.2999999999999998,6.4000000000000004,6,6.9000000000000004,6.7000000000000002,6.9000000000000004,5.7999999999999998,6.7999999999999998,6.7000000000000002,6.7000000000000002,6.2999999999999998,6.5,6.2000000000000002,5.9000000000000004],"mode":"markers","type":"scatter","name":"virginica","marker":{"color":"rgba(141,160,203,1)","line":{"color":"rgba(141,160,203,1)"}},"textfont":{"color":"rgba(141,160,203,1)"},"error_y":{"color":"rgba(141,160,203,1)"},"error_x":{"color":"rgba(141,160,203,1)"},"line":{"color":"rgba(141,160,203,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

You can also use a pipe instead of the approach used above:


``` r
library(plotly) 
data(iris) 
 
fig <- plot_ly(data = iris, x = ~Petal.Width, y = ~Sepal.Length, color = ~Species,  
               type = "scatter", mode = "markers")%>% 
  layout(title="A Plotly Figure", legend=list(title=list(text='species'))) 
 
fig <- fig %>% layout(dragmode='drawopenpath', 
                      newshape=list(line = list(color='cyan')), 
                      title = 'Draw a path to separate versicolor and virginica') 
 
#Add modebar buttons 
fig <- fig %>%  
  config(modeBarButtonsToAdd = c('drawline', 
                                 'drawopenpath', 
                                 'drawclosedpath', 
                                 'drawcircle', 
                                 'drawrect', 
                                 'eraseshape')) %>%layout(plot_bgcolor='#e5ecf6',
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

<div class="plotly html-widget html-fill-item" id="htmlwidget-288e18c7703c7f434913" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-288e18c7703c7f434913">{"x":{"visdat":{"339b5a6fe132":["function () ","plotlyVisDat"]},"cur_data":"339b5a6fe132","attrs":{"339b5a6fe132":{"x":{},"y":{},"mode":"markers","color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Draw a path to separate versicolor and virginica","legend":{"title":{"text":"species"}},"dragmode":"drawopenpath","newshape":{"line":{"color":"cyan"}},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":"Petal.Width"},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":"Sepal.Length"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["drawline","drawopenpath","drawclosedpath","drawcircle","drawrect","eraseshape","hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.40000000000000002,0.29999999999999999,0.20000000000000001,0.20000000000000001,0.10000000000000001,0.20000000000000001,0.20000000000000001,0.10000000000000001,0.10000000000000001,0.20000000000000001,0.40000000000000002,0.40000000000000002,0.29999999999999999,0.29999999999999999,0.29999999999999999,0.20000000000000001,0.40000000000000002,0.20000000000000001,0.5,0.20000000000000001,0.20000000000000001,0.40000000000000002,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.40000000000000002,0.10000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.10000000000000001,0.20000000000000001,0.20000000000000001,0.29999999999999999,0.29999999999999999,0.20000000000000001,0.59999999999999998,0.40000000000000002,0.29999999999999999,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001],"y":[5.0999999999999996,4.9000000000000004,4.7000000000000002,4.5999999999999996,5,5.4000000000000004,4.5999999999999996,5,4.4000000000000004,4.9000000000000004,5.4000000000000004,4.7999999999999998,4.7999999999999998,4.2999999999999998,5.7999999999999998,5.7000000000000002,5.4000000000000004,5.0999999999999996,5.7000000000000002,5.0999999999999996,5.4000000000000004,5.0999999999999996,4.5999999999999996,5.0999999999999996,4.7999999999999998,5,5,5.2000000000000002,5.2000000000000002,4.7000000000000002,4.7999999999999998,5.4000000000000004,5.2000000000000002,5.5,4.9000000000000004,5,5.5,4.9000000000000004,4.4000000000000004,5.0999999999999996,5,4.5,4.4000000000000004,5,5.0999999999999996,4.7999999999999998,5.0999999999999996,4.5999999999999996,5.2999999999999998,5],"mode":"markers","type":"scatter","name":"setosa","marker":{"color":"rgba(102,194,165,1)","line":{"color":"rgba(102,194,165,1)"}},"textfont":{"color":"rgba(102,194,165,1)"},"error_y":{"color":"rgba(102,194,165,1)"},"error_x":{"color":"rgba(102,194,165,1)"},"line":{"color":"rgba(102,194,165,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[1.3999999999999999,1.5,1.5,1.3,1.5,1.3,1.6000000000000001,1,1.3,1.3999999999999999,1,1.5,1,1.3999999999999999,1.3,1.3999999999999999,1.5,1,1.5,1.1000000000000001,1.8,1.3,1.5,1.2,1.3,1.3999999999999999,1.3999999999999999,1.7,1.5,1,1.1000000000000001,1,1.2,1.6000000000000001,1.5,1.6000000000000001,1.5,1.3,1.3,1.3,1.2,1.3999999999999999,1.2,1,1.3,1.2,1.3,1.3,1.1000000000000001,1.3],"y":[7,6.4000000000000004,6.9000000000000004,5.5,6.5,5.7000000000000002,6.2999999999999998,4.9000000000000004,6.5999999999999996,5.2000000000000002,5,5.9000000000000004,6,6.0999999999999996,5.5999999999999996,6.7000000000000002,5.5999999999999996,5.7999999999999998,6.2000000000000002,5.5999999999999996,5.9000000000000004,6.0999999999999996,6.2999999999999998,6.0999999999999996,6.4000000000000004,6.5999999999999996,6.7999999999999998,6.7000000000000002,6,5.7000000000000002,5.5,5.5,5.7999999999999998,6,5.4000000000000004,6,6.7000000000000002,6.2999999999999998,5.5999999999999996,5.5,5.5,6.0999999999999996,5.7999999999999998,5,5.5999999999999996,5.7000000000000002,5.7000000000000002,6.2000000000000002,5.0999999999999996,5.7000000000000002],"mode":"markers","type":"scatter","name":"versicolor","marker":{"color":"rgba(252,141,98,1)","line":{"color":"rgba(252,141,98,1)"}},"textfont":{"color":"rgba(252,141,98,1)"},"error_y":{"color":"rgba(252,141,98,1)"},"error_x":{"color":"rgba(252,141,98,1)"},"line":{"color":"rgba(252,141,98,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[2.5,1.8999999999999999,2.1000000000000001,1.8,2.2000000000000002,2.1000000000000001,1.7,1.8,1.8,2.5,2,1.8999999999999999,2.1000000000000001,2,2.3999999999999999,2.2999999999999998,1.8,2.2000000000000002,2.2999999999999998,1.5,2.2999999999999998,2,2,1.8,2.1000000000000001,1.8,1.8,1.8,2.1000000000000001,1.6000000000000001,1.8999999999999999,2,2.2000000000000002,1.5,1.3999999999999999,2.2999999999999998,2.3999999999999999,1.8,1.8,2.1000000000000001,2.3999999999999999,2.2999999999999998,1.8999999999999999,2.2999999999999998,2.5,2.2999999999999998,1.8999999999999999,2,2.2999999999999998,1.8],"y":[6.2999999999999998,5.7999999999999998,7.0999999999999996,6.2999999999999998,6.5,7.5999999999999996,4.9000000000000004,7.2999999999999998,6.7000000000000002,7.2000000000000002,6.5,6.4000000000000004,6.7999999999999998,5.7000000000000002,5.7999999999999998,6.4000000000000004,6.5,7.7000000000000002,7.7000000000000002,6,6.9000000000000004,5.5999999999999996,7.7000000000000002,6.2999999999999998,6.7000000000000002,7.2000000000000002,6.2000000000000002,6.0999999999999996,6.4000000000000004,7.2000000000000002,7.4000000000000004,7.9000000000000004,6.4000000000000004,6.2999999999999998,6.0999999999999996,7.7000000000000002,6.2999999999999998,6.4000000000000004,6,6.9000000000000004,6.7000000000000002,6.9000000000000004,5.7999999999999998,6.7999999999999998,6.7000000000000002,6.7000000000000002,6.2999999999999998,6.5,6.2000000000000002,5.9000000000000004],"mode":"markers","type":"scatter","name":"virginica","marker":{"color":"rgba(141,160,203,1)","line":{"color":"rgba(141,160,203,1)"}},"textfont":{"color":"rgba(141,160,203,1)"},"error_y":{"color":"rgba(141,160,203,1)"},"error_x":{"color":"rgba(141,160,203,1)"},"line":{"color":"rgba(141,160,203,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Double-Click Delay
Sets the maximum delay between two consecutive clicks to be interpreted as a double-click in milliseconds. This is the time interval between first mousedown and second mouseup. The default timing is 300 ms (less than half a second).
This setting propagates to all on-subplot double clicks (except for `geo` and `mapbox`).


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(y = c(3, 5, 3, 2), x = c("2019-09-02", "2019-10-10", "2019-11-12", "2019-12-22"), 
            type = 'bar',
            texttemplate = "%{label}",
            textposition = "inside")%>%
  layout(xaxis = list(type = 'date'))

config(fig, doubleClickDelay= 1000)%>%layout(plot_bgcolor='#e5ecf6',
          xaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff'),
          yaxis = list(
            zerolinecolor = '#ffff',
            zerolinewidth = 2,
            gridcolor = 'ffff')
          )
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-6b3a0754c9323723d2e6" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-6b3a0754c9323723d2e6">{"x":{"visdat":{"339b6e5dff25":["function () ","plotlyVisDat"]},"cur_data":"339b6e5dff25","attrs":{"339b6e5dff25":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"y":[3,5,3,2],"x":["2019-09-02","2019-10-10","2019-11-12","2019-12-22"],"type":"bar","texttemplate":"%{label}","textposition":"inside","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"type":"date","zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[],"categoryorder":"array","categoryarray":["2019-09-02","2019-10-10","2019-11-12","2019-12-22"]},"plot_bgcolor":"#e5ecf6","yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"doubleClickDelay":1000},"data":[{"y":[3,5,3,2],"x":["2019-09-02","2019-10-10","2019-11-12","2019-12-22"],"type":"bar","texttemplate":["%{label}","%{label}","%{label}","%{label}"],"textposition":["inside","inside","inside","inside"],"marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Configuring Figures in Dash Apps

The same configuration dictionary that you pass to the `config` parameter can also be passed to the [config property of a `dcc.Graph` component](https://dashr.plotly.com/dash-core-components/graph).

#### Reference

See config options at https://github.com/plotly/plotly.js/blob/master/src/plot_api/plot_config.js#L6

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