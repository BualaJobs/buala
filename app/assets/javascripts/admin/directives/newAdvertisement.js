BualaAdmin.directive('newAdvertisement', function () {
  "use strict";

  return {
    restrict: 'E',
    replace: true,
    scope: {
    },
    controller: ['$scope', function ($scope) {

      $scope.newAdvertisement = function () {
        $scope.advertisement = {};
      };

      //Development:
      $scope.advertisement = {};

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
