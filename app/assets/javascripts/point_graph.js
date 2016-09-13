function ready() {
  var pointData = $('#jsPointOverviewGraph').data('pointOverview');
  drawPointGraph(pointData);
}

$(document).ready(ready); 
$(document).on('page:load', ready); // turbolinks friendly

function drawPointGraph(data) {
  if ($('#jsPointOverviewGraph').length > 0) {
    new Highcharts.Chart({
      chart: {
        margin: [-50, 0, 0, 0],
        spacing: [0, 0, 0, 0],
        renderTo: 'jsPointOverviewGraph',
        type: 'pie'
      }, 
      colors: ['#B7DC78', '#65CBC9', '#FF8D6A', '#F2D383'],
      credits: {
        enabled: false
      },
      plotOptions: {
        pie: {
          size: '100%'
        },
        series: {
          animation: false,
          states: {
            hover: {
              enabled: false
            }
          }
        }
      },
      series: [{
        name: 'Points', 
        data: extractDataPoints(data),
        dataLabels: {
          enabled: false
        },
        size: '100%',
        type: 'pie',
        innerSize: '80%'
      }],
      title: {
        text: null
      }
    });
  }
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