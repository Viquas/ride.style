app.controller('loginCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data, $timeout) {


  $scope.login = false;
  $scope.username = '';
$timeout(function () {

checkForLogin();

}, 300);


function checkForLogin(){
  if(!angular.isUndefined($rootScope.uid) || $rootScope.uid != null ){
    $scope.login = true;
    $scope.username = $rootScope.name;

  }else{
    $scope.login = false;
    $scope.username = $rootScope.name;
    $scope.$apply;

  }
}

});
