buala.controller('AdvertisementController', ['$scope', 'Restangular', function($scope, Restangular) {

  $scope.user = window.user;

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