# Announcing Plotly.R 4.9.2

I’m excited to announce that Plotly.R 4.9.2 is now available for download via `devtools` and `CRAN`. For up-to-date installation instructions, please see our [Getting Started](https://plotly.com/r/getting-started/) documentation page. 

## What’s New in Plotly.R 4.9.2?

### Powered by Plotly.js 1.52, perfect for Dash For R 0.3.1

This release of Plotly.R inherits all of the improvements to the underlying JavaScript library that powers it. The full [Plotly.js 1.52.x changelog](https://github.com/plotly/plotly.js/blob/master/CHANGELOG.md#1520----2020-01-08) contains more details about what changed under the hood. 

The version of Plotly.js that Plotly.R 4.9.2 is built on is the same one that’s bundled with the recently-released [Dash For R 0.3.1](https://dashr.plotly.com/installation), so we recommend that if you’re a Dash For R user you upgrade both Dash For R and Plotly.R to their latest versions to get the full benefit of all of these libraries working together.

#### Legend Titles

We’ve finally implemented a long-requested feature: [first-class legend titles](https://plotly.com/r/legend/#legend-title)! These are configurable under `layout.legend.title`, as one would expect.

Check out the image below to see how much nicer this makes everything look.

![alt text](https://user-images.githubusercontent.com/1557650/78181150-e3114200-7431-11ea-9075-83ee41c482a9.png "a chart with a legend title")

#### GeoJson Choropleth Maps and Mapping Improvements

Choropleth maps now accept a `geojson` argument. This means that you can now supply your own geometry information to non-tile-map choropleth maps, instead of relying on Plotly’s built-in country and state maps. Some other new mapping features include:

- New [`featureidkey`](https://plotly.com/r/mapbox-county-choropleth/#geojson-with-featureid) attribute  to let you use GeoJSON objects whose identifiers are in the properties object of a feature, rather than always and only using the `id` field. (This was added to the Mapbox choropleth trace as well.)

- New `fitbounds` attribute in `layout.geo` to make it easier to position these new choropleth maps.

- New `visible` attribute in `layout.geo` to make it easier to style these new choropleth maps.

- New `showlegend` attributes on go.Choropleth traces, which enable the use of discrete color on choropleth maps 1. This was added to the Mapbox choropleth  as well.

What does this all mean? It means you can now make any of this map with a single chained R statement!

![alt text](https://user-images.githubusercontent.com/1557650/78181148-e278ab80-7431-11ea-9eb8-4411730f9cbf.png "a chart with a map")

#### New treemap and sunburst charts API

[Sunburst](https://plotly.com/r/sunburst-charts/) and [treemap]https://plotly.com/r/treemaps/
 traces now support a new argument called path which behaves a bit like dimensions in our other multi-dimensional data-exploration functions. It’s an easier way to create sunbursts and treemaps from “rectangular” data in data frames which have one column per level in a hierarchy. This makes sunbursts and treemaps much easier to use for exploring multi-dimensional datasets.

 A common scenario for which this API is a great fit is when you want to visualize a ratio across a hierarchy or a set of variables. For example, on a restaurant bill, the ratio between the tip and the total bill is the tip percentage: tip_pct = tip/total_bill. 

#### Uniform Text & Text Orientation
By default, when displaying text with bar-like traces (bar, funnel and waterfall charts) or part-of-whole traces like pie and funnel-area charts as well as sunbursts and treemaps, Plotly.R will scale the text per bar or per sector so as to make each text label fit. This is helpful for seeing all text labels but can result in some odd or distracting variations in text sizes. With the new `layout.uniformtext` options, you can now [force the text to be the same size](https://plotly.com/r/text-and-annotations/#controlling-text-fontsize-with-uniformtext) across similar traces, so that all the bar labels or all the sunburst labels end up having the same font-size.

In terms of text orientation, by default Plotly.R will try various text orientations within a pie or sunburst sector to see how it can make the text biggest/most-legible. Again this can be distracting or unappealing in certain cases, so the new [`insidetextorientation`](https://plotly.com/r/pie-charts/#controlling-text-orientation-inside-sunburst-sectors) attribute lets you specify whether you want your text to be always horizontal, radial or tangential.

Together these two attributes can be used to create very attractive, regular-looking bar, waterfall, funnel, pie, sunburst and treemap charts!

[alt text](https://user-images.githubusercontent.com/1557650/78181140-e1e01500-7431-11ea-857c-a871e413f151.png "a chart with a map")

#### New Box Plot Options

There are many ways to calculate the quartiles of a dataset, and now you can choose among three different quartile-calculation algorithms when using Plotly.R [box plots](https://plotly.com/r/box-plots/#choosing-the-algorithm-for-computing-quartiles)! To quote our Figure Reference documentation for the new `quartilemethod` attribute:

- Sets the method used to compute the sample’s Q1 and Q3 quartiles. The “linear” method uses the 25th percentile for Q1 and 75th percentile for Q3 as computed using method #10 (listed on http://www.amstat.org/publications/jse/v14n3/langford.html). The “exclusive” method uses the median to divide the ordered dataset into two halves if the sample is odd, it does not include the median in either half - Q1 is then the median of the lower half and Q3 the median of the upper half. The “inclusive” method also uses the median to divide the ordered dataset into two halves but if the sample is odd, it includes the median in both halves - Q1 is then the median of the lower half and Q3 the median of the upper half.

Here is a visualization of the three methods on the same dataset of integers from 1 to 5:

[alt text](https://user-images.githubusercontent.com/1557650/78181139-e1477e80-7431-11ea-9da5-b72c4d3999b4.png "a boxplot chart")

In addition to these enhancements, it is now possible to [explicitly specify all the parameters of a box plot](https://plotly.com/r/box-plots/#box-plot-with-precomputed- quartiles), for when you want to do the quartile and other calculations externally to the visualization.

These were two sponsored features and we heartily thank our sponsors for supporting open-source software development and allowing us to make these features available to everyone else in the world for free :heart:. If your organization has a software budget, reach out to us to fund your favorite feature requests.

#### Image Traces
You can now explore [multichannel image data](https://plotly.com/r/displaying-images/) in interactive charts, for applications such as satellite imaging, medical imaging, quality inspection, building training sets for machine learning models, etc.

![alt text](https://user-images.githubusercontent.com/1557650/78181132-df7dbb00-7431-11ea-8a57-9b0dbe1c4779.png "a chart with an image")

#### Major Documentation Work

Beyond shipping new features, our Graphing Library team has been hard at work improving the Plotly.R documentation:

- We created a separate GitHub repository at https://github.com/plotly/plotly.r-docs to version control Plotly's R and ggplot2 documentation examples, which are written in RMarkdown. Contributing to these docs is as simple as making a pull request in that repo!

- Every R example figure now gets executed at build time, decreasing the chance that a user will come across a code example which doesn't work.

### Get it now!

To sum up: Plotly.R 4.9.2 is out and if you’re excited about any of the above features, head on over to our [Getting Started](https://plotly.com/r/getting-started/) documentation page for full installation instructions.
