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
<script src="https://www.amcharts.com/lib/4/themes/kelly.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_kelly);
am4core.useTheme(am4themes_animated);
// Themes end

/**
 * Chart design taken from Samsung health app
 */

 var chart = am4core.create("chartdiv", am4charts.XYChart);
 chart.hiddenState.properties.opacity = 0; // this creates initial fade-in
 chart.data = [{
     "date": "2018-01-01",
     "steps": 9500
 }, {
     "date": "2018-01-02",
     "steps": 8000
 }, {
     "date": "2018-01-03",
     "steps": 10000
 }, {
     "date": "2018-01-04",
     "steps": 12000
 }, {
     "date": "2018-01-05",
     "steps": 12000
 }, {
     "date": "2018-01-06",
     "steps": 16000
 }, {
     "date": "2018-01-07",
     "steps": 10000
 }, {
     "date": "2018-01-08",
     "steps": 10000
 }, {
     "date": "2018-01-09",
     "steps": 9000
 }, {
     "date": "2018-01-10",
     "steps": 10000
 }, {
     "date": "2018-01-11",
     "steps": 5000
 }, {
     "date": "2018-01-12",
     "steps": 11000
 }, {
     "date": "2018-01-13",
     "steps": 6000
 }, {
     "date": "2018-01-14",
     "steps": 9000
 }, {
     "date": "2018-01-15",
     "steps": 8000
 }, {
     "date": "2018-01-16",
     "steps": 17000
 }, {
     "date": "2018-01-17",
     "steps": 44000
 }, {
     "date": "2018-01-18",
     "steps": 27000
 }, {
     "date": "2018-01-19",
     "steps": 0
 }, {
     "date": "2018-01-20",
     "steps":  0
 }, {
     "date": "2018-01-21",
     "steps": 0
 }, {
     "date": "2018-01-22",
     "steps": 0
 }, {
     "date": "2018-01-23",
     "steps": 0
 }, {
     "date": "2018-01-24",
     "steps": 0
 }, {
     "date": "2018-01-25",
     "steps": 0
 }, {
     "date": "2018-01-26",
     "steps": 0
 }, {
     "date": "2018-01-27",
     "steps": 0
 }, {
     "date": "2018-01-28",
     "steps": 0
 }, {
     "date": "2018-01-29",
     "steps": 0
 }, {
     "date": "2018-01-30",
     "steps": 0
 }];

chart.dateFormatter.inputDateFormat = "YYYY-MM-dd";
chart.zoomOutButton.disabled = true;

var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.grid.template.strokeOpacity = 0;
dateAxis.renderer.minGridDistance = 10;
dateAxis.dateFormats.setKey("day", "d");
dateAxis.tooltip.hiddenState.properties.opacity = 1;
dateAxis.tooltip.hiddenState.properties.visible = true;


dateAxis.tooltip.adapter.add("x", function (x, target) {
    return am4core.utils.spritePointToSvg({ x: chart.plotContainer.pixelX, y: 0 }, chart.plotContainer).x + chart.plotContainer.pixelWidth / 2;
})

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.renderer.inside = true;
valueAxis.renderer.labels.template.fillOpacity = 0.3;
valueAxis.renderer.grid.template.strokeOpacity = 0;
valueAxis.min = 0;
valueAxis.cursorTooltipEnabled = false;

// goal guides
var axisRange = valueAxis.axisRanges.create();
axisRange.value = 6000;
axisRange.grid.strokeOpacity = 0.1;
axisRange.label.text = "Goal";
axisRange.label.align = "right";
axisRange.label.verticalCenter = "bottom";
axisRange.label.fillOpacity = 0.8;

valueAxis.renderer.gridContainer.zIndex = 1;

var axisRange2 = valueAxis.axisRanges.create();
axisRange2.value = 12000;
axisRange2.grid.strokeOpacity = 0.1;
axisRange2.label.text = "2x goal";
axisRange2.label.align = "right";
axisRange2.label.verticalCenter = "bottom";
axisRange2.label.fillOpacity = 0.8;

var series = chart.series.push(new am4charts.ColumnSeries);
series.dataFields.valueY = "steps";
series.dataFields.dateX = "date";
series.tooltipText = "{valueY.value}";
series.tooltip.pointerOrientation = "vertical";
series.tooltip.hiddenState.properties.opacity = 1;
series.tooltip.hiddenState.properties.visible = true;
series.tooltip.adapter.add("x", function (x, target) {
    return am4core.utils.spritePointToSvg({ x: chart.plotContainer.pixelX, y: 0 }, chart.plotContainer).x + chart.plotContainer.pixelWidth / 2;
})

var columnTemplate = series.columns.template;
columnTemplate.width = 30;
columnTemplate.column.cornerRadiusTopLeft = 20;
columnTemplate.column.cornerRadiusTopRight = 20;
columnTemplate.strokeOpacity = 0;

columnTemplate.adapter.add("fill", function (fill, target) {
    var dataItem = target.dataItem;
    if (dataItem.valueY > 6000) {
        return chart.colors.getIndex(0);
    }
    else {
        return am4core.color("#a8b3b7");
    }
})

var cursor = new am4charts.XYCursor();
cursor.behavior = "panX";
chart.cursor = cursor;
cursor.lineX.disabled = true;

chart.events.on("datavalidated", function () {
    dateAxis.zoomToDates(new Date(2018, 0, 21), new Date(2018, 1, 1), false, true);
});

var middleLine = chart.plotContainer.createChild(am4core.Line);
middleLine.strokeOpacity = 1;
middleLine.stroke = am4core.color("#000000");
middleLine.strokeDasharray = "2,2";
middleLine.align = "center";
middleLine.zIndex = 1;
middleLine.adapter.add("y2", function (y2, target) {
    return target.parent.pixelHeight;
})

cursor.events.on("cursorpositionchanged", updateTooltip);
dateAxis.events.on("datarangechanged", updateTooltip);

function updateTooltip() {
    dateAxis.showTooltipAtPosition(0.5);
    series.showTooltipAtPosition(0.5, 0);
    series.tooltip.validate(); // otherwise will show other columns values for a second
}


var label = chart.plotContainer.createChild(am4core.Label);
label.text = "";
label.x = 90;
label.y = 50;

}); // end am4core.ready()
</script>
<style>
#chartdiv{
	width: 109%;
}
</style>
<!-- HTML -->
<div id="chartdiv"></div>