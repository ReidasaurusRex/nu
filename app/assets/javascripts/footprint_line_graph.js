function ready() {
  drawFootprintsGraph();
}

$(document).ready(ready); 
$(document).on('page:load', ready); // turbolinks friendly

function drawFootprintsGraph() {
  if ($('#footprint-line-graph').length > 0) {
    var footprintsData = $('#footprint-line-graph').data('footprintsOverview');
    var convertedData = convertedDateData(footprintsData);
    new Highcharts.Chart({
      chart: {
        renderTo: 'footprint-line-graph',
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false, 
        type: 'line'}, 
      title: {
        text: 'Emissions Overview'
      }, 
      subtitle: {
        text: "Keep it up! er... down?"
      },
      xAxis: {
        type: "datetime",
        dateTimeLabelFormats: {
          month: '%b %e'
        }, 
        title: {
          text: 'Date'
        }
      },
      yAxis: {
        title: {
          text: "Emissions (lbs CO2e / month)"
        }
      },
      tooltip: {
        headerFormat: '<b>{series.name}</b><br>',
        pointFormat: '{point.x:%b %e}: {point.y}lbs CO2e'
      },
      legend: {
        enabled: false
      },
      colors: ['#B7DC78'],
      series: [{
        name: 'Emisions', 
        data: convertedData
      }]
    });
  }
}

function convertedDateData(data) {
  var convertedData = [];
  data.forEach(function(rubyDateArray) {    
    convertedData.push([new Date(rubyDateArray[0]).valueOf(), rubyDateArray[1]]);
  });
  return convertedData;
}
