function ready() {
  drawFootprintPieGraphs();
}

$(document).ready(ready); 
$(document).on('page:load', ready); // turbolinks friendly

function drawFootprintPieGraphs() {
  if ($('.jsFootprintPieGraph').length > 0) {
    Array.prototype.slice.call($('.jsFootprintPieGraph')).forEach(drawPieGraph);
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
        style: {
          color: "#A6B1B0",
          textAlign: "left"
        },
        text: $(footprintDiv).data('creationDate')
      },
    colors: ['#B1D276', '#FFB907', '#8BD1CA', '#E64D7D', '#F1613A'],
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
          enabled: false
          // color: 'gray',
          // connectorColor: 'gray',
          // enabled: true,
          // format: '{point.name}<br>{point.y} lbs of CO2e',
          // softConnector: false
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