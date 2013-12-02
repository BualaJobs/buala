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

      $scope.safeApply = function(fn) {
        var phase = this.$root.$$phase;
        if(phase == '$apply' || phase == '$digest') {
          if(fn && (typeof(fn) === 'function')) {
            fn();
          }
        } else {
          this.$apply(fn);
        }
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
        $scope.safeApply(function () {
          $scope.applying = false;
        });
      });
    },
    templateUrl: '/directives/modal'
  };

}]);