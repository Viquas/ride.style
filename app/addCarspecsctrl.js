app.controller('addCarSpecsCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {
  $scope.next = true;
  $scope.update = false;

  var paramValue = $routeParams.id;
  $scope.car = {weekly_price:0,daily_price:0,security_deposit:0,car_id:paramValue};
  if( paramValue == null || paramValue == ''){
    console.log(paramValue);
      $location.path("/addNewCar");
  }else{

  }

  Data.get('getCar?car_id='+paramValue).then(function (results) {


    var data = results.value;
    if(results.status == 200){
      $scope.next = false;
      $scope.update = true;
        $scope.car.weekly_price = data.weekly_price;
          $scope.car.daily_price = data.daily_price;
            $scope.car.security_deposit = data.security_deposit;
        // $scope.$apply();
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
          Data.toast(results);
          console.log(results);
          // if (results.status == "success") {
          //     $location.path('addCarSpecs?id='+car_id);
          // }
      });

    }

    $scope.thirdUpdate = function(car){
        $scope.car = {weekly_price:'',daily_price:'',security_deposit:'',car_id:0};
        car.car_id = $routeParams.id;
    console.log(car);
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
