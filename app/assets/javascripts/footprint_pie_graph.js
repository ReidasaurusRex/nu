function ready() {
  drawFootprintPieGraphs();
}

$(document).ready(ready); 
$(document).on('page:load', ready); // turbolinks friendly

function drawFootprintPieGraphs() {
  if ($('.footprint-pie-graph').length > 0) {
    Array.prototype.slice.call($('.footprint-pie-graph')).forEach(drawPieGraph);
  }
}

function drawPieGraph(footprintDiv) {
  console.log(footprintDiv);
  var footprintData = footprintDiv.dataset.footprintOverview;
  console.log(footprintData);
  console.log(extractDataPoints(footprintData));
  new Highcharts.Chart({
    chart: {
      renderTo: footprintDiv,
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false, 
      type: 'pie'}, 
    colors: ['#B7DC78', '#65CBC9', '#FF8D6A', '#F2D383'],
    series: [{
      name: 'Emissions', 
      data: extractDataPoints(footprintData)
    }]
  });
}

function extractDataPoints(data) {
  var dataPoints = [];
  for (var key in data) {
    dataPoints.push({name: key, y: data[key]});
  }
  return dataPoints;
}