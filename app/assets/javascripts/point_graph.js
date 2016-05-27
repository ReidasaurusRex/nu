function ready() {
  var data = $('#point-overview-graph').data('pointOverview');
  console.log(data);
  drawPointGraph(data);
}

$(document).ready(ready); 
$(document).on('page:load', ready); // turbolinks friendly

function drawPointGraph(data) {
  new Highcharts.Chart({
    chart: {
      renderTo: 'point-overview-graph',
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false, 
      type: 'pie'}, 
    title: {
      text: 'Point Overview'
    }, 
    colors: ['#B7DC78', '#65CBC9', '#FF8D6A', '#F2D383'],
    series: [{
      name: 'Points', 
      data:
        extractDataPoints(data)
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