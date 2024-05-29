---
description: How to make Funnel Chart in ggplot2 with Plotly.
name: Funnel Chart
permalink: ggplot2/funnel-charts/
thumnail_github: funnel-charts.png
layout: base
language: ggplot2
display_as: financial
page_type: u-guide
order: 4
output:
  html_document:
    keep_md: true
---



## Funnel plot example



``` r
library(plotly)
library(ggplot2)
library(tidyverse)

STAGE <- c('Stage 01: Browsers','Stage 02: Unbounced Users','Stage 03: Email Signups','Stage 04: Email Confirmed','Stage 05: Campaign-Email Opens','Stage 06: Campaign-Email Clickthroughs','Stage 07: Buy Button Page','Stage 08: Buy Button Clickers','Stage 09: Cart Confirmation Page','Stage 10: Address Verification Page','Stage 11: Submit Order Page','Stage 12: Payment','Stage 13: Payment Successful','Stage 14: 1st Successful Purchase','Stage 15: 2nd Purchase','Stage 16: 3rd Purchase','Stage 17: 4th Purchase','Stage 18: 5th Purchase','Stage 01: Browsers','Stage 02: Unbounced Users','Stage 03: Email Signups','Stage 04: Email Confirmed','Stage 05: Campaign-Email Opens','Stage 06: Campaign-Email Clickthroughs','Stage 07: Buy Button Page','Stage 08: Buy Button Clickers','Stage 09: Cart Confirmation Page','Stage 10: Address Verification Page','Stage 11: Submit Order Page','Stage 12: Payment','Stage 13: Payment Successful','Stage 14: 1st Successful Purchase','Stage 15: 2nd Purchase','Stage 16: 3rd Purchase','Stage 17: 4th Purchase','Stage 18: 5th Purchase')

GENDER <- c('Male','Male','Male','Male','Male','Male','Male','Male','Male','Male','Male','Male','Male','Male','Male','Male','Male','Male','Female','Female','Female','Female','Female','Female','Female','Female','Female','Female','Female','Female','Female','Female','Female','Female','Female','Female')

USERS <- c(-14927618.71,-12862663.41,-11361896.41,-9411708.103,-8074316.616,-6958512.218,-6045363.483,-5029954.214,-4008034.113,-3172555.225,-2484808.199,-1903727.481,-1490277.016,-1152003.965,-770748.0581,-434430.0282,-195031.8899,-58570.22156,14226434.29,12276042.59,10850385.59,8999931.897,7732693.384,6666393.782,5743259.517,4723254.786,3680878.887,3002640.775,2467804.801,1977277.519,1593649.984,1229651.035,828496.9419,486621.9718,227106.1101,73466.77844)


df <- data.frame(STAGE, GENDER, USERS)

brks <- c(seq(-15000000, 15000000, by = 5000000))
lbls = c(seq(15, 0, -5), seq(5, 15, 5))

p <- df %>% mutate(USERS = as.numeric(USERS)) %>%
              ggplot(aes(x = reorder(STAGE,abs(USERS)), y = USERS, fill = GENDER)) +
              geom_bar(stat = "identity", width = .6) +
              scale_y_continuous(breaks = brks, labels = lbls) +
              coord_flip() +
              theme_minimal() +
              labs(title="Email Campaign Funnel") +
              theme(plot.title = element_text(hjust = .5),
                                    axis.ticks = element_blank())

ggplotly(p)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-9eb7533e714841a0edba" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-9eb7533e714841a0edba">{"x":{"data":[{"orientation":"h","width":[0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000053,0.59999999999999964,0.59999999999999964,0.59999999999999964,0.59999999999999964,0.59999999999999964,0.59999999999999987,0.60000000000000009],"base":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"x":[14226434.289999999,12276042.59,10850385.59,8999931.8969999999,7732693.3839999996,6666393.7819999997,5743259.517,4723254.7860000003,3680878.8870000001,3002640.7749999999,2467804.801,1977277.5190000001,1593649.9839999999,1229651.0349999999,828496.94189999998,486621.9718,227106.11009999999,73466.778439999995],"y":[18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1],"text":["reorder(STAGE, abs(USERS)): Stage 01: Browsers<br />USERS: 14226434.29<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 02: Unbounced Users<br />USERS: 12276042.59<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 03: Email Signups<br />USERS: 10850385.59<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 04: Email Confirmed<br />USERS:  8999931.90<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 05: Campaign-Email Opens<br />USERS:  7732693.38<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 06: Campaign-Email Clickthroughs<br />USERS:  6666393.78<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 07: Buy Button Page<br />USERS:  5743259.52<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 08: Buy Button Clickers<br />USERS:  4723254.79<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 09: Cart Confirmation Page<br />USERS:  3680878.89<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 10: Address Verification Page<br />USERS:  3002640.77<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 11: Submit Order Page<br />USERS:  2467804.80<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 12: Payment<br />USERS:  1977277.52<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 13: Payment Successful<br />USERS:  1593649.98<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 14: 1st Successful Purchase<br />USERS:  1229651.03<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 15: 2nd Purchase<br />USERS:   828496.94<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 16: 3rd Purchase<br />USERS:   486621.97<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 17: 4th Purchase<br />USERS:   227106.11<br />GENDER: Female","reorder(STAGE, abs(USERS)): Stage 18: 5th Purchase<br />USERS:    73466.78<br />GENDER: Female"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(248,118,109,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"name":"Female","legendgroup":"Female","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":[0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000142,0.60000000000000053,0.59999999999999964,0.59999999999999964,0.59999999999999964,0.59999999999999964,0.59999999999999964,0.59999999999999987,0.60000000000000009],"base":[-14927618.710000001,-12862663.41,-11361896.41,-9411708.1030000001,-8074316.6160000004,-6958512.2180000003,-6045363.483,-5029954.2139999997,-4008034.1129999999,-3172555.2250000001,-2484808.199,-1903727.4809999999,-1490277.0160000001,-1152003.9650000001,-770748.05810000002,-434430.0282,-195031.88990000001,-58570.221559999998],"x":[14927618.710000001,12862663.41,11361896.41,9411708.1030000001,8074316.6160000004,6958512.2180000003,6045363.483,5029954.2139999997,4008034.1129999999,3172555.2250000001,2484808.199,1903727.4809999999,1490277.0160000001,1152003.9650000001,770748.05810000002,434430.0282,195031.88990000001,58570.221559999998],"y":[18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1],"text":["reorder(STAGE, abs(USERS)): Stage 01: Browsers<br />USERS: 14927618.71<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 02: Unbounced Users<br />USERS: 12862663.41<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 03: Email Signups<br />USERS: 11361896.41<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 04: Email Confirmed<br />USERS:  9411708.10<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 05: Campaign-Email Opens<br />USERS:  8074316.62<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 06: Campaign-Email Clickthroughs<br />USERS:  6958512.22<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 07: Buy Button Page<br />USERS:  6045363.48<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 08: Buy Button Clickers<br />USERS:  5029954.21<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 09: Cart Confirmation Page<br />USERS:  4008034.11<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 10: Address Verification Page<br />USERS:  3172555.23<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 11: Submit Order Page<br />USERS:  2484808.20<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 12: Payment<br />USERS:  1903727.48<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 13: Payment Successful<br />USERS:  1490277.02<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 14: 1st Successful Purchase<br />USERS:  1152003.97<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 15: 2nd Purchase<br />USERS:   770748.06<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 16: 3rd Purchase<br />USERS:   434430.03<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 17: 4th Purchase<br />USERS:   195031.89<br />GENDER: Male","reorder(STAGE, abs(USERS)): Stage 18: 5th Purchase<br />USERS:    58570.22<br />GENDER: Male"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(0,191,196,1)","line":{"width":1.8897637795275593,"color":"transparent"}},"name":"Male","legendgroup":"Male","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":43.762557077625573,"r":7.3059360730593621,"b":40.182648401826491,"l":247.67123287671237},"font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"title":{"text":"Email Campaign Funnel","font":{"color":"rgba(0,0,0,1)","family":"","size":17.534246575342465},"x":0.5,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-16385321.360000001,15684136.939999999],"tickmode":"array","ticktext":[15,10,5,0,5,10,15],"tickvals":[-15000000,-10000000,-5000000,1.862645149230957e-09,4999999.9999999981,9999999.9999999981,14999999.999999998],"categoryorder":"array","categoryarray":[15,10,5,0,5,10,15],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.6529680365296811,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"USERS","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,18.600000000000001],"tickmode":"array","ticktext":["Stage 18: 5th Purchase","Stage 17: 4th Purchase","Stage 16: 3rd Purchase","Stage 15: 2nd Purchase","Stage 14: 1st Successful Purchase","Stage 13: Payment Successful","Stage 12: Payment","Stage 11: Submit Order Page","Stage 10: Address Verification Page","Stage 09: Cart Confirmation Page","Stage 08: Buy Button Clickers","Stage 07: Buy Button Page","Stage 06: Campaign-Email Clickthroughs","Stage 05: Campaign-Email Opens","Stage 04: Email Confirmed","Stage 03: Email Signups","Stage 02: Unbounced Users","Stage 01: Browsers"],"tickvals":[1,2,3,4,5,5.9999999999999991,7,8,9,10,11,12,13,14,15,16,17,18],"categoryorder":"array","categoryarray":["Stage 18: 5th Purchase","Stage 17: 4th Purchase","Stage 16: 3rd Purchase","Stage 15: 2nd Purchase","Stage 14: 1st Successful Purchase","Stage 13: Payment Successful","Stage 12: Payment","Stage 11: Submit Order Page","Stage 10: Address Verification Page","Stage 09: Cart Confirmation Page","Stage 08: Buy Button Clickers","Stage 07: Buy Button Page","Stage 06: Campaign-Email Clickthroughs","Stage 05: Campaign-Email Opens","Stage 04: Email Confirmed","Stage 03: Email Signups","Stage 02: Unbounced Users","Stage 01: Browsers"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.6529680365296811,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"reorder(STAGE, abs(USERS))","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498},"title":{"text":"GENDER","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"3cb374ded2bb":{"x":{},"y":{},"fill":{},"type":"bar"}},"cur_data":"3cb374ded2bb","visdat":{"3cb374ded2bb":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>




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
