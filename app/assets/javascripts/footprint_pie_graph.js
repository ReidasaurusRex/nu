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
  var footprintData = $(footprintDiv).data('footprintOverview');
  new Highcharts.Chart({
    chart: {
      animation: false,
      renderTo: footprintDiv,
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false, 
      type: 'pie'}, 
      title: {
        text: $(footprintDiv).data('creationDate')
      },
    colors: ['#B7DC78', '#65CBC9', '#FF8D6A', '#F2D383'],
    plotOptions: {
      series: {
        animation: false
      }
    },
    series: [{
      name: 'Emissions', 
      data: extractDataPoints(footprintData)
    }]
  });
}

function extractDataPoints(data) {
  var dataPoints = [];
  for (var key in data) {
    dataPoints.push({name: capitalize(key), y: data[key]});
  }
  return dataPoints;
}

function capitalize(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}