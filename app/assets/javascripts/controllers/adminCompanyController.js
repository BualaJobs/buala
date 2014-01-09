BualaAdmin.controller('AdminCompanyController', ['$scope', '$resource', '$window',
  function ($scope, $resource, $window) {

    var Company = $resource(
      '/api/v1/companies/:company_id',
      {company_id: '@id'}
    );

    $scope.company = Company.get({company_id: $window.company_id});
    
  }
]);