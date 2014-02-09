buala.controller('BusinessController', ['$scope', '$resource', function ($scope, $resource) {

  $scope.contact = {};
  $scope.contactSent = false;

  var Contact = $resource('/empresas', {}, {
    create: {method: 'POST'}
  });


  $scope.send = function () {
    if ($scope.contactForm.$valid) {
      Contact.create($scope.contact, function () {
        $scope.contactSent = true;
      });
    }
  };

}]);
