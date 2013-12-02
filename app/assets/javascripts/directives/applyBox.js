buala.directive('applyBox', [function () {"use strict";

  return {
    restrict: 'E',
    replace: true,
    scope: {
      user: '='
    },
    controller: ['$scope', function ($scope) {

      $scope.edit = function () {
        $scope.editing = true;
      }

      $scope.cancelEdition = function () {
        $scope.editing = false;
      };

    }],
    templateUrl: '/directives/applyBox'
  }

}]);
