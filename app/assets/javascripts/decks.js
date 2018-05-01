$(document).on('turbolinks:load', function() {
  drawTypesChart()
  drawManaCurveChart()
})

var drawTypesChart = function() {
  var context = $('#card-types-chart')
  var chartLabels, chartValues
  $.ajax({
    url: '1/card_types',
    contentType: 'application/javascript',
    dataType: 'json',
  }
  ).done(function(data){
    chartLabels = Object.keys(data)
    chartValues = Object.values(data)
    var colorPalette = []
    palette("tol-dv", chartLabels.length).map(function(color) {
      colorPalette.push("#" + color)
    })

    chartData = {
      labels: chartLabels,
      datasets: [{
        label: 'Types composition',
        data: chartValues,
        backgroundColor: colorPalette
      }]
    }

    var chart = new Chart(context, {
      type: 'doughnut',
      data: chartData
    })
  })
}

var drawManaCurveChart = function() {
  var context = $('#mana-costs-chart')
  var chartLabels, chartValues
  $.ajax({
    url: '1/mana_curve',
    contentType: 'application/javascript',
    dataType: 'json',
  }
  ).done(function(data){
    chartLabels = Object.keys(data)
    chartValues = Object.values(data)
    var colorPalette = []
    palette("tol-dv", chartLabels.length).map(function(color) {
      colorPalette.push("#" + color)
    })

    chartData = {
      labels: chartLabels,
      datasets: [{
        data: chartValues,
        backgroundColor: colorPalette
      }]
    }

    options = {
      legend: {
        display: false
      },
      tooltips: {
        callbacks: {
          title: function() {}
        }
      },
      scales: {
        yAxes: [{
          ticks: {
            min: 0
          }
        }]
      }
    }

    var chart = new Chart(context, {
      type: 'bar',
      data: chartData,
      options: options
    })
  })
}
