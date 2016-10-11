function ready() {
  var pointData = $('#jsPointOverviewGraph').data('pointOverview');
  drawPointGraph(pointData);
}

$(document).ready(ready); 
$(document).on('page:load', ready); // turbolinks friendly



function drawPointGraph(data) {
  var chartColors = ['#B1D276', '#FFB907', '#8BD1CA', '#E64D7D', '#F1613A', '#B17FCE'];
  // [Travel green, energy yellow, water blue, waste pink, food orange, social purple]
  var radianVals = dataArrayFromObj(data).map(function(el, ind, ary) {
    return  radiansFromEl(ary, ind);
  });
  window.radianVals = radianVals;
  var linearGradientColors = radianVals.map(function(el, index) {
    var color = chartColors[index];
    return {
      linearGradient: linearGradientsFromRadian(el),
      stops: [
        [0, color],
        [1, Highcharts.Color(color).brighten(0.25).get('rgb')]
      ]
    };
  }); 
  if ($('#jsPointOverviewGraph').length > 0) {
    new Highcharts.Chart({
      chart: {
        margin: [0, 0, 0, 0],
        spacing: [0, 0, 0, 0],
        renderTo: 'jsPointOverviewGraph',
        type: 'pie'
      }, 
      colors: linearGradientColors,
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
      }, 
      tooltip: {
        enabled: false
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

function dataArrayFromObj(dataObj) {
  result = [];
  for (var key in dataObj) {
    result.push(dataObj[key]);
  }
  return result;
}

function arraySum(array) {
  return array.reduce(function(prev, cur) {return prev + cur;});
}

function partialArrayTotal(array, index) {
  if (index !== 0) {
    return arraySum(array.slice(0, index));
  } else {
    return 0;
  }

}

function radiansFromEl(array, index) {
  return Math.round((partialArrayTotal(array, index) / arraySum(array)) * (2 * Math.PI) * 100) / 100;
}

function linearGradientsFromRadian(radian) {
  if (radian < (Math.PI / 2)) {
    return {x1: 1, y1: 0, x2: 0, y2: 1};
  } else if (radian >= Math.PI / 2 && radian < Math.PI) {
    return {x1: 1, y1: 1, x2: 0, y2: 0};
  } else if (radian >= Math.PI && (3 * radian) < Math.PI / 2) {
    return {x1: 0, y1: 1, x2: 1, y2: 0};
  } else {
    return {x1: 0, y1: 0, x2: 1, y2: 1};
  }
}