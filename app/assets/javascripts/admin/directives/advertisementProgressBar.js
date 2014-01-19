BualaAdmin.directive('advertisementProgressBar', function () {
  "use strict";

  return {
    restrict: 'E',
    replace: true,
    scope: {
      advertisement: "="
    },
    link: function ($scope, $element) {
      var startDate = moment($scope.advertisement.created_at);
      var expirationDate = moment($scope.advertisement.expiration_date);

      var today = moment();

      var total = expirationDate.diff(startDate, "days");
      var value = today.diff(startDate, "days");

      var el = $($element.get(0));

      var progress = (value * 100) / total;

      var progressBar = el.children(".progress-bar");
      progressBar.attr("aria-valuenow", progress);
      progressBar.css("width", progress + "%");
      
      var remainingDays = total - value;

      if (remainingDays < 3) {
        progressBar.addClass("progress-bar-danger");
      } else if (remainingDays < 6) {
        progressBar.addClass("progress-bar-warning");
      } else {
        progressBar.addClass("progress-bar-info");
      }

    },
    template: '<div class="progress progress-striped"><div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div></div>'
  };

});
