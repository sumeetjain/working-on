window.addEventListener("load", function() {
  getStressLevel();
});

google.charts.load('current', {'packages':['line']});

function getStressLevel() {
  xhr = new XMLHttpRequest();
  xhr.open('GET', '/stressLevel');
  xhr.onload = function() {
    var names = [];
    var time = []
    response = JSON.parse(xhr.responseText);
    for (var x = 0; x < response.length; x++) {
      if (names.indexOf(response[x][0]) === -1) {
        names.push(response[x][0]);
      }
    }
    for (var x = 0; x < response.length; x++) {
      if (time.indexOf(response[x][1]) === -1) {
        time.push(response[x][1]);
      }
    }
    drawChart(response, names, time);
  }
  xhr.send();
}

function drawChart(response, names, time) {
  var data = new google.visualization.DataTable();
  data.addColumn('timeofday', 'Hour');
  for (var x = 0; x < names.length; x++) {
    data.addColumn('number', names[x]);
  }

  // var addArray = [];
  // for (var x = 0; x < time.length; x++) {
  //   var new_time = parseInt(time[x]);
  //   var formatted_time = [new_time + 6, 00, 0]
  //   if (addArray.indexOf(formatted_time) === -1) {
  //     addArray.push(formatted_time);
  //   }
  // }

  // var dataArray = [];
  // for (var x = 0, x < response.length; x++) {
  //   var name = response[x][0]
  //   var time = [response[x][2] + 6, 00, 0];
  //   for (var i = 0; i < addArray.length; i++) {
  //     for (var j = 0; j < names.length; j++) {
  //       if (name === names[j]) {

  //       }
  //     }
  //   }
  // }

  data.addRows([
    [[16, 00, 0], 1, 1, 2, 1],
    [[17, 00, 0], 2, 3, 2, 3],
    [[18, 00, 0], 2, 2, 3, 1],
    [[19, 00, 0], 3, 1, 2, 3],
    [[20, 00, 0], 2, 3, 3, 1],
    [[21, 00, 0], 1, 2, 2, 3],
    [[22, 00, 0], 3, 1, 3, 1],
    [[23, 00, 0], 3, 2, 2, 3]
  ]);

  var options = {
  chart: {
    title: 'Student Stress Level Throughout Day',
    subtitle: 'from 1-3 (1 being the least stressed)'
  },
  width: 700,
  height: 300
  };

  var chart = new google.charts.Line(document.getElementById('chart'));
  var test = data.toJSON();
  debugger;

  chart.draw(data, options);
}