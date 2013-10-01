buala.controller('AdvertisementController', ['$scope', '$resource', function($scope, $resource) {

  $scope.openApplicationModal = function() {
    $scope.currentApplication = {};
  };

  $scope.$watch('currentApplication', function() {
    var applicationModal = $('#applicationModal');
    if($scope.currentApplication) {
      applicationModal.modal('show');
    } else {
      applicationModal.modal('hide');
    }
  });

  $scope.submitApplication = function() {
    console.log($scope.application);
  }

}]);

$(function() {

  $('#advertisement-detail ul.badges li').tooltip({
    placement: "bottom",
    html: true,
    delay: 500,
    container: '#tooltip-container'
  });

});
