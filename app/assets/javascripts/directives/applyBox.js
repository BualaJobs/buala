buala.directive('applyBox', ['UserService', function (UserService) {
  "use strict";

  return {
    restrict: 'E',
    replace: true,
    scope: {
      user: '=',
      advertisement: '='
    },
    controller: ['$scope', function ($scope) {

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
