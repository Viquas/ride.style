app.controller('carDetailCtrl', function ($scope, $rootScope, $routeParams, $location, $http,$filter, Data, dates, $timeout, car) {

  var datesData = dates;
  var carData = car


  $scope.startDateM = datesData.startDate;
  $scope.endDateM = datesData.endDate;
  $scope.startTime = datesData.startTime;
  $scope.endTime = datesData.endTime;
  console.log(datesData);
  console.log(carData);


  if(car.id==0){
    $location.path("/");
  }
  Data.get('getCar?car_id='+car.id).then(function (results) {
    console.log(results)
    if(results.status == 200){
        $scope.car = results.value;
    }else{
      // If car not found take action
    }
  });








});
