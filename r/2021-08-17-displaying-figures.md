---
description: Displaying Figures using Plotly's R graphing library
display_as: file_settings
language: r
layout: base
name: Displaying Figures
order: 3
output:
  html_document:
    keep_md: true
page_type: example_index
permalink: r/renderers/
redirect_from: r/offline/
thumbnail: thumbnail/displaying-figures.png
---

Plotly's R graphing library, `plotly`, gives you a wide range of options for how and where to display your figures.

In general, there are four different approaches you can take in order to display `plotly` figures:

 1. Using the `renderers` framework in the context of a script or notebook (the main topic of this page)
 2. Using [Dash](https://dashr.plotly.com) in a web app context
 3. By exporting to an HTML file and loading that file in a browser immediately or later
 4. By [rendering the figure to a static image file using Kaleido](https://plotly.com/r/static-image-export/) such as PNG, JPEG, SVG, PDF or EPS and loading the resulting file in any viewer

Each of the first two approaches is discussed below.

### Displaying Figures Using The `renderers` Framework

The renderers framework is a flexible approach for displaying `plotly` figures in a variety of contexts.  To display a figure using the renderers framework, you call the `print()` method on a graph object figure. It will display the figure using the current default renderer(s).


``` r
library(plotly)

fig <-  plot_ly(x = c(0,1, 2), y = c(2, 1, 3), type = 'bar') %>%
  layout(title = 'A Figure Displayed with print(fig)',
         plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

print(fig)
```

In most situations, you can omit the call to `print()` and allow the figure to display itself.


``` r
library(plotly)

fig <-  plot_ly(x = c(0,1, 2), y = c(2, 1, 3), type = 'bar') %>%
  layout(title = 'A Figure Displaying Itself',
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

<div class="plotly html-widget html-fill-item" id="htmlwidget-4128592dada5bf5c0d0e" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-4128592dada5bf5c0d0e">{"x":{"visdat":{"315c33c118b5":["function () ","plotlyVisDat"]},"cur_data":"315c33c118b5","attrs":{"315c33c118b5":{"x":[0,1,2],"y":[2,1,3],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"A Figure Displaying Itself","plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[0,1,2],"y":[2,1,3],"type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

> To be precise, figures will display themselves using the current default renderer when  the last expression in a cell must evaluate to a figure.

**In many contexts, an appropriate renderer will be chosen automatically and you will not need to perform any additional configuration.** 

Next, we will show how to configure the default renderer.  After that, we will describe all of the built-in renderers and discuss why you might choose to use each one.


#### Overriding The Default Renderer
It is also possible to override the default renderer temporarily by passing 'toWebGL()' to the fig.  Here is an example of displaying a figure using the `webgl` renderer (described below) without changing the default renderer.


``` r
library(plotly)

fig <-  plot_ly(x = c(0,1, 2), y = c(2, 1, 3), type = 'bar') %>%
  layout(title = "A Figure Displayed with 'webgl' Renderer",
         plot_bgcolor='#e5ecf6', 
         xaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'), 
         yaxis = list( 
           zerolinecolor = '#ffff', 
           zerolinewidth = 2, 
           gridcolor = 'ffff'))

fig <- fig %>% toWebGL()

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-8b04aaffb062bc4dffe8" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-8b04aaffb062bc4dffe8">{"x":{"visdat":{"315c3e6d1a71":["function () ","plotlyVisDat"]},"cur_data":"315c3e6d1a71","attrs":{"315c3e6d1a71":{"x":[0,1,2],"y":[2,1,3],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"A Figure Displayed with 'webgl' Renderer","plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"yaxis":{"domain":[0,1],"automargin":true,"zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff","title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},".plotlyWebGl":true,"data":[{"x":[0,1,2],"y":[2,1,3],"type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>


##### Other Miscellaneous Renderers

###### JSON
In editors that support it , this renderer displays the JSON representation of a figure in a collapsible interactive tree structure.  This can be very useful for examining the structure of complex figures. We have to use the function toJSON() to the figure.

##### Multiple Renderers
You can specify the multiple renderers by adding their respective functions separately.  This is useful when writing code that needs to support multiple contexts. 



### Displaying figures in Dash

[Dash for R](https://dashr.plotly.com) is an open-source framework for building analytical applications, with no Javascript required, and it is tightly integrated with the Plotly graphing library.

Learn about how to install Dash for R at https://dashr.plot.ly/installation.

Everywhere in this page that you see fig, you can display the same figure in a Dash for R application by passing it to the figure argument.



``` r
library(dash) 
library(dashCoreComponents) 
library(dashHtmlComponents) 
library(plotly) 
 
fig <-  plot_ly(x = c(0,1, 2), y = c(2, 1, 3), type = 'bar') %>% 
  layout(title = 'Native Plotly rendering in Dash') 
 
app <- Dash$new() 
 
app$layout( 
  htmlDiv( 
    list( 
      dccGraph(id = 'graph', figure = fig) 
    ) 
  ) 
) 
```

After executing this code, give app$run_server() in the console to start the dash.


## Performance

No matter the approach chosen to display a figure, the figure data structure is first (automatically, internally) serialized into a JSON string before being transferred from the R context to the browser (or to an HTML file first) or [to Kaleido for static image export](https://plotly.com/r/static-image-export/).

Once a figure is serialized to JSON, it must be rendered by a browser, either immediately in the user's browser, at some later point if the figure is exported to HTML, or immediately in Kaleido's internal headless browser for static image export. Rendering time is generally proportional to the total number of data points in the figure, the number of traces and the number of subplots. In situations where rendering performance is slow, we recommend considering [the use of `plotly` WebGL traces](https://plotly.com/r/webgl-vs-svg/) to exploit GPU-accelerated rendering in the browser to render the figure.

##### Partial Bundle
Run-time render performance of the graph on a web page can also be improved by involving the `partial_bundle()` function in a a similar fashion as `toWebGL()`. This function reduces the size of the `plotly.js` bundle downloaded on the initial load of the page by serving a partial bundle with subsets of the graphing library. This is not recommended for use when rendering multiple Plotly graphs on a single page.

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