# Announcing Plotly.R 4.9.2 For Dash For R 0.3.1

I’m excited to announce that Plotly.R 4.9.2 is now available for download via `devtools` and `CRAN`. For up-to-date installation instructions, please see our [Getting Started](https://plotly.com/r/getting-started/) documentation page. 

## What’s New in Plotly.R 4.9.2
Our changelog has lots of play-by-play, but here are the highlights:

### Powered by Plotly.js 1.52, perfect for Dash For R 0.3.1

This release of Plotly.R inherits all of the improvements to the underlying JavaScript library that powers it. The full [Plotly.js 1.52.x changelog](https://github.com/plotly/plotly.js/blob/master/CHANGELOG.md#1520----2020-01-08) contains more details about what changed under the hood. 

The version of Plotly.js that Plotly.R 4.9.2 is built on is the same one that’s bundled with the recently-released Dash For R 0.3.1, so we recommend that if you’re a Dash For R user you upgrade both Dash For R and Plotly.R to their latest versions to get the full benefit of all of these libraries working together.

#### Legend Titles

We’ve finally implemented a long-requested feature: [first-class legend titles](https://plotly.com/r/legend/#legend-title)! These are configurable under `layout.legend.title`, as one would expect.

This means that instead of seeing wide legend entries with e.g. `continent=Asia` and `continent=Europe` etc you will now see a cleaner, smaller and less repetitive legend with a title of continent and legend entries for `Asia` and `Europe`. Check out the image below to see how much nicer this makes everything look.


#### GeoJson Choropleth Maps and Mapping Improvements
https://plotly.com/r/mapbox-county-choropleth/#geojson-with-featureid

px.choropleth() and go.Choropleth now accept a geojson argument just like the new px.choropleth_mapbox() and go.Choroplethmapbox we introduced last summer. This means that you can now supply your own geometry information to non-tile-map choropleth maps 5, instead of relying on Plotly’s built-in country and state maps. Some other new mapping features include:

- A new `featureidkey` attribute  to let you use GeoJSON objects whose identifiers are in the properties object of a feature, rather than always and only using the `id` field. (This was added to the Mapbox choropleth as well.)

- New `fitbounds` attribute in `layout.geo` to make it easier to position these new choropleth maps.

- New `visible` attribute in `layout.geo` to make it easier to style these new choropleth maps.

- New `showlegend` attributes on go.Choropleth traces, which enable the use of discrete color on choropleth maps 1. This was added to the Mapbox choropleth  as well.

What does this all mean? It means you can now make any of these maps with a single chained Python statement!

#### New Treemap chart and sunburst charts API
https://plotly.com/r/sunburst-charts/
https://plotly.com/r/treemaps/
The px.sunburst() and px.treemap() functions in Plotly Express now support a new argument called path  which behaves a bit like dimensions in our other multi-dimensional data-exploration functions like px.parallel_coordinates(), px.parallel_categories() and px.scatter_matrix(). It’s an easier way to create sunbursts 1 and treemaps from “rectangular” data in data frames which have one column per level in a hierarchy. This makes sunbursts and treemaps much easier to use for exploring multi-dimensional datasets.


 A common scenario for which this API is a great fit is when you want to visualize a ratio across a hierarchy or a set of variables. For example, on a restaurant bill, the ratio between the tip and the total bill is the tip percentage: tip_pct = tip/total_bill. With the new API, we can easily (one function call!) visualize the built-in px.data.tips() dataset, scaling each sector by the total_bill and coloring each sector by the total_bill-weighted average of the tip_pct to highlight certain patterns:

#### Uniform Text & Text Orientation
By default, when displaying text with bar-like traces (bar, funnel and waterfall charts) or part-of-whole traces like pie and funnel-area charts as well as sunbursts and treemaps, Plotly.R will scale the text per bar or per sector so as to make each text label fit. This is helpful for seeing all text labels but can result in some odd or distracting variations in text sizes. With the new layout.uniformtext options, you can now force the text to be the same size across similar traces, so that all the bar labels or all the sunburst labels end up having the same font-size.



In terms of text orientation, by default Plotly.R will try various text orientations within a pie or sunburst sector to see how it can make the text biggest/most-legible. Again this can be distracting or unappealing in certain cases, so the new insidetextorientation attribute lets you specify whether you want your text to be always horizontal, radial or tangential.

Together these two attributes can be used to create very attractive, regular-looking bar, waterfall, funnel, pie, sunburst and treemap charts!


#### New Box Plot Options- need to write docs
There are many ways to calculate the quartiles of a dataset, and now you can choose among three different quartile-calculation algorithms 1 when using Plotly.R box plots! To quote our Figure Reference documentation for the new quartilemethod attribute on go.Box:

Sets the method used to compute the sample’s Q1 and Q3 quartiles. The “linear” method uses the 25th percentile for Q1 and 75th percentile for Q3 as computed using method #10 (listed on http://www.amstat.org/publications/jse/v14n3/langford.html). The “exclusive” method uses the median to divide the ordered dataset into two halves if the sample is odd, it does not include the median in either half - Q1 is then the median of the lower half and Q3 the median of the upper half. The “inclusive” method also uses the median to divide the ordered dataset into two halves but if the sample is odd, it includes the median in both halves - Q1 is then the median of the lower half and Q3 the median of the upper half.

Here is a visualization of the three methods on the same dataset of integers from 1 to 9:


In addition to these enhancements, it is now possible to explicitly specify all the parameters of a box plot, for when you want to do the quartile and other calculations externally to the visualization.

These were two sponsored features and we heartily thank our sponsors for supporting open-source software development and allowing us to make these features available to everyone else in the world for free :heart:. If your organization has a software budget, reach out to us to fund your favorite feature requests.

#### Image Traces

https://plotly.com/r/imshow/




### Get it now!

To sum up: Plotly.R is out and if you’re excited about any of the above features, head on over to our Getting Started documentation page for full installation instructions.


