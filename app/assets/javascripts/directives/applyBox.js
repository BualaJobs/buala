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

      $scope.apply = function () {
        UserService.apply($scope.advertisement)
        .then(function () {
          $scope.advertisement.has_applied = true;
        })
      };

    }],
    templateUrl: '/directives/applyBox'
  }

}]);
