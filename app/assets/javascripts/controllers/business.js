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

$(function () {
  
  var infinite = function (element) {
    element.css("opacity", 1);
    setTimeout(function () {
      element.css("opacity", 0);
      setTimeout(function () {
        infinite(element);
      }, 4000);
    }, 4000);
  };

  infinite($('.screenshot-1'));
  setTimeout(function () {
    infinite($('.screenshot-2'));
  }, 4000);

});
