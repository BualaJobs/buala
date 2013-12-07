buala.controller('AdvertisementController', ['$scope', function($scope) {

  $scope.user = window.user;
  $scope.advertisement = window.advertisement;

  $scope.apply = function () {
    $scope.applying = true;
  };

}]);

$(function() {

  $('#advertisement-detail ul.badges li').tooltip({
    placement: "bottom",
    html: true,
    delay: 500,
    container: '#tooltip-container'
  });

});