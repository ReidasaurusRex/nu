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
        renderTo: 'jsPointOverviewGraph',
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false, 
        type: 'pie'}, 
      
      colors: ['#B7DC78', '#65CBC9', '#FF8D6A', '#F2D383'],
      plotOptions: {
        series: {
          animation: false
        }
      },
      series: [{
        name: 'Points', 
        data: extractDataPoints(data),
        size: '100%',
        innerSize: '80%'
      }],
      title: {
        text: 'Point Overview'
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