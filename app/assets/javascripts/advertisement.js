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

$(function() {

  console.log("Hola");

  $('#advertisement-detail ul.badges li').tooltip({
    placement: "bottom",
    html: true,
    delay: 500,
    container: '#tooltip-container'
  });

});
