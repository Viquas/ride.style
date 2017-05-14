app.controller('carDetailCtrl', function ($scope, $rootScope, $routeParams, $location, $http,$filter, Data, dates, $timeout, car) {

  var datesData = dates;
  var carData = car;
  $.fn.datepicker.defaults.format = "yyyy-mm-dd";
  $scope.startDateM = datesData.startDate;
  $scope.endDateM = datesData.endDate;
  $scope.startTime = datesData.startTime;
  $scope.endTime = datesData.endTime;
  $scope.car_data = {};
  $scope.dis_dates = [];
  $scope.images_data = [];
  if(car.id==0){
    $location.path("/");
  }

$.fn.datepicker.defaults.format = "yyyy-mm-dd";
//Update the end date with the change in start date
  // $("#startDate").on("change",function(){
  //  $scope.startDateM = $(this).val();
  //  $scope.endDateM  = $(this).val();
  //    $scope.updateEndDate();
  //
  // });

  $scope.startChange = function(){
    $timeout(function () {
   $scope.endDateM =  $scope.startDateM;
      $scope.updateEndDate();
      console.log('change');
    }, 300);
  }

$scope.updateEndDate = function(){
 $('#endDate').datepicker('setStartDate', $scope.startDateM);
}

  Data.get('getBooking?car_id='+car.id).then(function (results) {
    $scope.booking=results.value;
    console.log($scope.booking);
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
        updateCalendar(all_dates);
    }
  });


  $scope.rent = function(){
    $location.path("/book");
  }

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
    $('#startDate').datepicker({
     startDate: 'today',
     datesDisabled: dates,
     autoclose: true,
     });

     $('#endDate').datepicker({
      startDate: 'today',
      datesDisabled: dates,
      autoclose: true,
      });
  }


  if(datesData.startDate == '' || datesData.endDate == ''){
    $('#startDate').datepicker('setDate', '+1d');
    $('#endDate').datepicker('setDate', '+2d');
    // $scope.$apply;
  }


Data.get('getCar?car_id='+car.id).then(function(results){
  if(results.status == 200){
     var data_new = results.value;
      $scope.car_data = results.value;

      $scope.images_data = data_new.images;
      // console.log($scope.images_data);
  }else{
    //  $location.path("/car");
  }
});

});
