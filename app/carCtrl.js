app.controller('carCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {

  $scope.slider = {
    min: 100,
    max: 180,
    options: {
      floor: 0,
      ceil: 450
    }
  };

});
