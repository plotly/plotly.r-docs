---
description: How to do PCA Visualization in ggplot2 with Plotly.
name: PCA Visualization
permalink: ggplot2/pca-visualization/
thumbnail: thumbnail/ml-pca.png
layout: base
language: ggplot2
display_as: ai_ml
page_type: u-guide
order: 4
output:
  html_document:
    keep_md: true
---

```{r, echo = FALSE, message=FALSE}
knitr::opts_chunk$set(message = FALSE, warning=FALSE)
```

`ggfortify` lets `ggplot2` know how to interpret PCA objects. After loading `ggfortify`, you can use `ggplot2::autoplot` function for `stats::prcomp` and `stats::princomp` objects.

## Default plot


```{r}
library(plotly)
library(ggfortify)

df <- iris[1:4]
pca_res <- prcomp(df, scale. = TRUE)

p <- autoplot(pca_res)

ggplotly(p)
```

PCA result should only contains numeric values. If you want to colorize by non-numeric values which original data has, pass original `data` using data keyword and then specify column name by `colour` keyword. Use `help(autoplot.prcomp)` (or `help(autoplot.*)` for any other objects) to check available options.


```{r}
library(plotly)
library(ggfortify)

df <- iris[1:4]
pca_res <- prcomp(df, scale. = TRUE)

p <- autoplot(pca_res, data = iris, colour = 'Species')

ggplotly(p)
```



# Adding data labels

Passing `label = TRUE `draws each data label using `rownames`

```{r}
library(plotly)
library(ggfortify)

df <- iris[1:4]
pca_res <- prcomp(df, scale. = TRUE)

p <- autoplot(pca_res, data = iris, colour = 'Species', label = TRUE, label.size = 3)

ggplotly(p)
```

Passing `shape = FALSE` makes plot without points. In this case, `label` is turned on unless otherwise specified.



```{r}
library(plotly)
library(ggfortify)

df <- iris[1:4]
pca_res <- prcomp(df, scale. = TRUE)

p <- autoplot(pca_res, data = iris, colour = 'Species', shape = FALSE, label.size = 3)

ggplotly(p)
```

# Displaying eigenvectors.

Passing `loadings = TRUE` draws eigenvectors.


```{r}
library(plotly)
library(ggfortify)

df <- iris[1:4]
pca_res <- prcomp(df, scale. = TRUE)

p <- autoplot(pca_res, data = iris, colour = 'Species', loadings = TRUE)

ggplotly(p)
```

You can attach eigenvector labels and change some options.


```{r}
library(plotly)

df <- iris[1:4]
pca_res <- prcomp(df, scale. = TRUE)

p <- autoplot(pca_res, data = iris, colour = 'Species',
              loadings = TRUE, loadings.colour = 'blue',
              loadings.label = TRUE, loadings.label.size = 3)

ggplotly(p)
```


<!--------------------- EXAMPLE BREAK ------------------------->