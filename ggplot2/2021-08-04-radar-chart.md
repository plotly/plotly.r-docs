---
description: How to make Radar Charts in ggplot2 with Plotly.
name: Radar Charts
permalink: ggplot2/radar-chart/
thumnail_github: radar.gif
layout: base
language: ggplot2
display_as: scientific
page_type: u-guide
order: 17
output:
  html_document:
    keep_md: true
---



## Default radar plot

Radar charts are also called Spider or Web or Polar charts.

Input data format is very specific. Each row must be an entity. Each column is a quantitative variable. First 2 rows provide the min and the max that will be used for each variable.

Once you have this format, the radarchart() function makes all the job for you.


``` r
library(plotly)
library(ggplot2)
library(fmsb)

data <- as.data.frame(matrix( sample( 2:20 , 10 , replace=T) , ncol=10))
colnames(data) <- c("math" , "english" , "biology" , "music" , "R-coding", "data-viz" , "french" , "physic", "statistic", "sport" )

data <- rbind(rep(20,10) , rep(0,10) , data)

p <- radarchart(data)

ggplotly(p)
```




## Adding style



``` r
library(plotly)
library(fmsb)

data <- as.data.frame(matrix( sample( 2:20 , 10 , replace=T) , ncol=10))
colnames(data) <- c("math" , "english" , "biology" , "music" , "R-coding", "data-viz" , "french" , "physic", "statistic", "sport" )

data <- rbind(rep(20,10) , rep(0,10) , data)

p <- radarchart( data  , axistype=1 ,
    pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 ,
    cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
    vlcex=0.8
    )

ggplotly(p)
```



## Plotting multiple groups



``` r
library(plotly)
library(fmsb)

data <- as.data.frame(matrix( sample( 0:20 , 15 , replace=F) , ncol=5))
colnames(data) <- c("math" , "english" , "biology" , "music" , "R-coding" )
rownames(data) <- paste("mister" , letters[1:3] , sep="-")

data <- rbind(rep(20,5) , rep(0,5) , data)

p <- radarchart(data)

ggplotly(p)
```

Adding style:

``` r
library(plotly)
library(fmsb)

data <- as.data.frame(matrix( sample( 0:20 , 15 , replace=F) , ncol=5))
colnames(data) <- c("math" , "english" , "biology" , "music" , "R-coding" )
rownames(data) <- paste("mister" , letters[1:3] , sep="-")

data <- rbind(rep(20,5) , rep(0,5) , data)

colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )

p <- radarchart( data  , axistype=1 ,
    pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
    cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
    vlcex=0.8
    )

legend(x=0.7, y=1, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)

ggplotly(p)
```



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
