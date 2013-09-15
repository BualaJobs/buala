var bAdmin = angular.module('bAdmin', ['ngResource'])

bAdmin.controller('ApplicationsController', 
  ['$scope', '$resource', '$window', function($scope, $resource, $window) {

  var Applications = $resource(
    '/api/v1/advertisements/:advertisement_id/applications/:application_id',
    {advertisement_id: advertisement_id, application_id: '@id'},
    {
      update: {method: 'PUT'}
    }
  );

  $scope.fetch = function() {
    var applications = Applications.query(function() {
      $scope.applications = applications;
      $scope.not_seen_amount = _.filter(applications, function(application) {
        return !application.seen;
      }).length;
    });
  }

  $scope.markAsNotSeen = function(application) {
    if(application.seen) {
      application.seen = false;
      $scope.not_seen_amount++;
      Applications.update(application);
    }
  }

  $scope.markAsSeen = function(application) {
    if(!application.seen) {
      application.seen = true;
      $scope.not_seen_amount--;
      Applications.update(application);
    }
  }

  $scope.fetch();

}]);
