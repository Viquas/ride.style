app.controller('bookCarCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {

  Data.get('getAllCars').then(function (results) {
    var data = results.value;
    if(results.status == 200){
      $scope.allCars = results.value;
    }
  });

    // $scope.book.chauffeur = 0;
    var car_id = $routeParams.id;

    $scope.bookNow = function(book){
        $scope.book = {from_time:'',to_time:'',chauffeur:'',delivery_location:'',chauffeur_location:'',pickup_location:'',distance:'',additional_request:'',user_id:parseInt($rootScope.uid),car_id:parseInt(car_id)};
        book.user_id = parseInt($rootScope.uid);
        book.car_id = parseInt(car_id);
        Data.post('bookCar', {
            book: book
        }).then(function (results) {
            Data.toast(results);
            console.log(results);

        });

    }


});
