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

    }],
    templateUrl: '/directives/applyBox'
  }

}]);
