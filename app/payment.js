
app.controller('paymentCtrl', function ($scope, $rootScope,$route, $routeParams, $location,$timeout,$filter, $http,Upload, Data, car,booking, dates) {

 $.fn.datepicker.defaults.format = "dd/MM/yyyy";
  var datesData = dates;
  var carData = car;
  var booking_details =booking;
  $scope.disableCard1 = false;
  $scope.disableCard2 = false;
  $scope.diableForm1 = false;
  $scope.diableForm2 = false;
  $scope.allCards = [];
  $scope.paid = false;

$timeout(function () {
getCards();
}, 300);

function getCards(){
  $scope.card = {name:'',card_name:'Card 1',card_number:'',month:'',year:'',country:'',cvc:'',user_id:$rootScope.uid};
  $scope.card1 = {name:'',card_name:'Card 2',card_number:'',month:'',year:'',country:'',cvc:'',user_id:$rootScope.uid};
  Data.get('getCard?user_id='+$rootScope.uid).then(function (results) {

    if(results.status == 200){
      var i;
      var len  = results.value.length;
      $scope.allCards = results.value;
      $scope.$apply;

      for (i = 0; i < len; i++) {
          if(results.value[i].card_name == 'Card 1'){
              $scope.card = results.value[i];
              $scope.disableCard1 = true;

          }else if(results.value[i].card_name == 'Card 2'){
            $scope.card1 = results.value[i];
            $scope.disableCard2 = true;

          }
      }
    }
  });
}

 $scope.addCard = function (card) {
         Data.post('postCard', {
             card: card
         }).then(function (results) {
           console.log(results)
             if (results.status == 200) {
               if(card.card_name=='Card 1'){
                  $scope.diableForm1 = true;
                  $route.reload();

               }else{
                   $scope.diableForm2 = false;
                     $route.reload();
               }

             }
         });
       };

$scope.clear = function(){
!angular.isUndefined($rootScope.uid)
  if((!angular.isUndefined($scope.security) || $scope.security != null) && (!angular.isUndefined($scope.rent) || $scope.rent != null)){
    $scope.paid = true;

  }
  console.log($scope.rent);
  console.log($scope.security);
}


$scope.rentCar = function(){
  var sd = new Date(dates.startDate);
  var ed = new Date(dates.endDate);
  var s_date =  $filter('date')(sd, "yyyy-MM-dd");
  var e_date =  $filter('date')(ed, "yyyy-MM-dd");
  var start = s_date+" "+dates.startTime;
  var end = e_date+" "+dates.endTime;
  var chauffeur = 0;
  if(booking.chauffeur_selected){
    chauffeur = 1;
  }
  var all = {car_id: parseInt(car.id), user_id:$rootScope.uid, from_time:start, to_time:end, chauffeur:chauffeur,pickup_location:booking.pickup_location ,delivery_location: booking.delivery_address , collection_location: booking.collection_address, additional_request: booking.additional_request, rent:parseInt($scope.rent), security:parseInt($scope.security)};


  console.log(all);

    Data.post('postBooking', {
        all: all
    }).then(function (results) {
        console.log(results);
        if(results.status == 200) {
          $scope.paid = false;
          //Create model to show the users confirmation about the rent
          //or
          // Take(Create) him the confirmation page
        }else{


        }
    });

}



});
