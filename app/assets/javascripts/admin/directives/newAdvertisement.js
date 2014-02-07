BualaAdmin.directive('newAdvertisement', function () {
  "use strict";

  return {
    restrict: 'E',
    replace: true,
    scope: {
    },
    controller: ['$scope', function ($scope) {

      $scope.limits = {
        firstStep: 1,
        lastStep: 4
      };

      $scope.newAdvertisement = function () {
        $scope.advertisement = {};
        $scope.step = $scope.limits.firstStep;
      };

      $scope.nextStep = function () {
        if ($scope.step < $scope.limits.lastStep) {
          $scope.step++;
        }
      }

      $scope.previousStep = function () {
        if ($scope.step > $scope.limits.firstStep) {
          $scope.step--;
        }
      }

      //For development!!
      $scope.newAdvertisement();

    }],
    link: function ($scope, $element) {
      var modalElement = $($element).children(".modal");
      $scope.$watch("advertisement", function () {
        if(_.isObject($scope.advertisement)) {
          modalElement.modal("show");
        } else {
          modalElement.modal("hide");
        }
      });

      modalElement.on("hide.bs.modal", function () {
        $scope.advertisement = null;
      });
    },
    templateUrl: '/directives/newAdvertisement'
  };

});
