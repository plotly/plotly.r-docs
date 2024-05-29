---
description: Creating and Updating Figures with Plotly's R graphing library
display_as: file_settings
language: r
layout: base
name: Creating and Updating Figures
order: 2
output:
  html_document:
    keep_md: true
page_type: example_index
permalink: r/creating-and-updating-figures/
thumbnail: thumbnail/creating-and-updating-figures.png
---

The `plotly` R package exists to create, manipulate and [render](https://plotly.com/r/getting-started/#rendering-charts) graphical figures (i.e. charts, plots, maps and diagrams) represented by data structures also referred to as figures. The rendering process uses the [Plotly.js JavaScript library](https://plotly.com/javascript/) under the hood although R developers using this module very rarely need to interact with the Javascript library directly, if ever. Figures can be represented in R either as lists or as instances of the Plotly Figures, and are serialized as text in [JavaScript Object Notation (JSON)](https://json.org/) before being passed to Plotly.js.

### Figures As Lists

Figures can be represented as Lists and displayed using `plotly_build` function. The `fig` list in the example below describes a figure. It contains a single `bar` trace and a title.


``` r
library(plotly)
fig = list(
  data = list(
    list(
      x = c(1, 2, 3),
      y = c(1, 3, 2),
      type = 'bar'
    )
  ),
  layout = list(
    title = 'A Figure Specified By R List',
    plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff')
  )
)
# To display the figure defined by this list, use the plotly_build function
plotly_build(fig)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-fba4fde169084a80d3c5" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-fba4fde169084a80d3c5">{"x":{"data":[{"x":[1,2,3],"y":[1,3,2],"type":"bar","xaxis":"x","yaxis":"y","frame":null}],"layout":{"title":"A Figure Specified By R List","plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"hovermode":"closest","showlegend":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly","attrs":[]},"evals":[],"jsHooks":[]}</script>

### Plotly Figures 

The `plot_ly` function provides an automatically-generated hierarchy of classes that may be used to represent figures.

`plot_ly` figures have several benefits compared to plain R Lists.

1. `plot_ly` figures provide precise data validation. If you provide an invalid property name or an invalid property value as the key to a Plotly Figure, an exception will be raised with a helpful error message describing the problem. This is not the case if you use plain R lists to build your figures.
2. `plot_ly` figures contain descriptions of each valid property as R docstrings. You can use these docstrings in the development environment of your choice to learn about the available properties as an alternative to consulting the online [Full Reference](https://plotly.com/r/reference/).
3. Properties of `plot_ly` figures can be accessed using both dictionary-style key lookup (e.g. `fig$x`).
4. `plot_ly` figures support higher-level convenience functions for making updates to already constructed figures (`.layout()`, `.add_trace()` etc).
5. `plot_ly` figures support attached rendering and exporting functions that automatically invoke the appropriate functions.

Below you can find an example of one way that the figure in the example above could be specified using a `plot_ly` figure instead of a list.


``` r
library(plotly) 
 
fig <- plot_ly(x = c(1, 2, 3), y = c(1, 3, 2), type = 'bar')%>% 
  layout(title = 'A Plotly Figure',
         plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff')) 
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-91dd3dbe608755c88ed5" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-91dd3dbe608755c88ed5">{"x":{"visdat":{"311938392eac":["function () ","plotlyVisDat"]},"cur_data":"311938392eac","attrs":{"311938392eac":{"x":[1,2,3],"y":[1,3,2],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"A Plotly Figure","plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[1,3,2],"type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Converting plot_ly figures To Lists and JSON

`plot_ly` figures can be turned into their R List representation. You can also retrieve the JSON string representation of a plotly figure using the `fig.to_JSON()` method.


``` r
library(plotly) 
library(jsonlite)
fig <- plot_ly(x = c(1, 2, 3), y = c(1, 3, 2), type = 'bar')
plotly_json <- function(p, ...) {
    plotly:::to_JSON(plotly_build(p), ...)
  }
jfig <- plotly_json(fig, pretty = TRUE)

cat("List Representation of a plot_ly figure:")
```

```{style="max-height: 200px;"}
## List Representation of a plot_ly figure:
```

``` r
str(fig, max.level = 2)
```

```{style="max-height: 200px;"}
## List of 8
##  $ x            :List of 6
##   ..$ visdat  :List of 1
##   ..$ cur_data: chr "31194a89e971"
##   ..$ attrs   :List of 1
##   ..$ layout  :List of 3
##   ..$ source  : chr "A"
##   ..$ config  :List of 2
##   ..- attr(*, "TOJSON_FUNC")=function (x, ...)  
##  $ width        : NULL
##  $ height       : NULL
##  $ sizingPolicy :List of 7
##   ..$ defaultWidth : chr "100%"
##   ..$ defaultHeight: num 400
##   ..$ padding      : num 0
##   ..$ fill         : NULL
##   ..$ viewer       :List of 6
##   ..$ browser      :List of 5
##   ..$ knitr        :List of 3
##  $ dependencies :List of 5
##   ..$ :List of 10
##   .. ..- attr(*, "class")= chr "html_dependency"
##   ..$ :List of 10
##   .. ..- attr(*, "class")= chr "html_dependency"
##   ..$ :List of 10
##   .. ..- attr(*, "class")= chr "html_dependency"
##   ..$ :List of 10
##   .. ..- attr(*, "class")= chr "html_dependency"
##   ..$ :List of 10
##   .. ..- attr(*, "class")= chr "html_dependency"
##  $ elementId    : NULL
##  $ preRenderHook:function (p, registerFrames = TRUE)  
##  $ jsHooks      : list()
##  - attr(*, "class")= chr [1:2] "plotly" "htmlwidget"
##  - attr(*, "package")= chr "plotly"
```

``` r
cat("JSON Representation of a plot_ly figure:", jfig, sep = "\n\n")
```

```{style="max-height: 200px;"}
## JSON Representation of a plot_ly figure:
## 
## {
##   "x": {
##     "visdat": {
##       "31194a89e971": ["function () ", "plotlyVisDat"]
##     },
##     "cur_data": "31194a89e971",
##     "attrs": {
##       "31194a89e971": {
##         "x": [1, 2, 3],
##         "y": [1, 3, 2],
##         "alpha_stroke": 1,
##         "sizes": [10, 100],
##         "spans": [1, 20],
##         "type": "bar"
##       }
##     },
##     "layout": {
##       "margin": {
##         "b": 40,
##         "l": 60,
##         "t": 25,
##         "r": 10
##       },
##       "xaxis": {
##         "domain": [0, 1],
##         "automargin": true,
##         "title": []
##       },
##       "yaxis": {
##         "domain": [0, 1],
##         "automargin": true,
##         "title": []
##       },
##       "hovermode": "closest",
##       "showlegend": false
##     },
##     "source": "A",
##     "config": {
##       "modeBarButtonsToAdd": ["hoverclosest", "hovercompare"],
##       "showSendToCloud": false
##     },
##     "data": [
##       {
##         "x": [1, 2, 3],
##         "y": [1, 3, 2],
##         "type": "bar",
##         "marker": {
##           "color": "rgba(31,119,180,1)",
##           "line": {
##             "color": "rgba(31,119,180,1)"
##           }
##         },
##         "error_y": {
##           "color": "rgba(31,119,180,1)"
##         },
##         "error_x": {
##           "color": "rgba(31,119,180,1)"
##         },
##         "xaxis": "x",
##         "yaxis": "y",
##         "frame": null
##       }
##     ],
##     "highlight": {
##       "on": "plotly_click",
##       "persistent": false,
##       "dynamic": false,
##       "selectize": false,
##       "opacityDim": 0.20000000000000001,
##       "selected": {
##         "opacity": 1
##       },
##       "debounce": 0
##     },
##     "shinyEvents": ["plotly_hover", "plotly_click", "plotly_selected", "plotly_relayout", "plotly_brushed", "plotly_brushing", "plotly_clickannotation", "plotly_doubleclick", "plotly_deselect", "plotly_afterplot", "plotly_sunburstclick"],
##     "base_url": "https://plot.ly"
##   },
##   "width": null,
##   "height": null,
##   "sizingPolicy": {
##     "defaultWidth": "100%",
##     "defaultHeight": 400,
##     "padding": 0,
##     "fill": null,
##     "viewer": {
##       "defaultWidth": null,
##       "defaultHeight": null,
##       "padding": null,
##       "fill": true,
##       "suppress": false,
##       "paneHeight": null
##     },
##     "browser": {
##       "defaultWidth": null,
##       "defaultHeight": null,
##       "padding": null,
##       "fill": true,
##       "external": false
##     },
##     "knitr": {
##       "defaultWidth": null,
##       "defaultHeight": null,
##       "figure": true
##     }
##   },
##   "dependencies": [
##     {
##       "name": "typedarray",
##       "version": "0.1",
##       "src": {
##         "file": "htmlwidgets/lib/typedarray"
##       },
##       "meta": null,
##       "script": "typedarray.min.js",
##       "stylesheet": null,
##       "head": null,
##       "attachment": null,
##       "package": "plotly",
##       "all_files": false
##     },
##     {
##       "name": "jquery",
##       "version": "3.5.1",
##       "src": {
##         "file": "lib/jquery"
##       },
##       "meta": null,
##       "script": "jquery.min.js",
##       "stylesheet": null,
##       "head": null,
##       "attachment": null,
##       "package": "crosstalk",
##       "all_files": true
##     },
##     {
##       "name": "crosstalk",
##       "version": "1.2.1",
##       "src": {
##         "file": "www"
##       },
##       "meta": null,
##       "script": "js/crosstalk.min.js",
##       "stylesheet": "css/crosstalk.min.css",
##       "head": null,
##       "attachment": null,
##       "package": "crosstalk",
##       "all_files": true
##     },
##     {
##       "name": "plotly-htmlwidgets-css",
##       "version": "2.11.1",
##       "src": {
##         "file": "htmlwidgets/lib/plotlyjs"
##       },
##       "meta": null,
##       "script": null,
##       "stylesheet": "plotly-htmlwidgets.css",
##       "head": null,
##       "attachment": null,
##       "package": "plotly",
##       "all_files": false
##     },
##     {
##       "name": "plotly-main",
##       "version": "2.11.1",
##       "src": {
##         "file": "htmlwidgets/lib/plotlyjs"
##       },
##       "meta": null,
##       "script": "plotly-latest.min.js",
##       "stylesheet": null,
##       "head": null,
##       "attachment": null,
##       "package": "plotly",
##       "all_files": false
##     }
##   ],
##   "elementId": null,
##   "preRenderHook": ["function (p, registerFrames = TRUE) ", "{", "    UseMethod(\"plotly_build\")", "}"],
##   "jsHooks": []
## }
```

### Representing Figures in Dash

[Dash for R](https://dashr.plotly.com/) is an open-source framework for building analytical applications, with no Javascript required, and it is tightly integrated with the Plotly graphing library. 
 
Learn about how to install Dash for R at https://dashr.plot.ly/installation. 
 
Everywhere in this page that you see fig, you can display the same figure in a Dash for R application by passing it to the figure argument.


``` r
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(plotly)

fig <- plot_ly() %>%
  add_lines(x = c("a","b","c"), y = c(1,3,2))%>%
  layout(title="sample figure")

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccGraph(id = 'graph', figure=fig),
      htmlPre(
        id='structure',
        style = list(border = 'thin lightgrey solid',
                     overflowY = 'scroll',
                     height = '275px')
      )
    )
  )
)
app$callback(
  output(id = 'structure', property='children'),
  params=list(input(id='graph', property='figure')),
  function(fig_json) {
    plotly_json <- function(p, ...) {
      plotly:::to_JSON(plotly_build(p), ...)
    }
    jfig <- plotly_json(fig, pretty = TRUE)
    return(jfig)
  })
#app$run_server()
```

Use `app$run_server()` to run the dash app.

### Creating Figures

This section summarizes several ways to create new `plot_ly` figures with the `plotly` graphing library.

#### Plotly Scatter Plot


``` r
library(plotly)
data(iris)

fig <- plot_ly(data = iris, x = ~Sepal.Width, y = ~Sepal.Length, color = ~Species, 
               type = "scatter", mode = "markers")%>%
  layout(title="A Plotly Figure", legend=list(title=list(text='species')),
         plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-faf7b54f22555708da11" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-faf7b54f22555708da11">{"x":{"visdat":{"311949660196":["function () ","plotlyVisDat"]},"cur_data":"311949660196","attrs":{"311949660196":{"x":{},"y":{},"mode":"markers","color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"A Plotly Figure","legend":{"title":{"text":"species"}},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":"Sepal.Width"},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":"Sepal.Length"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[3.5,3,3.2000000000000002,3.1000000000000001,3.6000000000000001,3.8999999999999999,3.3999999999999999,3.3999999999999999,2.8999999999999999,3.1000000000000001,3.7000000000000002,3.3999999999999999,3,3,4,4.4000000000000004,3.8999999999999999,3.5,3.7999999999999998,3.7999999999999998,3.3999999999999999,3.7000000000000002,3.6000000000000001,3.2999999999999998,3.3999999999999999,3,3.3999999999999999,3.5,3.3999999999999999,3.2000000000000002,3.1000000000000001,3.3999999999999999,4.0999999999999996,4.2000000000000002,3.1000000000000001,3.2000000000000002,3.5,3.6000000000000001,3,3.3999999999999999,3.5,2.2999999999999998,3.2000000000000002,3.5,3.7999999999999998,3,3.7999999999999998,3.2000000000000002,3.7000000000000002,3.2999999999999998],"y":[5.0999999999999996,4.9000000000000004,4.7000000000000002,4.5999999999999996,5,5.4000000000000004,4.5999999999999996,5,4.4000000000000004,4.9000000000000004,5.4000000000000004,4.7999999999999998,4.7999999999999998,4.2999999999999998,5.7999999999999998,5.7000000000000002,5.4000000000000004,5.0999999999999996,5.7000000000000002,5.0999999999999996,5.4000000000000004,5.0999999999999996,4.5999999999999996,5.0999999999999996,4.7999999999999998,5,5,5.2000000000000002,5.2000000000000002,4.7000000000000002,4.7999999999999998,5.4000000000000004,5.2000000000000002,5.5,4.9000000000000004,5,5.5,4.9000000000000004,4.4000000000000004,5.0999999999999996,5,4.5,4.4000000000000004,5,5.0999999999999996,4.7999999999999998,5.0999999999999996,4.5999999999999996,5.2999999999999998,5],"mode":"markers","type":"scatter","name":"setosa","marker":{"color":"rgba(102,194,165,1)","line":{"color":"rgba(102,194,165,1)"}},"textfont":{"color":"rgba(102,194,165,1)"},"error_y":{"color":"rgba(102,194,165,1)"},"error_x":{"color":"rgba(102,194,165,1)"},"line":{"color":"rgba(102,194,165,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[3.2000000000000002,3.2000000000000002,3.1000000000000001,2.2999999999999998,2.7999999999999998,2.7999999999999998,3.2999999999999998,2.3999999999999999,2.8999999999999999,2.7000000000000002,2,3,2.2000000000000002,2.8999999999999999,2.8999999999999999,3.1000000000000001,3,2.7000000000000002,2.2000000000000002,2.5,3.2000000000000002,2.7999999999999998,2.5,2.7999999999999998,2.8999999999999999,3,2.7999999999999998,3,2.8999999999999999,2.6000000000000001,2.3999999999999999,2.3999999999999999,2.7000000000000002,2.7000000000000002,3,3.3999999999999999,3.1000000000000001,2.2999999999999998,3,2.5,2.6000000000000001,3,2.6000000000000001,2.2999999999999998,2.7000000000000002,3,2.8999999999999999,2.8999999999999999,2.5,2.7999999999999998],"y":[7,6.4000000000000004,6.9000000000000004,5.5,6.5,5.7000000000000002,6.2999999999999998,4.9000000000000004,6.5999999999999996,5.2000000000000002,5,5.9000000000000004,6,6.0999999999999996,5.5999999999999996,6.7000000000000002,5.5999999999999996,5.7999999999999998,6.2000000000000002,5.5999999999999996,5.9000000000000004,6.0999999999999996,6.2999999999999998,6.0999999999999996,6.4000000000000004,6.5999999999999996,6.7999999999999998,6.7000000000000002,6,5.7000000000000002,5.5,5.5,5.7999999999999998,6,5.4000000000000004,6,6.7000000000000002,6.2999999999999998,5.5999999999999996,5.5,5.5,6.0999999999999996,5.7999999999999998,5,5.5999999999999996,5.7000000000000002,5.7000000000000002,6.2000000000000002,5.0999999999999996,5.7000000000000002],"mode":"markers","type":"scatter","name":"versicolor","marker":{"color":"rgba(252,141,98,1)","line":{"color":"rgba(252,141,98,1)"}},"textfont":{"color":"rgba(252,141,98,1)"},"error_y":{"color":"rgba(252,141,98,1)"},"error_x":{"color":"rgba(252,141,98,1)"},"line":{"color":"rgba(252,141,98,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[3.2999999999999998,2.7000000000000002,3,2.8999999999999999,3,3,2.5,2.8999999999999999,2.5,3.6000000000000001,3.2000000000000002,2.7000000000000002,3,2.5,2.7999999999999998,3.2000000000000002,3,3.7999999999999998,2.6000000000000001,2.2000000000000002,3.2000000000000002,2.7999999999999998,2.7999999999999998,2.7000000000000002,3.2999999999999998,3.2000000000000002,2.7999999999999998,3,2.7999999999999998,3,2.7999999999999998,3.7999999999999998,2.7999999999999998,2.7999999999999998,2.6000000000000001,3,3.3999999999999999,3.1000000000000001,3,3.1000000000000001,3.1000000000000001,3.1000000000000001,2.7000000000000002,3.2000000000000002,3.2999999999999998,3,2.5,3,3.3999999999999999,3],"y":[6.2999999999999998,5.7999999999999998,7.0999999999999996,6.2999999999999998,6.5,7.5999999999999996,4.9000000000000004,7.2999999999999998,6.7000000000000002,7.2000000000000002,6.5,6.4000000000000004,6.7999999999999998,5.7000000000000002,5.7999999999999998,6.4000000000000004,6.5,7.7000000000000002,7.7000000000000002,6,6.9000000000000004,5.5999999999999996,7.7000000000000002,6.2999999999999998,6.7000000000000002,7.2000000000000002,6.2000000000000002,6.0999999999999996,6.4000000000000004,7.2000000000000002,7.4000000000000004,7.9000000000000004,6.4000000000000004,6.2999999999999998,6.0999999999999996,7.7000000000000002,6.2999999999999998,6.4000000000000004,6,6.9000000000000004,6.7000000000000002,6.9000000000000004,5.7999999999999998,6.7999999999999998,6.7000000000000002,6.7000000000000002,6.2999999999999998,6.5,6.2000000000000002,5.9000000000000004],"mode":"markers","type":"scatter","name":"virginica","marker":{"color":"rgba(141,160,203,1)","line":{"color":"rgba(141,160,203,1)"}},"textfont":{"color":"rgba(141,160,203,1)"},"error_y":{"color":"rgba(141,160,203,1)"},"error_x":{"color":"rgba(141,160,203,1)"},"line":{"color":"rgba(141,160,203,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Make Subplots

The `subplots()` function produces a `plot_ly` figure that is preconfigured with a grid of subplots that traces can be added to. 


``` r
library(plotly)

fig1 <- plot_ly(y = c(4, 2, 1), type = "scatter", mode = "lines") %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))
fig2 <- plot_ly(y = c(2, 1, 3), type = "bar") %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

fig <- subplot(fig1, fig2)
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-77c065c742699a749eae" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-77c065c742699a749eae">{"x":{"data":[{"y":[4,2,1],"mode":"lines","type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"y":[2,1,3],"type":"bar","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x2","yaxis":"y2","frame":null}],"layout":{"xaxis":{"domain":[0,0.47999999999999998],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"y"},"xaxis2":{"domain":[0.52000000000000002,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"y2"},"yaxis2":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"x2"},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"x"},"annotations":[],"shapes":[],"images":[],"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","hovermode":"closest","showlegend":true},"attrs":{"3119663c7380":{"y":[4,2,1],"mode":"lines","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"},"31196172ecea":{"y":[2,1,3],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"subplot":true,"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Updating Figures

Regardless of how a `plot_ly` figure was constructed, it can be updated by adding additional traces to it and modifying its properties.

#### Adding Traces

New traces can be added to a `plot_ly` figure using the `add_trace()` method. This method accepts a `plot_ly` figure trace and adds it to the figure. This allows you to start with an empty figure, and add traces to it sequentially. 


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 2), type = 'bar') %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-0de926290ade0cc00f36" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-0de926290ade0cc00f36">{"x":{"visdat":{"31194139806b":["function () ","plotlyVisDat"]},"cur_data":"31194139806b","attrs":{"31194139806b":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,2],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[1,3,2],"type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>


``` r
library(plotly)
data(iris)

fig <- plot_ly()%>%
  add_trace(data = iris, x = ~Sepal.Width, y = ~Sepal.Length, color = ~Species, 
               type = "scatter", mode = "markers")%>%
  layout(title="Using The add_trace() method With A Plotly Figure",  legend=list(title=list(text='species')),
         plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))%>%
  add_trace(x = c(2, 4), y = c(4, 8), type = "scatter", mode = "lines", line = list(color = 'grey')
            , showlegend = FALSE)
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-2608dc5844c675c0c062" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-2608dc5844c675c0c062">{"x":{"visdat":{"311948f223f0":["function () ","plotlyVisDat"],"3119616e4221":["function () ","data"]},"cur_data":"3119616e4221","attrs":{"3119616e4221":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"color":{},"type":"scatter","mode":"markers","inherit":true},"3119616e4221.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[2,4],"y":[4,8],"type":"scatter","mode":"lines","line":{"color":"grey"},"showlegend":false,"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Using The add_trace() method With A Plotly Figure","legend":{"title":{"text":"species"}},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":"Sepal.Width"},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":"Sepal.Length"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[3.5,3,3.2000000000000002,3.1000000000000001,3.6000000000000001,3.8999999999999999,3.3999999999999999,3.3999999999999999,2.8999999999999999,3.1000000000000001,3.7000000000000002,3.3999999999999999,3,3,4,4.4000000000000004,3.8999999999999999,3.5,3.7999999999999998,3.7999999999999998,3.3999999999999999,3.7000000000000002,3.6000000000000001,3.2999999999999998,3.3999999999999999,3,3.3999999999999999,3.5,3.3999999999999999,3.2000000000000002,3.1000000000000001,3.3999999999999999,4.0999999999999996,4.2000000000000002,3.1000000000000001,3.2000000000000002,3.5,3.6000000000000001,3,3.3999999999999999,3.5,2.2999999999999998,3.2000000000000002,3.5,3.7999999999999998,3,3.7999999999999998,3.2000000000000002,3.7000000000000002,3.2999999999999998],"y":[5.0999999999999996,4.9000000000000004,4.7000000000000002,4.5999999999999996,5,5.4000000000000004,4.5999999999999996,5,4.4000000000000004,4.9000000000000004,5.4000000000000004,4.7999999999999998,4.7999999999999998,4.2999999999999998,5.7999999999999998,5.7000000000000002,5.4000000000000004,5.0999999999999996,5.7000000000000002,5.0999999999999996,5.4000000000000004,5.0999999999999996,4.5999999999999996,5.0999999999999996,4.7999999999999998,5,5,5.2000000000000002,5.2000000000000002,4.7000000000000002,4.7999999999999998,5.4000000000000004,5.2000000000000002,5.5,4.9000000000000004,5,5.5,4.9000000000000004,4.4000000000000004,5.0999999999999996,5,4.5,4.4000000000000004,5,5.0999999999999996,4.7999999999999998,5.0999999999999996,4.5999999999999996,5.2999999999999998,5],"type":"scatter","mode":"markers","name":"setosa","marker":{"color":"rgba(102,194,165,1)","line":{"color":"rgba(102,194,165,1)"}},"textfont":{"color":"rgba(102,194,165,1)"},"error_y":{"color":"rgba(102,194,165,1)"},"error_x":{"color":"rgba(102,194,165,1)"},"line":{"color":"rgba(102,194,165,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[3.2000000000000002,3.2000000000000002,3.1000000000000001,2.2999999999999998,2.7999999999999998,2.7999999999999998,3.2999999999999998,2.3999999999999999,2.8999999999999999,2.7000000000000002,2,3,2.2000000000000002,2.8999999999999999,2.8999999999999999,3.1000000000000001,3,2.7000000000000002,2.2000000000000002,2.5,3.2000000000000002,2.7999999999999998,2.5,2.7999999999999998,2.8999999999999999,3,2.7999999999999998,3,2.8999999999999999,2.6000000000000001,2.3999999999999999,2.3999999999999999,2.7000000000000002,2.7000000000000002,3,3.3999999999999999,3.1000000000000001,2.2999999999999998,3,2.5,2.6000000000000001,3,2.6000000000000001,2.2999999999999998,2.7000000000000002,3,2.8999999999999999,2.8999999999999999,2.5,2.7999999999999998],"y":[7,6.4000000000000004,6.9000000000000004,5.5,6.5,5.7000000000000002,6.2999999999999998,4.9000000000000004,6.5999999999999996,5.2000000000000002,5,5.9000000000000004,6,6.0999999999999996,5.5999999999999996,6.7000000000000002,5.5999999999999996,5.7999999999999998,6.2000000000000002,5.5999999999999996,5.9000000000000004,6.0999999999999996,6.2999999999999998,6.0999999999999996,6.4000000000000004,6.5999999999999996,6.7999999999999998,6.7000000000000002,6,5.7000000000000002,5.5,5.5,5.7999999999999998,6,5.4000000000000004,6,6.7000000000000002,6.2999999999999998,5.5999999999999996,5.5,5.5,6.0999999999999996,5.7999999999999998,5,5.5999999999999996,5.7000000000000002,5.7000000000000002,6.2000000000000002,5.0999999999999996,5.7000000000000002],"type":"scatter","mode":"markers","name":"versicolor","marker":{"color":"rgba(252,141,98,1)","line":{"color":"rgba(252,141,98,1)"}},"textfont":{"color":"rgba(252,141,98,1)"},"error_y":{"color":"rgba(252,141,98,1)"},"error_x":{"color":"rgba(252,141,98,1)"},"line":{"color":"rgba(252,141,98,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[3.2999999999999998,2.7000000000000002,3,2.8999999999999999,3,3,2.5,2.8999999999999999,2.5,3.6000000000000001,3.2000000000000002,2.7000000000000002,3,2.5,2.7999999999999998,3.2000000000000002,3,3.7999999999999998,2.6000000000000001,2.2000000000000002,3.2000000000000002,2.7999999999999998,2.7999999999999998,2.7000000000000002,3.2999999999999998,3.2000000000000002,2.7999999999999998,3,2.7999999999999998,3,2.7999999999999998,3.7999999999999998,2.7999999999999998,2.7999999999999998,2.6000000000000001,3,3.3999999999999999,3.1000000000000001,3,3.1000000000000001,3.1000000000000001,3.1000000000000001,2.7000000000000002,3.2000000000000002,3.2999999999999998,3,2.5,3,3.3999999999999999,3],"y":[6.2999999999999998,5.7999999999999998,7.0999999999999996,6.2999999999999998,6.5,7.5999999999999996,4.9000000000000004,7.2999999999999998,6.7000000000000002,7.2000000000000002,6.5,6.4000000000000004,6.7999999999999998,5.7000000000000002,5.7999999999999998,6.4000000000000004,6.5,7.7000000000000002,7.7000000000000002,6,6.9000000000000004,5.5999999999999996,7.7000000000000002,6.2999999999999998,6.7000000000000002,7.2000000000000002,6.2000000000000002,6.0999999999999996,6.4000000000000004,7.2000000000000002,7.4000000000000004,7.9000000000000004,6.4000000000000004,6.2999999999999998,6.0999999999999996,7.7000000000000002,6.2999999999999998,6.4000000000000004,6,6.9000000000000004,6.7000000000000002,6.9000000000000004,5.7999999999999998,6.7999999999999998,6.7000000000000002,6.7000000000000002,6.2999999999999998,6.5,6.2000000000000002,5.9000000000000004],"type":"scatter","mode":"markers","name":"virginica","marker":{"color":"rgba(141,160,203,1)","line":{"color":"rgba(141,160,203,1)"}},"textfont":{"color":"rgba(141,160,203,1)"},"error_y":{"color":"rgba(141,160,203,1)"},"error_x":{"color":"rgba(141,160,203,1)"},"line":{"color":"rgba(141,160,203,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[2,4],"y":[4,8],"type":"scatter","mode":"lines","line":{"color":"grey"},"showlegend":false,"marker":{"color":"rgba(214,39,40,1)","line":{"color":"rgba(214,39,40,1)"}},"error_y":{"color":"rgba(214,39,40,1)"},"error_x":{"color":"rgba(214,39,40,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Updating Figure Layouts

`plot_ly` figures support an `style()` method that may be used to update multiple nested properties of a figure's layout.

Here is an example of updating the font size of a figure's title using `style()`.


``` r
library(plotly)

fig <- plot_ly(x = c(1, 2, 3), y = c(1, 3, 2), type = 'bar')%>%
  layout(title = list(text ='Using layout() With Plotly Figures', font = list(size = 17)),
         plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-4f630f21274366b78497" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-4f630f21274366b78497">{"x":{"visdat":{"311919bfd86f":["function () ","plotlyVisDat"]},"cur_data":"311919bfd86f","attrs":{"311919bfd86f":{"x":[1,2,3],"y":[1,3,2],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":{"text":"Using layout() With Plotly Figures","font":{"size":17}},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[1,3,2],"type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>


#### Updating Traces

`plot_ly` figures support an `style()` method that may be used to update multiple nested properties of one or more of a figure's traces.

To show some examples, we will start with a figure that contains `bar` and `scatter` traces across two subplots.


``` r
library(plotly)

fig1 <-  plot_ly(x = c(0,1, 2), y = c(2, 1, 3), type = 'bar', name = 'b', color = I("red")) %>%
  add_trace(x = c(0,1, 2), y = c(4, 2, 3.5), type = 'scatter', mode = 'markers', name = 'a',
            marker = list(size = 20, color = 'rgb(51, 204, 51)')) %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

fig2 <-  plot_ly(x = c(0,1, 2), y = c(1, 3, 2), type = 'bar', name = 'c', color = I("#33cc33")) %>%
  add_trace(x = c(0,1, 2), y = c(2, 3.5, 4), type = 'scatter', mode = 'markers', name = 'd',
            marker = list(size = 20, color = 'rgb(255, 0, 0)')) %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

fig <- subplot(fig1, fig2)
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-df3695f9ed0a7db735f2" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-df3695f9ed0a7db735f2">{"x":{"data":[{"x":[0,1,2],"y":[2,1,3],"name":"b","type":"bar","marker":{"color":"rgba(255,0,0,1)","line":{"color":"rgba(255,0,0,1)"}},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[0,1,2],"y":[4,2,3.5],"name":"a","type":"scatter","mode":"markers","marker":{"color":"rgb(51, 204, 51)","size":20,"line":{"color":"rgba(255,0,0,1)"}},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"line":{"color":"rgba(255,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[0,1,2],"y":[1,3,2],"name":"c","type":"bar","marker":{"color":"rgba(51,204,51,1)","line":{"color":"rgba(51,204,51,1)"}},"textfont":{"color":"rgba(51,204,51,1)"},"error_y":{"color":"rgba(51,204,51,1)"},"error_x":{"color":"rgba(51,204,51,1)"},"xaxis":"x2","yaxis":"y2","frame":null},{"x":[0,1,2],"y":[2,3.5,4],"name":"d","type":"scatter","mode":"markers","marker":{"color":"rgb(255, 0, 0)","size":20,"line":{"color":"rgba(51,204,51,1)"}},"textfont":{"color":"rgba(51,204,51,1)"},"error_y":{"color":"rgba(51,204,51,1)"},"error_x":{"color":"rgba(51,204,51,1)"},"line":{"color":"rgba(51,204,51,1)"},"xaxis":"x2","yaxis":"y2","frame":null}],"layout":{"xaxis":{"domain":[0,0.47999999999999998],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"y"},"xaxis2":{"domain":[0.52000000000000002,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"y2"},"yaxis2":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"x2"},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"x"},"annotations":[],"shapes":[],"images":[],"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","hovermode":"closest","showlegend":true},"attrs":{"31192f527af4":{"x":[0,1,2],"y":[2,1,3],"name":"b","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"31192f527af4.1":{"x":[0,1,2],"y":[4,2,3.5],"name":"a","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter","mode":"markers","marker":{"size":20,"color":"rgb(51, 204, 51)"},"inherit":true},"3119647eb816":{"x":[0,1,2],"y":[1,3,2],"name":"c","color":["#33cc33"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"3119647eb816.1":{"x":[0,1,2],"y":[2,3.5,4],"name":"d","color":["#33cc33"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter","mode":"markers","marker":{"size":20,"color":"rgb(255, 0, 0)"},"inherit":true}},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"subplot":true,"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

Note that both `scatter` and `bar` traces have a `marker.color` property to control their coloring. Here is an example of using `style()` to modify the color of all traces.


``` r
library(plotly)

fig1 <-  plot_ly(x = c(0,1, 2), y = c(2, 1, 3), type = 'bar', name = 'b', color = I("red")) %>%
  add_trace(x = c(0,1, 2), y = c(4, 2, 3.5), type = 'scatter', mode = 'markers', name = 'a',
            marker = list(size = 20, color = 'rgb(51, 204, 51)')) %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

fig1 <- style(fig1, marker = list(size = 20, color = "blue"))

fig2 <-  plot_ly(x = c(0,1, 2), y = c(1, 3, 2), type = 'bar', name = 'c', color = I("#33cc33")) %>%
  add_trace(x = c(0,1, 2), y = c(2, 3.5, 4), type = 'scatter', mode = 'markers', name = 'd',
            marker = list(size = 20, color = 'rgb(255, 0, 0)')) %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

fig2 <- style(fig1, marker = list(size = 20, color = "blue"))

fig <- subplot(fig1, fig2)
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-bfecc392976d22768dfb" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-bfecc392976d22768dfb">{"x":{"data":[{"x":[0,1,2],"y":[2,1,3],"name":"b","type":"bar","marker":{"size":20,"color":"blue"},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[0,1,2],"y":[4,2,3.5],"name":"a","type":"scatter","mode":"markers","marker":{"size":20,"color":"blue"},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"line":{"color":"rgba(255,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[0,1,2],"y":[2,1,3],"name":"b","type":"bar","marker":{"size":20,"color":"blue"},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"xaxis":"x2","yaxis":"y2","frame":null},{"x":[0,1,2],"y":[4,2,3.5],"name":"a","type":"scatter","mode":"markers","marker":{"size":20,"color":"blue"},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"line":{"color":"rgba(255,0,0,1)"},"xaxis":"x2","yaxis":"y2","frame":null}],"layout":{"xaxis":{"domain":[0,0.47999999999999998],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"y"},"xaxis2":{"domain":[0.52000000000000002,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"y2"},"yaxis2":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"x2"},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"x"},"annotations":[],"shapes":[],"images":[],"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","hovermode":"closest","showlegend":true},"attrs":{"3119c068132":{"x":[0,1,2],"y":[2,1,3],"name":"b","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"3119c068132.1":{"x":[0,1,2],"y":[4,2,3.5],"name":"a","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter","mode":"markers","marker":{"size":20,"color":"rgb(51, 204, 51)"},"inherit":true},"3119c068132.2":{"x":[0,1,2],"y":[2,1,3],"name":"b","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"3119c068132.3":{"x":[0,1,2],"y":[4,2,3.5],"name":"a","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter","mode":"markers","marker":{"size":20,"color":"rgb(51, 204, 51)"},"inherit":true}},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"subplot":true,"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

The `style()` method supports a `traces` argument to control which traces should be updated. Only traces given  will be updated. Here is an example of using a traces to only update the color of the `bar` traces.


``` r
library(plotly)

fig1 <-  plot_ly(x = c(0,1, 2), y = c(2, 1, 3), type = 'bar', name = 'b', color = I("red")) %>%
  add_trace(x = c(0,1, 2), y = c(4, 2, 3.5), type = 'scatter', mode = 'markers', name = 'a',
            marker = list(size = 20, color = 'rgb(51, 204, 51)')) %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

fig1 <- style(fig1, marker = list(color = "blue"), traces = c(1))

fig2 <-  plot_ly(x = c(0,1, 2), y = c(1, 3, 2), type = 'bar', name = 'c', color = I("#33cc33")) %>%
  add_trace(x = c(0,1, 2), y = c(2, 3.5, 4), type = 'scatter', mode = 'markers', name = 'd',
            marker = list(size = 20, color = 'rgb(255, 80, 80)')) %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

fig2 <- style(fig2, marker = list(color = "blue"), traces = c(1))

fig <- subplot(fig1, fig2)
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-3d390be2e8df4a827844" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-3d390be2e8df4a827844">{"x":{"data":[{"x":[0,1,2],"y":[2,1,3],"name":"b","type":"bar","marker":{"color":"blue"},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[0,1,2],"y":[4,2,3.5],"name":"a","type":"scatter","mode":"markers","marker":{"color":"rgb(51, 204, 51)","size":20,"line":{"color":"rgba(255,0,0,1)"}},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"line":{"color":"rgba(255,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[0,1,2],"y":[1,3,2],"name":"c","type":"bar","marker":{"color":"blue"},"textfont":{"color":"rgba(51,204,51,1)"},"error_y":{"color":"rgba(51,204,51,1)"},"error_x":{"color":"rgba(51,204,51,1)"},"xaxis":"x2","yaxis":"y2","frame":null},{"x":[0,1,2],"y":[2,3.5,4],"name":"d","type":"scatter","mode":"markers","marker":{"color":"rgb(255, 80, 80)","size":20,"line":{"color":"rgba(51,204,51,1)"}},"textfont":{"color":"rgba(51,204,51,1)"},"error_y":{"color":"rgba(51,204,51,1)"},"error_x":{"color":"rgba(51,204,51,1)"},"line":{"color":"rgba(51,204,51,1)"},"xaxis":"x2","yaxis":"y2","frame":null}],"layout":{"xaxis":{"domain":[0,0.47999999999999998],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"y"},"xaxis2":{"domain":[0.52000000000000002,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"y2"},"yaxis2":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"x2"},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","anchor":"x"},"annotations":[],"shapes":[],"images":[],"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","hovermode":"closest","showlegend":true},"attrs":{"311916f97e7e":{"x":[0,1,2],"y":[2,1,3],"name":"b","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"311916f97e7e.1":{"x":[0,1,2],"y":[4,2,3.5],"name":"a","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter","mode":"markers","marker":{"size":20,"color":"rgb(51, 204, 51)"},"inherit":true},"3119596f75d4":{"x":[0,1,2],"y":[1,3,2],"name":"c","color":["#33cc33"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"3119596f75d4.1":{"x":[0,1,2],"y":[2,3.5,4],"name":"d","color":["#33cc33"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter","mode":"markers","marker":{"size":20,"color":"rgb(255, 80, 80)"},"inherit":true}},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"subplot":true,"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Overwrite Existing Properties When Using Update Methods

`style()` will overwrite the prior value of existing properties, with the provided value.

In the example below, the red color of markers is overwritten when updating `marker` in `style()`.


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 2), type = 'bar', marker = list(color = 'red')) %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

style(fig, marker = list(opacity = 0.4))
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-6b24e37ad75de4437d04" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-6b24e37ad75de4437d04">{"x":{"visdat":{"31194a657781":["function () ","plotlyVisDat"]},"cur_data":"31194a657781","attrs":{"31194a657781":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,2],"type":"bar","marker":{"color":"red"},"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[1,3,2],"type":"bar","marker":{"opacity":0.40000000000000002},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Updating Figure Axes

Plotly figures support `layout` method that may be used to update multiple nested properties of one or more of a figure's axes. Here is an example of using `layout` to disable the vertical grid lines across all subplots in a figure produced by Plotly.


``` r
library(plotly)
data(iris)

fig <- iris%>%
  group_by(Species) %>%
  do(p=plot_ly(., x = ~Sepal.Width, y = ~Sepal.Length, color = ~Species, type = "scatter", mode = "markers")) %>%
  subplot(nrows = 1, shareX = TRUE, shareY = TRUE)
fig <- fig%>%
  layout(title = "Updating x axis in a Plotly Figure", legend=list(title=list(text='species')),
         xaxis = list(showgrid = F), 
         xaxis2 = list(showgrid = F), 
         xaxis3 = list(showgrid = F),
         annotations = list(  
           list(  
             x = 0.16,   
             y = 0.95,   
             font = list(size = 10),   
             text = "species=setosa",   
             xref = "paper",   
             yref = "paper",   
             xanchor = "center",   
             yanchor = "bottom",   
             showarrow = FALSE  
           ),   
           list(  
             x = 0.5,   
             y = 0.95,   
             font = list(size = 10),   
             text = "species=versicolor",   
             xref = "paper",   
             yref = "paper",   
             xanchor = "center",   
             yanchor = "bottom",   
             showarrow = FALSE  
           ),   
           list(  
             x = 0.85,   
             y = 0.95,   
             font = list(size = 10),   
             text = "species=virginica",   
             xref = "paper",   
             yref = "paper",   
             xanchor = "center",   
             yanchor = "bottom",   
             showarrow = FALSE  
           )),
         plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-bda3e14dc0d98f182e7b" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-bda3e14dc0d98f182e7b">{"x":{"data":[{"x":[3.5,3,3.2000000000000002,3.1000000000000001,3.6000000000000001,3.8999999999999999,3.3999999999999999,3.3999999999999999,2.8999999999999999,3.1000000000000001,3.7000000000000002,3.3999999999999999,3,3,4,4.4000000000000004,3.8999999999999999,3.5,3.7999999999999998,3.7999999999999998,3.3999999999999999,3.7000000000000002,3.6000000000000001,3.2999999999999998,3.3999999999999999,3,3.3999999999999999,3.5,3.3999999999999999,3.2000000000000002,3.1000000000000001,3.3999999999999999,4.0999999999999996,4.2000000000000002,3.1000000000000001,3.2000000000000002,3.5,3.6000000000000001,3,3.3999999999999999,3.5,2.2999999999999998,3.2000000000000002,3.5,3.7999999999999998,3,3.7999999999999998,3.2000000000000002,3.7000000000000002,3.2999999999999998],"y":[5.0999999999999996,4.9000000000000004,4.7000000000000002,4.5999999999999996,5,5.4000000000000004,4.5999999999999996,5,4.4000000000000004,4.9000000000000004,5.4000000000000004,4.7999999999999998,4.7999999999999998,4.2999999999999998,5.7999999999999998,5.7000000000000002,5.4000000000000004,5.0999999999999996,5.7000000000000002,5.0999999999999996,5.4000000000000004,5.0999999999999996,4.5999999999999996,5.0999999999999996,4.7999999999999998,5,5,5.2000000000000002,5.2000000000000002,4.7000000000000002,4.7999999999999998,5.4000000000000004,5.2000000000000002,5.5,4.9000000000000004,5,5.5,4.9000000000000004,4.4000000000000004,5.0999999999999996,5,4.5,4.4000000000000004,5,5.0999999999999996,4.7999999999999998,5.0999999999999996,4.5999999999999996,5.2999999999999998,5],"mode":"markers","type":"scatter","name":"setosa","marker":{"color":"rgba(102,194,165,1)","line":{"color":"rgba(102,194,165,1)"}},"textfont":{"color":"rgba(102,194,165,1)"},"error_y":{"color":"rgba(102,194,165,1)"},"error_x":{"color":"rgba(102,194,165,1)"},"line":{"color":"rgba(102,194,165,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[3.2000000000000002,3.2000000000000002,3.1000000000000001,2.2999999999999998,2.7999999999999998,2.7999999999999998,3.2999999999999998,2.3999999999999999,2.8999999999999999,2.7000000000000002,2,3,2.2000000000000002,2.8999999999999999,2.8999999999999999,3.1000000000000001,3,2.7000000000000002,2.2000000000000002,2.5,3.2000000000000002,2.7999999999999998,2.5,2.7999999999999998,2.8999999999999999,3,2.7999999999999998,3,2.8999999999999999,2.6000000000000001,2.3999999999999999,2.3999999999999999,2.7000000000000002,2.7000000000000002,3,3.3999999999999999,3.1000000000000001,2.2999999999999998,3,2.5,2.6000000000000001,3,2.6000000000000001,2.2999999999999998,2.7000000000000002,3,2.8999999999999999,2.8999999999999999,2.5,2.7999999999999998],"y":[7,6.4000000000000004,6.9000000000000004,5.5,6.5,5.7000000000000002,6.2999999999999998,4.9000000000000004,6.5999999999999996,5.2000000000000002,5,5.9000000000000004,6,6.0999999999999996,5.5999999999999996,6.7000000000000002,5.5999999999999996,5.7999999999999998,6.2000000000000002,5.5999999999999996,5.9000000000000004,6.0999999999999996,6.2999999999999998,6.0999999999999996,6.4000000000000004,6.5999999999999996,6.7999999999999998,6.7000000000000002,6,5.7000000000000002,5.5,5.5,5.7999999999999998,6,5.4000000000000004,6,6.7000000000000002,6.2999999999999998,5.5999999999999996,5.5,5.5,6.0999999999999996,5.7999999999999998,5,5.5999999999999996,5.7000000000000002,5.7000000000000002,6.2000000000000002,5.0999999999999996,5.7000000000000002],"mode":"markers","type":"scatter","name":"versicolor","marker":{"color":"rgba(252,141,98,1)","line":{"color":"rgba(252,141,98,1)"}},"textfont":{"color":"rgba(252,141,98,1)"},"error_y":{"color":"rgba(252,141,98,1)"},"error_x":{"color":"rgba(252,141,98,1)"},"line":{"color":"rgba(252,141,98,1)"},"xaxis":"x2","yaxis":"y","frame":null},{"x":[3.2999999999999998,2.7000000000000002,3,2.8999999999999999,3,3,2.5,2.8999999999999999,2.5,3.6000000000000001,3.2000000000000002,2.7000000000000002,3,2.5,2.7999999999999998,3.2000000000000002,3,3.7999999999999998,2.6000000000000001,2.2000000000000002,3.2000000000000002,2.7999999999999998,2.7999999999999998,2.7000000000000002,3.2999999999999998,3.2000000000000002,2.7999999999999998,3,2.7999999999999998,3,2.7999999999999998,3.7999999999999998,2.7999999999999998,2.7999999999999998,2.6000000000000001,3,3.3999999999999999,3.1000000000000001,3,3.1000000000000001,3.1000000000000001,3.1000000000000001,2.7000000000000002,3.2000000000000002,3.2999999999999998,3,2.5,3,3.3999999999999999,3],"y":[6.2999999999999998,5.7999999999999998,7.0999999999999996,6.2999999999999998,6.5,7.5999999999999996,4.9000000000000004,7.2999999999999998,6.7000000000000002,7.2000000000000002,6.5,6.4000000000000004,6.7999999999999998,5.7000000000000002,5.7999999999999998,6.4000000000000004,6.5,7.7000000000000002,7.7000000000000002,6,6.9000000000000004,5.5999999999999996,7.7000000000000002,6.2999999999999998,6.7000000000000002,7.2000000000000002,6.2000000000000002,6.0999999999999996,6.4000000000000004,7.2000000000000002,7.4000000000000004,7.9000000000000004,6.4000000000000004,6.2999999999999998,6.0999999999999996,7.7000000000000002,6.2999999999999998,6.4000000000000004,6,6.9000000000000004,6.7000000000000002,6.9000000000000004,5.7999999999999998,6.7999999999999998,6.7000000000000002,6.7000000000000002,6.2999999999999998,6.5,6.2000000000000002,5.9000000000000004],"mode":"markers","type":"scatter","name":"virginica","marker":{"color":"rgba(141,160,203,1)","line":{"color":"rgba(141,160,203,1)"}},"textfont":{"color":"rgba(141,160,203,1)"},"error_y":{"color":"rgba(141,160,203,1)"},"error_x":{"color":"rgba(141,160,203,1)"},"line":{"color":"rgba(141,160,203,1)"},"xaxis":"x3","yaxis":"y","frame":null}],"layout":{"xaxis":{"domain":[0,0.3133333333333333],"automargin":true,"title":"Sepal.Width","anchor":"y","showgrid":false},"xaxis2":{"domain":[0.35333333333333333,0.64666666666666661],"automargin":true,"title":"Sepal.Width","anchor":"y","showgrid":false},"xaxis3":{"domain":[0.68666666666666665,1],"automargin":true,"title":"Sepal.Width","anchor":"y","showgrid":false},"yaxis":{"domain":[0,1],"automargin":true,"title":"Sepal.Length","anchor":"x","zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"annotations":[{"x":0.16,"y":0.94999999999999996,"font":{"size":10},"text":"species=setosa","xref":"paper","yref":"paper","xanchor":"center","yanchor":"bottom","showarrow":false},{"x":0.5,"y":0.94999999999999996,"font":{"size":10},"text":"species=versicolor","xref":"paper","yref":"paper","xanchor":"center","yanchor":"bottom","showarrow":false},{"x":0.84999999999999998,"y":0.94999999999999996,"font":{"size":10},"text":"species=virginica","xref":"paper","yref":"paper","xanchor":"center","yanchor":"bottom","showarrow":false}],"shapes":[],"images":[],"margin":{"b":40,"l":60,"t":25,"r":10},"hovermode":"closest","showlegend":true,"title":"Updating x axis in a Plotly Figure","legend":{"title":{"text":"species"}},"plot_bgcolor":"#e5ecf6"},"attrs":{"31197986f131":{"x":{},"y":{},"mode":"markers","color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"},"31195632e8c9":{"x":{},"y":{},"mode":"markers","color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"},"311938bbf7c9":{"x":{},"y":{},"mode":"markers","color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"subplot":true,"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Other Update Methods

Figures created with the plotly graphing library also support:

  - the `images()` method in order to [update background layout images](https://plotly.com/r/displaying-images/),
  - `annotations()` in order to [update annotations](https://plotly.com/r/text-and-annotations/),
  - and `shapes()` in order to [update shapes](https://plotly.com/r/shapes/).

#### Chaining Figure Operations

All of the figure update operations described above are methods that return a reference to the figure being modified. This makes it possible to chain multiple figure modification operations together into a single expression.

Here is an example of a chained expression that:

  - sets the title font size using `layout.title.font.size`,
  - disables vertical grid lines using `layout.xaxis`,
  - updates the size and color of the markers and bar using `style()`,
  - and then displaying the figure.


``` r
library(plotly) 

t <- list(size = 15)

fig <-  plot_ly(x = c(0,1, 2), y = c(2, 1, 3), type = 'bar', name = 'b', color = I("red")) %>% 
  add_trace(x = c(0,1, 2), y = c(4, 2, 3.5), type = 'scatter', mode = 'markers', name = 'a', 
            marker = list(size = 10, color = 'rgb(51, 204, 51)')) 
#updates the size and color of the markers and bar
fig <- style(fig, marker = list(size = 20, color = "blue")) 

fig <- style(fig, marker = list(color = "yellow"), traces = c(1)) 

fig <- style(fig, marker = list(color = "yellow", line = list(color = 'rgb(8,48,107)', 
                                                                width = 1.5)), traces = c(1)) 
fig <- fig %>%
  layout(title = list(text = "Chaining Multiple Figure Operations With A Plotly Figure",
#setting the title font size                      
                      font = t),
#disables vertical grid lines
         xaxis = list(showgrid = F),
plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))
#displaying the figure
fig 
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-743fe2a8b5fb2174e590" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-743fe2a8b5fb2174e590">{"x":{"visdat":{"31193dc6bc1c":["function () ","plotlyVisDat"]},"cur_data":"31193dc6bc1c","attrs":{"31193dc6bc1c":{"x":[0,1,2],"y":[2,1,3],"name":"b","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"31193dc6bc1c.1":{"x":[0,1,2],"y":[4,2,3.5],"name":"a","color":["red"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter","mode":"markers","marker":{"size":10,"color":"rgb(51, 204, 51)"},"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":[],"showgrid":false},"yaxis":{"domain":[0,1],"automargin":true,"title":[],"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"hovermode":"closest","showlegend":true,"title":{"text":"Chaining Multiple Figure Operations With A Plotly Figure","font":{"size":15}},"plot_bgcolor":"#e5ecf6"},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[0,1,2],"y":[2,1,3],"name":"b","type":"bar","marker":{"color":"yellow","line":{"color":"rgb(8,48,107)","width":1.5}},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[0,1,2],"y":[4,2,3.5],"name":"a","type":"scatter","mode":"markers","marker":{"size":20,"color":"blue"},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"line":{"color":"rgba(255,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Property Assignment

Trace and layout properties can be updated using property assignment syntax. Here is an example of setting the figure title using property assignment.


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 2), type = 'bar')%>%
  layout(title = 'Using Property Assignment Syntax With A Plotly Figure',
         plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))
fig <- style(fig,marker = list(line = list(color = 'lightblue', width = 0)))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-4a5359e67858c3f8b433" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-4a5359e67858c3f8b433">{"x":{"visdat":{"31193f005d29":["function () ","plotlyVisDat"]},"cur_data":"31193f005d29","attrs":{"31193f005d29":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,2],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Using Property Assignment Syntax With A Plotly Figure","plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[1,3,2],"type":"bar","marker":{"line":{"color":"lightblue","width":0}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

And here is an example of updating the bar outline using property assignment.


``` r
library(plotly) 

fig <- plot_ly()%>%
  add_trace(x = c(1, 2, 3), y = c(1, 3, 2), type = 'bar') %>%
  layout(plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))
fig <- style(fig,marker = list(line = list(color = 'lightblue', width = 0)))
fig$x$data[[1]]$marker$line$color <- 'black'
fig$x$data[[1]]$marker$line$width <- 4

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-131dee60e29a5319a313" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-131dee60e29a5319a313">{"x":{"visdat":{"31194cabe2d0":["function () ","plotlyVisDat"]},"cur_data":"31194cabe2d0","attrs":{"31194cabe2d0":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":[1,2,3],"y":[1,3,2],"type":"bar","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[1,3,2],"type":"bar","marker":{"line":{"color":"black","width":4}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

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