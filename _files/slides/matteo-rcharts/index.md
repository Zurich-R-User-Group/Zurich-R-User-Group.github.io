---
title       : "Interactive Javascript in R with rCharts"
subtitle    : "Zurich R User Meetup"
author      : "Matteo Casserini"
job         : "3 August 2016"
logo        : rCharts.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
ext_widgets : {rCharts: [libraries\\nvd3, libraries\\highcharts]}
--- .segue .dark .nobackground



## The rCharts package

--- .quote .nobackground

## ![img](assets/img/rCharts.png) From the package's website

<q>rCharts is an R package to create, customize and share interactive visualizations, using a lattice-like formula interface.</q>

--- .nobackground

## In a nutshell

Essentially, `rCharts` allows to integrate *multiple* Javascript libraries into a *single* package with a common interface 
$\Rightarrow$ pluggable in Shiny or HTML5 presentations

Some of the libraries implemented so far:
* Morris.JS
* Highcharts
* NVD3
* Vega
* xCharts
* $\cdots$

--- .nobackground

## Installation


```r
require(devtools)
install_github('ramnathv/rCharts')
```

<br>

## Loading package

```r
require(rCharts)
```

--- .nobackground

## Use

`rCharts` essentially introduces two classes of functions:
* Plotting functions for specifying plots via a formula interface (like the `lattice` package)
  * `hPlot` (Highcharts)
  * `nPlot` (NVD3)
  * `mPlot` (Morris.JS)
  * $\cdots$
* Utility functions for embedding the plots in a Shiny application
  * `renderChart` (in `server.R`)
  * `showOutput` (in `ui.R`)

--- .segue .dark .nobackground

## Some examples

--- .nobackground

## Highcharts


```r
require(rCharts)
dataset <- na.omit(MASS::survey)
h <- hPlot(Pulse ~ Height,
           data = dataset,
           type = "scatter",
           group = "Exer")
```

--- .nobackground

## Highcharts

<script type='text/javascript' src=//code.jquery.com/jquery-1.9.1.min.js></script>
<script type='text/javascript' src=//code.highcharts.com/highcharts.js></script>
<script type='text/javascript' src=//code.highcharts.com/highcharts-more.js></script>
<script type='text/javascript' src=//code.highcharts.com/modules/exporting.js></script> 
 <style>
  .rChart {
    display: block;
    margin-left: auto; 
    margin-right: auto;
    width: 800px;
    height: 400px;
  }  
  </style>
<div id = 'chart16ec1e132895' class = 'rChart highcharts'></div>
<script type='text/javascript'>
    (function($){
        $(function () {
            var chart = new Highcharts.Chart({
 "dom": "chart16ec1e132895",
"width":            800,
"height":            400,
"credits": {
 "href": null,
"text": null 
},
"exporting": {
 "enabled": false 
},
"title": {
 "text": null 
},
"yAxis": [
 {
 "title": {
 "text": "Pulse" 
} 
} 
],
"series": [
 {
 "data": [
 [
         154.94,
71 
],
[
          156.2,
80 
],
[
            157,
74 
],
[
            157,
74 
],
[
            157,
89 
],
[
         157.48,
68 
],
[
         160.02,
80 
],
[
         162.56,
60 
],
[
            164,
64 
],
[
            164,
64 
],
[
            164,
84 
],
[
            165,
48 
],
[
            165,
80 
],
[
            165,
92 
],
[
          165.1,
87 
],
[
          166.4,
72 
],
[
          166.5,
60 
],
[
            167,
70 
],
[
         167.64,
40 
],
[
         167.64,
70 
],
[
         167.64,
72 
],
[
         167.64,
90 
],
[
            168,
83 
],
[
          168.5,
85 
],
[
          169.2,
60 
],
[
            170,
64 
],
[
            170,
68 
],
[
            170,
70 
],
[
            170,
75 
],
[
            170,
104 
],
[
         170.18,
75 
],
[
         170.18,
80 
],
[
            172,
68 
],
[
            172,
68 
],
[
            172,
92 
],
[
         172.72,
65 
],
[
         172.72,
68 
],
[
         172.72,
69 
],
[
         172.72,
76 
],
[
            173,
62 
],
[
            173,
76 
],
[
            174,
48 
],
[
            175,
72 
],
[
            175,
76 
],
[
         175.26,
62 
],
[
         175.26,
66 
],
[
         175.26,
68 
],
[
          176.5,
76 
],
[
            177,
76 
],
[
            177,
78 
],
[
          177.8,
62 
],
[
            178,
70 
],
[
          178.5,
66 
],
[
            179,
56 
],
[
            179,
60 
],
[
            179,
65 
],
[
            180,
59 
],
[
            180,
64 
],
[
            180,
78 
],
[
            180,
84 
],
[
         180.34,
64 
],
[
         180.34,
72 
],
[
         180.34,
72 
],
[
            182,
65 
],
[
          182.5,
72 
],
[
         182.88,
72 
],
[
         182.88,
83 
],
[
            184,
100 
],
[
            185,
60 
],
[
            185,
68 
],
[
            185,
71 
],
[
            185,
88 
],
[
         185.42,
60 
],
[
            187,
66 
],
[
            187,
84 
],
[
         187.96,
64 
],
[
         187.96,
86 
],
[
            188,
75 
],
[
            190,
66 
],
[
            190,
68 
],
[
            190,
68 
],
[
          190.5,
72 
],
[
            195,
76 
],
[
            196,
63 
],
[
            200,
55 
] 
],
"name": "Freq",
"type": "scatter",
"marker": {
 "radius":              3 
} 
},
{
 "data": [
 [
         157.48,
70 
],
[
            158,
70 
],
[
            160,
86 
],
[
            165,
50 
],
[
            165,
65 
],
[
            165,
97 
],
[
            167,
68 
],
[
            167,
80 
],
[
            170,
60 
],
[
            170,
96 
],
[
            176,
68 
],
[
          177.8,
104 
],
[
         180.34,
68 
],
[
          190.5,
80 
] 
],
"name": "None",
"type": "scatter",
"marker": {
 "radius":              3 
} 
},
{
 "data": [
 [
            152,
90 
],
[
          152.4,
92 
],
[
          153.5,
76 
],
[
         154.94,
72 
],
[
            155,
66 
],
[
            159,
70 
],
[
            160,
74 
],
[
            160,
84 
],
[
            160,
88 
],
[
         160.02,
65 
],
[
         160.02,
72 
],
[
          162.5,
79 
],
[
         162.56,
70 
],
[
         162.56,
70 
],
[
         162.56,
88 
],
[
            163,
79 
],
[
            163,
80 
],
[
            163,
83 
],
[
            164,
80 
],
[
            165,
35 
],
[
            165,
65 
],
[
            165,
70 
],
[
            165,
76 
],
[
            165,
76 
],
[
            165,
88 
],
[
          165.1,
68 
],
[
          165.1,
85 
],
[
            167,
61 
],
[
            167,
76 
],
[
            167,
79 
],
[
            167,
90 
],
[
         167.64,
74 
],
[
            168,
60 
],
[
            168,
72 
],
[
            168,
81 
],
[
          168.9,
68 
],
[
            169,
80 
],
[
            170,
70 
],
[
            170,
80 
],
[
            170,
80 
],
[
         170.18,
78 
],
[
         170.18,
80 
],
[
            171,
68 
],
[
            171,
100 
],
[
         172.72,
64 
],
[
         172.72,
90 
],
[
            173,
92 
],
[
            175,
72 
],
[
            175,
84 
],
[
            175,
90 
],
[
         175.26,
85 
],
[
          176.5,
80 
],
[
            178,
60 
],
[
          179.1,
80 
],
[
          179.1,
92 
],
[
            180,
60 
],
[
            180,
70 
],
[
            180,
96 
],
[
         180.34,
67 
],
[
         182.88,
74 
],
[
         182.88,
80 
],
[
            183,
75 
],
[
            183,
90 
],
[
            184,
62 
],
[
            185,
75 
],
[
            185,
80 
],
[
            189,
90 
],
[
          191.8,
72 
],
[
         193.04,
83 
] 
],
"name": "Some",
"type": "scatter",
"marker": {
 "radius":              3 
} 
} 
],
"xAxis": [
 {
 "title": {
 "text": "Height" 
} 
} 
],
"subtitle": {
 "text": null 
},
"id": "chart16ec1e132895",
"chart": {
 "renderTo": "chart16ec1e132895" 
} 
});
        });
    })(jQuery);
</script>

--- .nobackground

## NVD3


```r
require(rCharts)
dataset <- subset(as.data.frame(HairEyeColor), Sex == 'Male')
n <- nPlot(Freq ~ Hair, 
           group = 'Eye',
           data = dataset,
           type = 'multiBarChart'
)
```

--- .nobackground

## NVD3

<link rel='stylesheet' href=//cdnjs.cloudflare.com/ajax/libs/nvd3/1.1.15-beta/nv.d3.min.css>
<script type='text/javascript' src=//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js></script>
<script type='text/javascript' src=//d3js.org/d3.v3.min.js></script>
<script type='text/javascript' src=//cdnjs.cloudflare.com/ajax/libs/nvd3/1.1.15-beta/nv.d3.min.js></script>
<script type='text/javascript' src=//nvd3.org/assets/lib/fisheye.js></script> 
 <style>
  .rChart {
    display: block;
    margin-left: auto; 
    margin-right: auto;
    width: 800px;
    height: 400px;
  }  
  </style>
<div id = 'chart16ec26c13177' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart16ec26c13177()
    });
    function drawchart16ec26c13177(){  
      var opts = {
 "dom": "chart16ec26c13177",
"width":    800,
"height":    400,
"x": "Hair",
"y": "Freq",
"group": "Eye",
"type": "multiBarChart",
"id": "chart16ec26c13177" 
},
        data = [
 {
 "Hair": "Black",
"Eye": "Brown",
"Sex": "Male",
"Freq":             32 
},
{
 "Hair": "Brown",
"Eye": "Brown",
"Sex": "Male",
"Freq":             53 
},
{
 "Hair": "Red",
"Eye": "Brown",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Brown",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Black",
"Eye": "Blue",
"Sex": "Male",
"Freq":             11 
},
{
 "Hair": "Brown",
"Eye": "Blue",
"Sex": "Male",
"Freq":             50 
},
{
 "Hair": "Red",
"Eye": "Blue",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Blue",
"Sex": "Male",
"Freq":             30 
},
{
 "Hair": "Black",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Brown",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             25 
},
{
 "Hair": "Red",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              5 
},
{
 "Hair": "Black",
"Eye": "Green",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Brown",
"Eye": "Green",
"Sex": "Male",
"Freq":             15 
},
{
 "Hair": "Red",
"Eye": "Green",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Green",
"Sex": "Male",
"Freq":              8 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>

--- .segue .dark .nobackground

## Pros and Cons

--- .nobackground

## Pros and Cons

Pros
* Highly flexible
* Large number of libraries supported
* Nice JS-based visualisations and animations

Cons
* Package not actively maintained
* Documentation partially missing/outdated
* Defining custom JS layout might be needed for tweaking output

--- .segue .dark .nobackground

## Thank you!
