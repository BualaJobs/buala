buala.directive('modal', [function () {"use strict";

  return {
    restrict: 'E',
    replace: true,
    transclude: true,
    scope: {
      applying: '=',
      title: '@'
    },
    controller: ['$scope', function ($scope) {
      $scope.close = function () {
        $scope.opened = false;
      };
    }],
    link: function ($scope, $element) {
      $scope.$watch("applying", function () {
        if ($scope.applying) {
          $($element).modal('show');
        } else {
          $($element).modal('hide');
        }
      });
      $($element).on('hide.bs.modal', function () {
        $scope.$apply(function () {
          $scope.applying = false;
        });
      });
    },
    templateUrl: '/directives/modal'
  };

}]);