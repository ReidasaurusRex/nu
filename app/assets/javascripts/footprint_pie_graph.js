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
    colors: ['#F99B6D', '#BFEAE7', '#F484B4', '#C9E38A', '#FFDD10'],
    credits: {
      enabled: false
    },
    plotOptions: {
      series: {
        animation: false
      },
      pie: {
        borderWidth: 9,
        dataLabels: {
          color: 'gray',
          connectorColor: 'gray',
          enabled: true,
          format: '{point.name}<br>{point.y} lbs of CO2e',
          softConnector: false
        },
        states: {
          hover: {
            enabled: false
          }
        }
      },
    },
    series: [{
      name: 'Emissions', 
      data: extractDataPoints(footprintData),
    }],
    tooltip: {
      enabled: false
    }
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