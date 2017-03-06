window.addEventListener("load", function() {
  drawChart();
});

google.charts.load('current', {'packages':['line']});

// function getStressLevel() {
//   xhr = new XMLHttpRequest();
//   xhr.open('GET', '/stressLevel');
//   xhr.onload = function() {
//     var names = [];
//     var time = []
//     response = JSON.parse(xhr.responseText);
//     for (var x = 0; x < response.length; x++) {
//       if (names.indexOf(response[x][0]) === -1) {
//         names.push(response[x][0]);
//       }
//     }
//     for (var x = 0; x < response.length; x++) {
//       if (time.indexOf(response[x][1]) === -1) {
//         time.push(response[x][1]);
//       }
//     }
//     drawChart(response, names, time);
//   }
//   xhr.send();
// }

function drawChart() {
  var data = new google.visualization.DataTable();
  data.addColumn('timeofday', 'Hour');
  data.addColumn('number', 'Student #1');
  data.addColumn('number', 'Student #2');
  data.addColumn('number', 'Student #3');
  data.addColumn('number', 'Student #4');

  data.addRows([
    [[16], 1, 1, 2, 1],
    [[17], 2, 3, 2, 3],
    [[18], 2, 2, 3, 1],
    [[19], 3, 1, 2, 3],
    [[20], 2, 3, 3, 1],
    [[21], 1, 2, 2, 3],
    [[22], 3, 1, 3, 1],
    [[23], 3, 2, 2, 3]
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
  chart.draw(data, options);
}