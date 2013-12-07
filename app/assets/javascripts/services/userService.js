buala.service('UserService', ['$resource', function ($resource) {
  "use strict";

  var Advertisement = $resource('/advertisements/:id/:action', {id: "@advertisement_id", action: "@action"}, {
    apply: {method: 'POST', params: {action: "apply"}}
  });

  return {
    apply: function (advertisement) {
      return Advertisement.apply({advertisement_id: advertisement.id}).$promise;
    }
  };  

}]);
