app.controller('carCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data, dates) {



  var datesData = dates;
  // if searchbydate is opted at the homepage
  if(datesData.set){
    $scope.startDateM = datesData.startDate;
      $scope.endDateM = datesData.startDate;
        $scope.startTime = datesData.startTime;
          $scope.endTime = datesData.endTime;
  }
  else{


  }
  $scope.slider = {
    min: 300,
    max: 1000,
    options: {
      floor: 0,
      ceil: 3000
    }
  };



});
