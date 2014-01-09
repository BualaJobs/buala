BualaAdmin.directive('applicantsPerDayLineChart', function () {
  "use strict";

  return {
    restrict: 'E',
    replace: true,
    scope: {
      advertisement: "="
    },
    controller: ['$scope', function ($scope) {
      
    }],
    link: function ($scope, $element) {

      var today = moment();
      var startDate = moment($scope.advertisement.created_at);

      var totalDays = today.diff(startDate, "days");

      var labels = [];
      var data = [];

      var dayAmount;
      for (var i = 0; i < totalDays; i++) {
        dayAmount = $scope.advertisement.applications_data[startDate.add("days", 1).format("YYYY-MM-DD")];
        data[i] = (typeof dayAmount === "undefined") ? 0 : dayAmount;
        labels[i] = "";
      }

      var el = $($element.get(0));
      el.attr("width", el.outerWidth()).attr("height", el.outerHeight());

      var cdata = {
        labels : labels,
        datasets : [
          {
            fillColor: "rgba(224, 255, 235, 0.5)",
            strokeColor: "#00F054",
            pointColor: "#00F054",
            pointStrokeColor: "#2CC562",
            data: data
          }
        ]
      };

      var ctx = $element.get(0).getContext("2d");

      var maxValue = _.max(data);
      var scaleSteps = maxValue > 0 ? maxValue : 1;


      new Chart(ctx).Line(cdata, {
        scaleShowLabels: true,
        bezierCurve: false,
        scaleShowGridLines: true,
        scaleFontSize:8,
        scaleOverride: true,
        scaleSteps: scaleSteps,
        scaleStepWidth: 1
      });
    },
    template: '<canvas class="chart"></canvas>'
  };

});