var bAdmin = angular.module('bAdmin', ['ngResource'])

bAdmin.controller('ApplicationsController', 
  ['$scope', '$resource', '$window', function($scope, $resource, $window) {

  var Applications = $resource(
    '/companies/:company_id/ads/:ad_id/applications' + $window.location.search,
    {company_id: company_id, ad_id: ad_id},
    {'query': {method: 'GET', isArray: true}}
  );

  $scope.fetch = function() {
    return $scope.applications = Applications.query();
  }

  $scope.markAsNotSeen = function(application) {
    application.seen = false;
  }

  $scope.markAsSeen = function(application) {
    application.seen = true;
  }

  $scope.fetch();

}]);
