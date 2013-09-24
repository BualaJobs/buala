buala.controller('AdvertisementController', ['$scope', '$resource', function($scope, $resource) {

  $scope.openApplicationModal = function() {
    $scope.apply = {};
  };

  $scope.closeApplicationModal = function() {
    $scope.apply = null;
  }

  $scope.$watch('apply', function() {
    if($scope.apply) {
      $('#applicationModal').modal();
    }
  });

}]);
