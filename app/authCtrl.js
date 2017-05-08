app.controller('authCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {
    //initially set those objects to null to avoid undefined error
    $scope.login = {};
    $scope.signup = {};
    $scope.wrongPassword = false;
    $scope.doLogin = function (customer) {
        Data.post('login', {
            customer: customer
        }).then(function (results) {
          console.log(results);
            if (results.status == "success") {

              $scope.wrongPassword = false;
                $location.path('/');
            }else{
              $scope.wrongPassword = true;
                $scope.login.password = '';

            }
        });
    };


    $scope.clear = function(){
      $scope.wrongPassword = false;
      console.log($scope.wrongPassword);
    }

    $scope.forgot_password = function(){
      //Send him an email and redirect him to the message page.
    }

    $scope.signup = {email:'',password:'',name:'',phone:'',address:''};
    $scope.signUp = function (customer) {
        Data.post('signUp', {
            customer: customer
        }).then(function (results) {

            if (results.status == "success") {
                $location.path('dashboard');
            }
        });
    };


});
