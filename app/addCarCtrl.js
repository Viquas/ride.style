app.controller('addCarCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {


  Data.get('getNewCarDetails').then(function (results) {
       $scope.models = results.model;
       $scope.category = results.category;
  });

  $scope.years = yearArray();

   $http.get('json/transmission.json').success(function(response) {
        $scope.transmission = response.transmission;
        console.log($scope.transmission);
    });

  $scope.second = function(car){
      $scope.car = {name:'',model:'',make_id:'',car_category_id:'',transmission_id:'',information:''};
  console.log(car);
    Data.post('addNewCar', {
        car: car
    }).then(function (results) {
        Data.toast(results);
        var car_id = results.id;
        console.log(results);
        if (results.status == "success") {
            $location.path('addCarSpecs?id='+car_id);
        }
    });

  }

  function yearArray(){
    var date = new Date().getFullYear();
    var year = [];
    for (var i = 0; i <= 50; i++) {
      year.push(date-i);
    }
    return year;
  }



});
