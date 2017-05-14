app.controller('authCtrl', function ($window,$route,$timeout,$scope, $rootScope, $routeParams, $location, $http, Data) {
    //initially set those objects to null to avoid undefined error


    $scope.login = {};
    $scope.signup = {};
    $scope.wrongPassword = false;
    $scope.doLogin = function (customer) {
        Data.post('login', {
            customer: customer
        }).then(function (results) {
            if (results.status == 200) {
              $rootScope.authenticated = true;
              $rootScope.uid = results.uid;
              $rootScope.name = results.name;
              $rootScope.email = results.email;
              checkForLogin();
              location.reload();
            }else{
              $scope.wrongPassword = true;
              $scope.login.password = '';
            }
        });
    };


    $timeout(function () {
      checkForLogin();
    }, 300);

    $scope.goLogin= function(){
        $location.path('/login');
    }

function checkForLogin(){

  if(!angular.isUndefined($rootScope.uid) || $rootScope.uid != null ){
    $scope.loggedIn = true;
    $scope.username = $rootScope.name;
    $scope.$apply();
    $location.path('/');
  }else{
    $scope.loggedIn = false;
      console.log('loggedOut');
   }
 }

    $scope.clear = function(){
      $scope.wrongPassword = false;
    }
//
//     $scope.forgot_password = function(){
//       //Send him an email and redirect him to the message page.
//     }
//
//     $scope.signup = {email:'',password:'',name:'',phone:'',address:''};
//     $scope.signUp = function (customer) {
//         Data.post('signUp', {
//             customer: customer
//         }).then(function (results) {
//
//             if (results.status == "success") {
//                 $location.path('dashboard');
//             }
//         });
//     };
//
//
    $scope.logout = function () {
        Data.get('logout').then(function (results) {
          $window.location.reload();
            $location.path('/');
        });
    };

});
