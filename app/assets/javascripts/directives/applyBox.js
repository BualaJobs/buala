buala.directive('applyBox', ['UserService', '$window', function (UserService, $window) {
  "use strict";

  return {
    restrict: 'E',
    replace: true,
    scope: {
      user: '=',
      advertisement: '='
    },
    controller: ['$scope', function ($scope) {

      $scope.currentLocation = $window.location.href;

      $scope.applying = false;

      $scope.apply = function () {
        $scope.applying = true;
        $scope.applyError = false;
        UserService.apply($scope.advertisement)
        .then(
          function () {
            $scope.applying = false;
            $scope.advertisement.has_applied = true;
          },
          function () {
            $scope.applying = false;
            $scope.applyError = true;
          }
        );
      };

    }],
    templateUrl: '/directives/applyBox'
  }

}]);
