---
description: How to set the global font, title, legend-entries, and axis-titles in
  R.
display_as: file_settings
language: r
layout: base
name: Setting the Font, Title, Legend Entries, and Axis Titles
order: 8
output:
  html_document:
    keep_md: true
permalink: r/figure-labels/
redirect_form: r/font/
thumbnail: thumbnail/figure-labels.png
---

## Setting the Font, Title, Legend Entries, and Axis Titles in R

How to set the global font, title, legend-entries, and axis-titles in for plots in R.


### Automatic Labelling with Plotly 

When using Plotly, your axes is automatically labelled, and it's easy to override the automation for a customized figure using the `labels` keyword argument. The title of your figure is up to you though!

Here's a figure with automatic labels and then the same figure with overridden labels. Note the fact that when overriding labels, the axes, legend title *and hover labels* reflect the specified labels automatically.


``` r
library(plotly)

data("iris")

fig1 <-  plot_ly(data = iris ,x =  ~Sepal.Length, y = ~Sepal.Width, color = ~Species, type = 'scatter', mode = 'markers')%>%
        layout(title = 'Automatic Labels Based on Data Frame Column Names', plot_bgcolor = "#e5ecf6")
fig1
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-bcf7afced5a34781fb53" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-bcf7afced5a34781fb53">{"x":{"visdat":{"2fc9709b4dd":["function () ","plotlyVisDat"]},"cur_data":"2fc9709b4dd","attrs":{"2fc9709b4dd":{"x":{},"y":{},"mode":"markers","color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Automatic Labels Based on Data Frame Column Names","plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"title":"Sepal.Length"},"yaxis":{"domain":[0,1],"automargin":true,"title":"Sepal.Width"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[5.0999999999999996,4.9000000000000004,4.7000000000000002,4.5999999999999996,5,5.4000000000000004,4.5999999999999996,5,4.4000000000000004,4.9000000000000004,5.4000000000000004,4.7999999999999998,4.7999999999999998,4.2999999999999998,5.7999999999999998,5.7000000000000002,5.4000000000000004,5.0999999999999996,5.7000000000000002,5.0999999999999996,5.4000000000000004,5.0999999999999996,4.5999999999999996,5.0999999999999996,4.7999999999999998,5,5,5.2000000000000002,5.2000000000000002,4.7000000000000002,4.7999999999999998,5.4000000000000004,5.2000000000000002,5.5,4.9000000000000004,5,5.5,4.9000000000000004,4.4000000000000004,5.0999999999999996,5,4.5,4.4000000000000004,5,5.0999999999999996,4.7999999999999998,5.0999999999999996,4.5999999999999996,5.2999999999999998,5],"y":[3.5,3,3.2000000000000002,3.1000000000000001,3.6000000000000001,3.8999999999999999,3.3999999999999999,3.3999999999999999,2.8999999999999999,3.1000000000000001,3.7000000000000002,3.3999999999999999,3,3,4,4.4000000000000004,3.8999999999999999,3.5,3.7999999999999998,3.7999999999999998,3.3999999999999999,3.7000000000000002,3.6000000000000001,3.2999999999999998,3.3999999999999999,3,3.3999999999999999,3.5,3.3999999999999999,3.2000000000000002,3.1000000000000001,3.3999999999999999,4.0999999999999996,4.2000000000000002,3.1000000000000001,3.2000000000000002,3.5,3.6000000000000001,3,3.3999999999999999,3.5,2.2999999999999998,3.2000000000000002,3.5,3.7999999999999998,3,3.7999999999999998,3.2000000000000002,3.7000000000000002,3.2999999999999998],"mode":"markers","type":"scatter","name":"setosa","marker":{"color":"rgba(102,194,165,1)","line":{"color":"rgba(102,194,165,1)"}},"textfont":{"color":"rgba(102,194,165,1)"},"error_y":{"color":"rgba(102,194,165,1)"},"error_x":{"color":"rgba(102,194,165,1)"},"line":{"color":"rgba(102,194,165,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[7,6.4000000000000004,6.9000000000000004,5.5,6.5,5.7000000000000002,6.2999999999999998,4.9000000000000004,6.5999999999999996,5.2000000000000002,5,5.9000000000000004,6,6.0999999999999996,5.5999999999999996,6.7000000000000002,5.5999999999999996,5.7999999999999998,6.2000000000000002,5.5999999999999996,5.9000000000000004,6.0999999999999996,6.2999999999999998,6.0999999999999996,6.4000000000000004,6.5999999999999996,6.7999999999999998,6.7000000000000002,6,5.7000000000000002,5.5,5.5,5.7999999999999998,6,5.4000000000000004,6,6.7000000000000002,6.2999999999999998,5.5999999999999996,5.5,5.5,6.0999999999999996,5.7999999999999998,5,5.5999999999999996,5.7000000000000002,5.7000000000000002,6.2000000000000002,5.0999999999999996,5.7000000000000002],"y":[3.2000000000000002,3.2000000000000002,3.1000000000000001,2.2999999999999998,2.7999999999999998,2.7999999999999998,3.2999999999999998,2.3999999999999999,2.8999999999999999,2.7000000000000002,2,3,2.2000000000000002,2.8999999999999999,2.8999999999999999,3.1000000000000001,3,2.7000000000000002,2.2000000000000002,2.5,3.2000000000000002,2.7999999999999998,2.5,2.7999999999999998,2.8999999999999999,3,2.7999999999999998,3,2.8999999999999999,2.6000000000000001,2.3999999999999999,2.3999999999999999,2.7000000000000002,2.7000000000000002,3,3.3999999999999999,3.1000000000000001,2.2999999999999998,3,2.5,2.6000000000000001,3,2.6000000000000001,2.2999999999999998,2.7000000000000002,3,2.8999999999999999,2.8999999999999999,2.5,2.7999999999999998],"mode":"markers","type":"scatter","name":"versicolor","marker":{"color":"rgba(252,141,98,1)","line":{"color":"rgba(252,141,98,1)"}},"textfont":{"color":"rgba(252,141,98,1)"},"error_y":{"color":"rgba(252,141,98,1)"},"error_x":{"color":"rgba(252,141,98,1)"},"line":{"color":"rgba(252,141,98,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[6.2999999999999998,5.7999999999999998,7.0999999999999996,6.2999999999999998,6.5,7.5999999999999996,4.9000000000000004,7.2999999999999998,6.7000000000000002,7.2000000000000002,6.5,6.4000000000000004,6.7999999999999998,5.7000000000000002,5.7999999999999998,6.4000000000000004,6.5,7.7000000000000002,7.7000000000000002,6,6.9000000000000004,5.5999999999999996,7.7000000000000002,6.2999999999999998,6.7000000000000002,7.2000000000000002,6.2000000000000002,6.0999999999999996,6.4000000000000004,7.2000000000000002,7.4000000000000004,7.9000000000000004,6.4000000000000004,6.2999999999999998,6.0999999999999996,7.7000000000000002,6.2999999999999998,6.4000000000000004,6,6.9000000000000004,6.7000000000000002,6.9000000000000004,5.7999999999999998,6.7999999999999998,6.7000000000000002,6.7000000000000002,6.2999999999999998,6.5,6.2000000000000002,5.9000000000000004],"y":[3.2999999999999998,2.7000000000000002,3,2.8999999999999999,3,3,2.5,2.8999999999999999,2.5,3.6000000000000001,3.2000000000000002,2.7000000000000002,3,2.5,2.7999999999999998,3.2000000000000002,3,3.7999999999999998,2.6000000000000001,2.2000000000000002,3.2000000000000002,2.7999999999999998,2.7999999999999998,2.7000000000000002,3.2999999999999998,3.2000000000000002,2.7999999999999998,3,2.7999999999999998,3,2.7999999999999998,3.7999999999999998,2.7999999999999998,2.7999999999999998,2.6000000000000001,3,3.3999999999999999,3.1000000000000001,3,3.1000000000000001,3.1000000000000001,3.1000000000000001,2.7000000000000002,3.2000000000000002,3.2999999999999998,3,2.5,3,3.3999999999999999,3],"mode":"markers","type":"scatter","name":"virginica","marker":{"color":"rgba(141,160,203,1)","line":{"color":"rgba(141,160,203,1)"}},"textfont":{"color":"rgba(141,160,203,1)"},"error_y":{"color":"rgba(141,160,203,1)"},"error_x":{"color":"rgba(141,160,203,1)"},"line":{"color":"rgba(141,160,203,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

``` r
#Manually specifying labels

fig2 <-  plot_ly(data = iris ,x =  ~Sepal.Length, y = ~Sepal.Width, color = ~Species, type = 'scatter', mode = 'markers')%>%
  layout(title = 'Manually Specified Labels', plot_bgcolor = "#e5ecf6", xaxis = list(title = 'Sepal Length (cm)'), 
         yaxis = list(title = 'Sepal Width (cm)'), legend = list(title=list(text='<b> Species of Iris </b>')))
fig2
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-70dd57a06efd25da730c" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-70dd57a06efd25da730c">{"x":{"visdat":{"2fc96b0921a":["function () ","plotlyVisDat"]},"cur_data":"2fc96b0921a","attrs":{"2fc96b0921a":{"x":{},"y":{},"mode":"markers","color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Manually Specified Labels","plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"title":"Sepal Length (cm)"},"yaxis":{"domain":[0,1],"automargin":true,"title":"Sepal Width (cm)"},"legend":{"title":{"text":"<b> Species of Iris <\/b>"}},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[5.0999999999999996,4.9000000000000004,4.7000000000000002,4.5999999999999996,5,5.4000000000000004,4.5999999999999996,5,4.4000000000000004,4.9000000000000004,5.4000000000000004,4.7999999999999998,4.7999999999999998,4.2999999999999998,5.7999999999999998,5.7000000000000002,5.4000000000000004,5.0999999999999996,5.7000000000000002,5.0999999999999996,5.4000000000000004,5.0999999999999996,4.5999999999999996,5.0999999999999996,4.7999999999999998,5,5,5.2000000000000002,5.2000000000000002,4.7000000000000002,4.7999999999999998,5.4000000000000004,5.2000000000000002,5.5,4.9000000000000004,5,5.5,4.9000000000000004,4.4000000000000004,5.0999999999999996,5,4.5,4.4000000000000004,5,5.0999999999999996,4.7999999999999998,5.0999999999999996,4.5999999999999996,5.2999999999999998,5],"y":[3.5,3,3.2000000000000002,3.1000000000000001,3.6000000000000001,3.8999999999999999,3.3999999999999999,3.3999999999999999,2.8999999999999999,3.1000000000000001,3.7000000000000002,3.3999999999999999,3,3,4,4.4000000000000004,3.8999999999999999,3.5,3.7999999999999998,3.7999999999999998,3.3999999999999999,3.7000000000000002,3.6000000000000001,3.2999999999999998,3.3999999999999999,3,3.3999999999999999,3.5,3.3999999999999999,3.2000000000000002,3.1000000000000001,3.3999999999999999,4.0999999999999996,4.2000000000000002,3.1000000000000001,3.2000000000000002,3.5,3.6000000000000001,3,3.3999999999999999,3.5,2.2999999999999998,3.2000000000000002,3.5,3.7999999999999998,3,3.7999999999999998,3.2000000000000002,3.7000000000000002,3.2999999999999998],"mode":"markers","type":"scatter","name":"setosa","marker":{"color":"rgba(102,194,165,1)","line":{"color":"rgba(102,194,165,1)"}},"textfont":{"color":"rgba(102,194,165,1)"},"error_y":{"color":"rgba(102,194,165,1)"},"error_x":{"color":"rgba(102,194,165,1)"},"line":{"color":"rgba(102,194,165,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[7,6.4000000000000004,6.9000000000000004,5.5,6.5,5.7000000000000002,6.2999999999999998,4.9000000000000004,6.5999999999999996,5.2000000000000002,5,5.9000000000000004,6,6.0999999999999996,5.5999999999999996,6.7000000000000002,5.5999999999999996,5.7999999999999998,6.2000000000000002,5.5999999999999996,5.9000000000000004,6.0999999999999996,6.2999999999999998,6.0999999999999996,6.4000000000000004,6.5999999999999996,6.7999999999999998,6.7000000000000002,6,5.7000000000000002,5.5,5.5,5.7999999999999998,6,5.4000000000000004,6,6.7000000000000002,6.2999999999999998,5.5999999999999996,5.5,5.5,6.0999999999999996,5.7999999999999998,5,5.5999999999999996,5.7000000000000002,5.7000000000000002,6.2000000000000002,5.0999999999999996,5.7000000000000002],"y":[3.2000000000000002,3.2000000000000002,3.1000000000000001,2.2999999999999998,2.7999999999999998,2.7999999999999998,3.2999999999999998,2.3999999999999999,2.8999999999999999,2.7000000000000002,2,3,2.2000000000000002,2.8999999999999999,2.8999999999999999,3.1000000000000001,3,2.7000000000000002,2.2000000000000002,2.5,3.2000000000000002,2.7999999999999998,2.5,2.7999999999999998,2.8999999999999999,3,2.7999999999999998,3,2.8999999999999999,2.6000000000000001,2.3999999999999999,2.3999999999999999,2.7000000000000002,2.7000000000000002,3,3.3999999999999999,3.1000000000000001,2.2999999999999998,3,2.5,2.6000000000000001,3,2.6000000000000001,2.2999999999999998,2.7000000000000002,3,2.8999999999999999,2.8999999999999999,2.5,2.7999999999999998],"mode":"markers","type":"scatter","name":"versicolor","marker":{"color":"rgba(252,141,98,1)","line":{"color":"rgba(252,141,98,1)"}},"textfont":{"color":"rgba(252,141,98,1)"},"error_y":{"color":"rgba(252,141,98,1)"},"error_x":{"color":"rgba(252,141,98,1)"},"line":{"color":"rgba(252,141,98,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[6.2999999999999998,5.7999999999999998,7.0999999999999996,6.2999999999999998,6.5,7.5999999999999996,4.9000000000000004,7.2999999999999998,6.7000000000000002,7.2000000000000002,6.5,6.4000000000000004,6.7999999999999998,5.7000000000000002,5.7999999999999998,6.4000000000000004,6.5,7.7000000000000002,7.7000000000000002,6,6.9000000000000004,5.5999999999999996,7.7000000000000002,6.2999999999999998,6.7000000000000002,7.2000000000000002,6.2000000000000002,6.0999999999999996,6.4000000000000004,7.2000000000000002,7.4000000000000004,7.9000000000000004,6.4000000000000004,6.2999999999999998,6.0999999999999996,7.7000000000000002,6.2999999999999998,6.4000000000000004,6,6.9000000000000004,6.7000000000000002,6.9000000000000004,5.7999999999999998,6.7999999999999998,6.7000000000000002,6.7000000000000002,6.2999999999999998,6.5,6.2000000000000002,5.9000000000000004],"y":[3.2999999999999998,2.7000000000000002,3,2.8999999999999999,3,3,2.5,2.8999999999999999,2.5,3.6000000000000001,3.2000000000000002,2.7000000000000002,3,2.5,2.7999999999999998,3.2000000000000002,3,3.7999999999999998,2.6000000000000001,2.2000000000000002,3.2000000000000002,2.7999999999999998,2.7999999999999998,2.7000000000000002,3.2999999999999998,3.2000000000000002,2.7999999999999998,3,2.7999999999999998,3,2.7999999999999998,3.7999999999999998,2.7999999999999998,2.7999999999999998,2.6000000000000001,3,3.3999999999999999,3.1000000000000001,3,3.1000000000000001,3.1000000000000001,3.1000000000000001,2.7000000000000002,3.2000000000000002,3.2999999999999998,3,2.5,3,3.3999999999999999,3],"mode":"markers","type":"scatter","name":"virginica","marker":{"color":"rgba(141,160,203,1)","line":{"color":"rgba(141,160,203,1)"}},"textfont":{"color":"rgba(141,160,203,1)"},"error_y":{"color":"rgba(141,160,203,1)"},"error_x":{"color":"rgba(141,160,203,1)"},"line":{"color":"rgba(141,160,203,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>


### Global and Local Font Specification

You can set the figure-wide font with the `layout.font.family` attribute, which will apply to all titles and tick labels, but this can be overridden for specific plot items like individual axes and legend titles etc. In the following figure, we set the figure-wide font to Courier New in blue, and then override this for certain parts of the figure.


``` r
library(plotly)
data(iris)

t <- list(
  family = "Courier New",
  size = 14,
  color = "blue")
t1 <- list(
  family = "Times New Roman",
  color = "red"
)
t2 <- list(
  family = "Courier New",
  size = 14,
  color = "green")
t3 <- list(family = 'Arial')

fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Sepal.Width, color = ~Species, 
               type = 'scatter', mode = 'markers')%>% 
  layout(title= list(text = "Playing with Fonts",font = t1), font=t, 
         legend=list(title=list(text='Species',font = t2)), 
         xaxis = list(title = list(text ='Sepal.Length', font = t3)),
         plot_bgcolor='#e5ecf6')
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-8193e9b0787107c3c7b7" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-8193e9b0787107c3c7b7">{"x":{"visdat":{"2fc9261512b3":["function () ","plotlyVisDat"]},"cur_data":"2fc9261512b3","attrs":{"2fc9261512b3":{"x":{},"y":{},"mode":"markers","color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":{"text":"Playing with Fonts","font":{"family":"Times New Roman","color":"red"}},"font":{"family":"Courier New","size":14,"color":"blue"},"legend":{"title":{"text":"Species","font":{"family":"Courier New","size":14,"color":"green"}}},"xaxis":{"domain":[0,1],"automargin":true,"title":{"text":"Sepal.Length","font":{"family":"Arial"}}},"plot_bgcolor":"#e5ecf6","yaxis":{"domain":[0,1],"automargin":true,"title":"Sepal.Width"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[5.0999999999999996,4.9000000000000004,4.7000000000000002,4.5999999999999996,5,5.4000000000000004,4.5999999999999996,5,4.4000000000000004,4.9000000000000004,5.4000000000000004,4.7999999999999998,4.7999999999999998,4.2999999999999998,5.7999999999999998,5.7000000000000002,5.4000000000000004,5.0999999999999996,5.7000000000000002,5.0999999999999996,5.4000000000000004,5.0999999999999996,4.5999999999999996,5.0999999999999996,4.7999999999999998,5,5,5.2000000000000002,5.2000000000000002,4.7000000000000002,4.7999999999999998,5.4000000000000004,5.2000000000000002,5.5,4.9000000000000004,5,5.5,4.9000000000000004,4.4000000000000004,5.0999999999999996,5,4.5,4.4000000000000004,5,5.0999999999999996,4.7999999999999998,5.0999999999999996,4.5999999999999996,5.2999999999999998,5],"y":[3.5,3,3.2000000000000002,3.1000000000000001,3.6000000000000001,3.8999999999999999,3.3999999999999999,3.3999999999999999,2.8999999999999999,3.1000000000000001,3.7000000000000002,3.3999999999999999,3,3,4,4.4000000000000004,3.8999999999999999,3.5,3.7999999999999998,3.7999999999999998,3.3999999999999999,3.7000000000000002,3.6000000000000001,3.2999999999999998,3.3999999999999999,3,3.3999999999999999,3.5,3.3999999999999999,3.2000000000000002,3.1000000000000001,3.3999999999999999,4.0999999999999996,4.2000000000000002,3.1000000000000001,3.2000000000000002,3.5,3.6000000000000001,3,3.3999999999999999,3.5,2.2999999999999998,3.2000000000000002,3.5,3.7999999999999998,3,3.7999999999999998,3.2000000000000002,3.7000000000000002,3.2999999999999998],"mode":"markers","type":"scatter","name":"setosa","marker":{"color":"rgba(102,194,165,1)","line":{"color":"rgba(102,194,165,1)"}},"textfont":{"color":"rgba(102,194,165,1)"},"error_y":{"color":"rgba(102,194,165,1)"},"error_x":{"color":"rgba(102,194,165,1)"},"line":{"color":"rgba(102,194,165,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[7,6.4000000000000004,6.9000000000000004,5.5,6.5,5.7000000000000002,6.2999999999999998,4.9000000000000004,6.5999999999999996,5.2000000000000002,5,5.9000000000000004,6,6.0999999999999996,5.5999999999999996,6.7000000000000002,5.5999999999999996,5.7999999999999998,6.2000000000000002,5.5999999999999996,5.9000000000000004,6.0999999999999996,6.2999999999999998,6.0999999999999996,6.4000000000000004,6.5999999999999996,6.7999999999999998,6.7000000000000002,6,5.7000000000000002,5.5,5.5,5.7999999999999998,6,5.4000000000000004,6,6.7000000000000002,6.2999999999999998,5.5999999999999996,5.5,5.5,6.0999999999999996,5.7999999999999998,5,5.5999999999999996,5.7000000000000002,5.7000000000000002,6.2000000000000002,5.0999999999999996,5.7000000000000002],"y":[3.2000000000000002,3.2000000000000002,3.1000000000000001,2.2999999999999998,2.7999999999999998,2.7999999999999998,3.2999999999999998,2.3999999999999999,2.8999999999999999,2.7000000000000002,2,3,2.2000000000000002,2.8999999999999999,2.8999999999999999,3.1000000000000001,3,2.7000000000000002,2.2000000000000002,2.5,3.2000000000000002,2.7999999999999998,2.5,2.7999999999999998,2.8999999999999999,3,2.7999999999999998,3,2.8999999999999999,2.6000000000000001,2.3999999999999999,2.3999999999999999,2.7000000000000002,2.7000000000000002,3,3.3999999999999999,3.1000000000000001,2.2999999999999998,3,2.5,2.6000000000000001,3,2.6000000000000001,2.2999999999999998,2.7000000000000002,3,2.8999999999999999,2.8999999999999999,2.5,2.7999999999999998],"mode":"markers","type":"scatter","name":"versicolor","marker":{"color":"rgba(252,141,98,1)","line":{"color":"rgba(252,141,98,1)"}},"textfont":{"color":"rgba(252,141,98,1)"},"error_y":{"color":"rgba(252,141,98,1)"},"error_x":{"color":"rgba(252,141,98,1)"},"line":{"color":"rgba(252,141,98,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[6.2999999999999998,5.7999999999999998,7.0999999999999996,6.2999999999999998,6.5,7.5999999999999996,4.9000000000000004,7.2999999999999998,6.7000000000000002,7.2000000000000002,6.5,6.4000000000000004,6.7999999999999998,5.7000000000000002,5.7999999999999998,6.4000000000000004,6.5,7.7000000000000002,7.7000000000000002,6,6.9000000000000004,5.5999999999999996,7.7000000000000002,6.2999999999999998,6.7000000000000002,7.2000000000000002,6.2000000000000002,6.0999999999999996,6.4000000000000004,7.2000000000000002,7.4000000000000004,7.9000000000000004,6.4000000000000004,6.2999999999999998,6.0999999999999996,7.7000000000000002,6.2999999999999998,6.4000000000000004,6,6.9000000000000004,6.7000000000000002,6.9000000000000004,5.7999999999999998,6.7999999999999998,6.7000000000000002,6.7000000000000002,6.2999999999999998,6.5,6.2000000000000002,5.9000000000000004],"y":[3.2999999999999998,2.7000000000000002,3,2.8999999999999999,3,3,2.5,2.8999999999999999,2.5,3.6000000000000001,3.2000000000000002,2.7000000000000002,3,2.5,2.7999999999999998,3.2000000000000002,3,3.7999999999999998,2.6000000000000001,2.2000000000000002,3.2000000000000002,2.7999999999999998,2.7999999999999998,2.7000000000000002,3.2999999999999998,3.2000000000000002,2.7999999999999998,3,2.7999999999999998,3,2.7999999999999998,3.7999999999999998,2.7999999999999998,2.7999999999999998,2.6000000000000001,3,3.3999999999999999,3.1000000000000001,3,3.1000000000000001,3.1000000000000001,3.1000000000000001,2.7000000000000002,3.2000000000000002,3.2999999999999998,3,2.5,3,3.3999999999999999,3],"mode":"markers","type":"scatter","name":"virginica","marker":{"color":"rgba(141,160,203,1)","line":{"color":"rgba(141,160,203,1)"}},"textfont":{"color":"rgba(141,160,203,1)"},"error_y":{"color":"rgba(141,160,203,1)"},"error_x":{"color":"rgba(141,160,203,1)"},"line":{"color":"rgba(141,160,203,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

### Fonts and Labels in Dash
[Dash for R](https://dashr.plotly.com) is an open-source framework for building analytical applications, with no Javascript required, and it is tightly integrated with the Plotly graphing library.

Learn about how to install Dash for R at https://dashr.plot.ly/installation.

Everywhere in this page that you see fig, you can display the same figure in a Dash for R application by passing it to the figure argument.


``` r
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(devtools)
library(plotly)
library(dashDaq)
data("iris")


app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccGraph(id = 'graph'),
      daqColorPicker(id = 'font',
                     label = 'Font Color',
                     value = list(hex = "#119DFF")),
      daqColorPicker(id = 'title',
                     label = 'Title Color',
                     value = list(hex = "#2A0203"))
      
    )
  )
)

app$callback(
  output(id = 'graph', property='figure'),
  params=list(input(id='font', property='value'), 
              input(id='title', property='value')),
  function(font_color, title_color) {
    t <- list(
      family = "Courier New",
      size = 14,
      color = strsplit(toString(font_color), split = ",")[[1]][1]
      )
    t1 <- list(
      family = "Times New Roman",
      color = strsplit(toString(title_color), split = ",")[[1]][1]
    )
    t2 <- list(
      family = "Courier New",
      size = 14,
      color = strsplit(toString(font_color), split = ",")[[1]][1])
    t3 <- list(family = 'Arial')
    
    fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Sepal.Width, color = ~Species, 
                   type = 'scatter', mode = 'markers')%>% 
      layout(title= list(text = "Playing with Fonts",font = t1), font=t, 
             legend=list(title=list(text='Species',font = t2)), 
             xaxis = list(title = list(text ='Sepal.Length', font = t3)))
  
    return(fig)
  })
```

After executing this code, give app$run_server() in the console to start the dash.

### Manual Labelling in Plotly 

Explicitly Labeling traces and axes in Plotly.


``` r
library(plotly)
t <- list(
  family = "Courier New, monospace",
  size = 15,
  color = "RebeccaPurple")
x1 = c(0, 1, 2, 3, 4, 5, 6, 7, 8)
y1 = c(0, 1, 2, 3, 4, 5, 6, 7, 8)

x2 = c(0, 1, 2, 3, 4, 5, 6, 7, 8)
y2 = c(1, 0, 3, 2, 5, 4, 7, 6, 8)

df = data.frame(x1, y1, x2, y2)

fig <-  plot_ly()%>%
  add_trace(df, x = ~x1, y = ~y1, type = 'scatter', mode = 'lines+markers', name = 'Name of Trace 1')%>%
  add_trace(df, x = ~x2, y = ~y2, type = 'scatter', mode = 'lines+markers', name = 'Name of Trace 2')%>%
  layout(title = 'Plot Title', xaxis = list(title = 'X Axis Title'), font=t, plot_bgcolor = "#e5ecf6",
         yaxis = list(title = 'Y Axis Title'), legend = list(title=list(text='Legend Title')))

fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-ea989414d21f66b2fcce" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-ea989414d21f66b2fcce">{"x":{"visdat":{"2fc95629ae75":["function () ","plotlyVisDat"]},"cur_data":"2fc95629ae75","attrs":{"2fc95629ae75":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"scatter","mode":"lines+markers","name":"Name of Trace 1","inherit":true},"2fc95629ae75.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"scatter","mode":"lines+markers","name":"Name of Trace 2","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Plot Title","xaxis":{"domain":[0,1],"automargin":true,"title":"X Axis Title"},"font":{"family":"Courier New, monospace","size":15,"color":"RebeccaPurple"},"plot_bgcolor":"#e5ecf6","yaxis":{"domain":[0,1],"automargin":true,"title":"Y Axis Title"},"legend":{"title":{"text":"Legend Title"}},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[0,1,2,3,4,5,6,7,8],"y":[0,1,2,3,4,5,6,7,8],"type":"scatter","mode":"lines+markers","name":"Name of Trace 1","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[0,1,2,3,4,5,6,7,8],"y":[1,0,3,2,5,4,7,6,8],"type":"scatter","mode":"lines+markers","name":"Name of Trace 2","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"line":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

The configuration of the legend is discussed in detail in the [Legends](https://plotly.com/r/legend/) page.

### Align Plot Title
The following example shows how to align the plot title in [layout.title](https://plotly.com/r/reference/layout/#layout-title). `x` sets the x position with respect to `xref` from "0" (left) to "1" (right), and `y` sets the y position with respect to `yref` from "0" (bottom) to "1" (top). Moreover, you can define `xanchor` to `left`,`right`, or `center` for setting the title's horizontal alignment with respect to its x position, and/or `yanchor` to `top`, `bottom`, or `middle` for setting the title's vertical alignment with respect to its y position.


``` r
library(plotly)

fig <- plot_ly(x= c('Mon', 'Tue', 'Wed'), y= c(3,1,4), type= 'scatter', mode= 'lines+markers')%>% 
  layout(title = list(text='Plot Title', y = 0.95, x = 0.5, xanchor = 'center', yanchor =  'top'), plot_bgcolor = "#e5ecf6")
fig
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-7f198a1b9c5d03e4e308" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-7f198a1b9c5d03e4e308">{"x":{"visdat":{"2fc9430b671f":["function () ","plotlyVisDat"]},"cur_data":"2fc9430b671f","attrs":{"2fc9430b671f":{"x":["Mon","Tue","Wed"],"y":[3,1,4],"mode":"lines+markers","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":{"text":"Plot Title","y":0.94999999999999996,"x":0.5,"xanchor":"center","yanchor":"top"},"plot_bgcolor":"#e5ecf6","xaxis":{"domain":[0,1],"automargin":true,"title":[],"type":"category","categoryorder":"array","categoryarray":["Mon","Tue","Wed"]},"yaxis":{"domain":[0,1],"automargin":true,"title":[]},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":["Mon","Tue","Wed"],"y":[3,1,4],"mode":"lines+markers","type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

#### Reference
See https://plotly.com/r/reference/layout/ for more information!

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