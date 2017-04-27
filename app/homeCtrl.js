app.controller('homeCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {

  Data.get('getAllUser').then(function (results) {
      $scope.allUsers = results.value;
  });


  var user_id = 187;
  Data.get('getUser?user_id='+user_id).then(function (results) {
      $scope.me = results.value;

  });

  $scope.logout = function () {
      Data.get('logout').then(function (results) {
        Data.toast(results);
          $location.path('login');
      });
  };

});
