<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<!-- Styles -->
<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}

</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect

chart.data = [{
  "country": "1월",
  "value": 20000
}, {
  "country": "2월",
  "value": 19000
}, {
  "country": "3월",
  "value": 30000
}, {
  "country": "4월",
  "value": 15000
}, {
  "country": "5월",
  "value": 12000
}, {
  "country": "6월",
  "value": 90000
}, {
  "country": "7월",
  "value": 45000
}, {
  "country": "8월",
  "value": 14000
}, {
  "country": "9월",
  "value": 58000
}, {
  "country": "10월",
  "value": 165000
}, {
  "country": "11월",
  "value": 252000
}, {
  "country": "12월",
  "value": 0
}];


var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.minGridDistance = 40;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

var series = chart.series.push(new am4charts.CurvedColumnSeries());
series.dataFields.categoryX = "country";
series.dataFields.valueY = "value";
series.tooltipText = "{valueY.value}"
series.columns.template.strokeOpacity = 0;

series.columns.template.fillOpacity = 0.75;

var hoverState = series.columns.template.states.create("hover");
hoverState.properties.fillOpacity = 1;
hoverState.properties.tension = 0.4;

chart.cursor = new am4charts.XYCursor();

// Add distinctive colors for each column using adapter
series.columns.template.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
});

chart.scrollbarX = new am4core.Scrollbar();

}); // end am4core.ready()
</script>

<!-- HTML -->
<div id="chartdiv"></div>
amCharts
</body>
</html>