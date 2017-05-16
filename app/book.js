app.controller('bookCtrl', function ($scope,$window, $rootScope, $routeParams, $location,$timeout, $http,Upload, Data, car,booking, dates) {
$window.scrollTo(0, 0);

  var datesData = dates;
  var carData = car;
  var booking_details =booking;
  console.log(booking_details);
  console.log(datesData);
    console.log(carData);

 // Variables to be collected
 $scope.chauffeur_selected = booking_details.chauffeur_selected;;
 $scope.delivery_address = booking_details.delivery_address;
 $scope.collection_address = booking_details.collection_address;
 $scope.pickup_location = booking_details.pickup_location;
 $scope.collection_selector = booking_details.collection_selector;
 $scope.additional_request = booking_details.additional_request;
 $scope.deliver_the_Car = booking_details.deliver_the_Car;
 $scope.car = '';
 $scope.disable_address = true;
 $scope.collection_placeholder = 'Collection address same as delivery address';

$scope.col_change = function(){
  if($scope.collection_selector){
    $scope.disable_address=true;
    $scope.collection_address = '';
    $scope.collection_placeholder = 'Collection address same as delivery address';
  }else{
    $scope.disable_address=false;
    $scope.collection_placeholder = 'Enter Collection address';
    console.log($scope.collection_placeholder);
    $scope.$apply();
  }
}

// Get car Details
Data.get('getCar?car_id='+car.id).then(function (results) {

  if(results.status == 200){
      $scope.car = results.value;
          $timeout(function () {
            get_booking_details();
            console.log($scope.car);

          get_map();
         }, 300);
  }else{

  }
});

function get_booking_details(){

    var array_for_days = dateRange($scope.startDateM,$scope.endDateM);
    console.log('Total days rented = '+array_for_days.length);
    $scope.car.vat = 35;
    $scope.car.delivery_charges = 200;
    $scope.car.days = array_for_days.length - 1;
    $scope.car.total_chauffeur = $scope.car.days * 40;
    $scope.car.total_rent = $scope.car.days * $scope.car.daily_price;

    $scope.car.total = $scope.car.total_rent + $scope.car.vat + $scope.car.delivery_charges;
    if($scope.chauffeur_selected){
        $scope.car.total += $scope.car.total_chauffeur;
    }
}

function get_map(){

    var centerLocation = {lat:$scope.car.latitude, long:$scope.car.longitude};
    var mapOptions = {
           zoom: 16,
           center: new google.maps.LatLng(centerLocation.lat, centerLocation.long),
           mapTypeId: google.maps.MapTypeId.TERRAIN
       }

       // Car location form the db can be changed here
       var car_location = [
       {
           city : $scope.car.city,
           desc : $scope.car.address,
           lat : $scope.car.latitude,
           long : $scope.car.longitude
       }
   ];
   $scope.map = new google.maps.Map(document.getElementById('carLocationMap'), mapOptions);
   $scope.markers = [];
   var infoWindow = new google.maps.InfoWindow();
   var createMarker = function (info){
       var marker = new google.maps.Marker({
           map: $scope.map,
           position: new google.maps.LatLng(info.lat, info.long),
           title: info.city
       });
       marker.content = '<div class="infoWindowContent">' + info.desc + '</div>';
       google.maps.event.addListener(marker, 'click', function(){
           infoWindow.setContent('<h2>' + marker.title + '</h2>' + marker.content);
           infoWindow.open($scope.map, marker);
       });
       $scope.markers.push(marker);
   }
   for (i = 0; i < car_location.length; i++){
       createMarker(car_location[0]);
   }
   $scope.openInfoWindow = function(e, selectedMarker){
       e.preventDefault();
       google.maps.event.trigger(selectedMarker, 'click');
   }

}


  $scope.next_personal = function(){

    var proceed = false;

    if($scope.chauffeur_selected){
      if($scope.pickup_location != ''){
           proceed = true;
      }else{
          //Ask to enter the pick up location
          $scope.showMessage = true;
            $scope.message = 'Please enter the pick up address';

      }
    }else{
      if($scope.deliver_the_Car == 0){
        if($scope.delivery_address != '' && $scope.collection_address != ''){
           proceed = true;
        }else if(booking.collection_selector && $scope.delivery_address != '')
        {
            proceed = true;
            }else{
              $scope.showMessage = true;
                $scope.message = 'Please enter the delivery and collection address';
            }
      }else{
         proceed = true;
      }
    }
    if(proceed){
      update_details();
    if(!angular.isUndefined($rootScope.uid) || $rootScope.uid != null ){
      //Logged in redirect to summary page
      $location.path("/summary");
    }else{
      //Not logged in redirect to signup page
      $location.path("/signup");
    }
  }

  }

// summary part
 $.fn.datepicker.defaults.format = "yyyy-mm-dd";
 $scope.startDateM = datesData.startDate;
 $scope.endDateM = datesData.endDate;
 $scope.startTime = datesData.startTime;
 $scope.endTime = datesData.endTime;
$scope.terms_agreed = false;



$scope.startChange = function(){
  $timeout(function () {
    $scope.updateEndDate();
  }, 300);
}

$scope.updateEndDate = function(){
$('#endDate1').datepicker('setStartDate', $scope.startDateM);
}

Data.get('getBooking?car_id='+carData.id).then(function (results) {
  $scope.booking=results.value;

  var all_dates = [];
  if(results.value.length > 0){
      var len = results.value.length;
      for(var i=0; i<len; i++){
        var start_date = results.value[i].from_time;
        var end_date = results.value[i].to_time;
        var s = start_date.split(" ");
        var e = end_date.split(" ");
        var range = dateRange(s[0],e[0]);
        for(var j=0; j<range.length; j++){
          all_dates.push(range[j]);
        }
      }

  }
  updateCalendar(all_dates);
});



function dateRange(startDate,endDate){
  var listDate = [];
  var dateMove = new Date(startDate);
  var strDate = startDate;
  while (strDate < endDate){
   var strDate = dateMove.toISOString().slice(0,10);
   listDate.push(strDate);
   dateMove.setDate(dateMove.getDate()+1);
 };
return listDate;
}


function updateCalendar(dates){
  $('#startDate1').datepicker({
     startDate: 'today',
   datesDisabled: dates,
   autoclose: true,
   });

   $('#endDate1').datepicker({
      startDate: $scope.startDateM,
    datesDisabled: dates,
    autoclose: true,
    });


    $('#endDate1').datepicker('setDate', $scope.endDateM);
}

  // Go to payment
  $scope.payment = function(){
    update_details();
    $location.path("/payment");
  }





// Signup part
$scope.emailFormat = /^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
$scope.always_hide = true;
$scope.form =[];
$scope.$apply;
$scope.count = 0;
      $scope.myFunc = function() {
        $scope.count++;
      };

$scope.driving_image_name = 'Upload Driving License';
$scope.address_image_name = 'Upload Address Proof';
$scope.drivingAdded = false;
$scope.addressAdded = false;
$scope.showMessage = false;
$scope.message = '';
$scope.uploadDrivingFiles = function (files) {
  clearMessage();
  $scope.drivingImage = files;
  if (files && files.length) {
    $scope.driving_image_name = files[0].name;
    $scope.drivingAdded = true;
  }
};

$scope.uploadAddressFiles = function (files) {
  clearMessage();
  $scope.addressImage = files;
  if (files && files.length) {
    $scope.address_image_name = files[0].name;
    $scope.addressAdded = true;
  }
};

$scope.clear = function(){
  clearMessage();
}

$scope.signup = {first_name:'',second_name:'',dob:'', nationality:'',email:'',mobile:'',password:'',confirm_password:'',address_line1:'',address_line2:'',city:'',county:'',postal:''};
$scope.signUp = function (customer) {

  if($scope.drivingAdded && $scope.addressAdded){
    Data.post('signUp', {
        customer: customer
    }).then(function (results) {
        console.log(results);
        if (results.status == 200) {
            //upload images to the driving and address proof

            var user_id = results.uid
            uploadImages(user_id);
        }else{
            // Say something went wrong
            $scope.showMessage = true;
            $scope.message = results.message;

        }
    });
  }else{
    // Ask for all inputs are neccessary
    $scope.showMessage = true;
      $scope.message = 'Please add ur driving license and address proof';
      console.log($scope.message);
  }

};


function clearMessage(){
  $scope.showMessage = false;
    $scope.message = '';
}
function uploadImages(id){

  Upload.upload({
      url: 'api/v1/postDrivingLicense',
      data: {
          files: $scope.drivingImage,
          user_id:id
      }
  }).then(function (response) {
      $timeout(function () {
          $scope.result = response.data;
          if(response.status == 200){
            update_details();
            $location.path("/summary");
          }else{
            // Images did not uploaded
          }

      });
  });
}

  function update_details(){
    booking.chauffeur_selected = $scope.chauffeur_selected;
    booking.delivery_address = $scope.delivery_address;
    booking.collection_address = $scope.collection_address;
    booking.pickup_location = $scope.pickup_location;
    booking.collection_selector = $scope.collection_selector;
    booking.additional_request = $scope.additional_request;
    booking.deliver_the_Car = $scope.deliver_the_Car;
    datesData.startDate = $scope.startDateM;
    datesData.endDate = $scope.endDateM;
    datesData.startTime = $scope.startTime;
    datesData.endTime = $scope.endTime;
  }



});
