app.controller('addCarSpecsCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {
  $scope.next = true;
  $scope.update = true;
  var baseUrl = (window.location).href; // You can also use document.URL
  var paramValue = baseUrl.substring(baseUrl.lastIndexOf('=') + 1);
  $scope.cars_id = paramValue;
  $scope.booking = {};
  $scope.car = {weekly_price:100,daily_price:800,security_deposit:4000,car_id:paramValue};
  if( paramValue == null || paramValue == ''){
    console.log(paramValue);
      // $location.path("/addNewCar");
  }else{

  }

  Data.get('getCar?car_id='+paramValue).then(function (results) {

    console.log(results);
    var data = results.value;
    if(results.status == 200){
      $scope.next = false;
      $scope.update = true;
      $scope.car = data;
        // $scope.car.weekly_price = data.weekly_price;
        //   $scope.car.daily_price = data.daily_price;
        //     $scope.car.security_deposit = data.security_deposit;
        // $scope.$apply();
        $scope.car.fuel = 'Gas';
        console.log($scope.car);
    }else{
      $scope.next = true;
      $scope.update = false;
    }

  });



    $scope.third = function(car){
        $scope.car = {weekly_price:'',daily_price:'',security_deposit:'',car_id:0};
        car.car_id = $routeParams.id;
    console.log(car);
      Data.post('addCarSpecs', {
          car: car
      }).then(function (results) {

          console.log(results);
          // if (results.status == "success") {
          //     $location.path('addCarSpecs?id='+car_id);
          // }
      });

    }

    $scope.thirdUpdate = function(car){
        // $scope.car = {weekly_price:'',daily_price:'',security_deposit:'',car_id:0};
        $scope.car.car_id = $scope.cars_id;

      Data.put('updateCarSpecs', {
          car: car
      }).then(function (results) {
          // Data.toast(results);
          console.log(results);
          // if (results.status == "success") {
          //     $location.path('addCarSpecs?id='+car_id);
          // }
      });

    }

});
