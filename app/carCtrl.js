app.controller('carCtrl', function ($scope, $window,$rootScope, $routeParams, $location, $http,$filter, Data, dates, $timeout, make, car) {
$window.scrollTo(0, 0);
// $.fn.datepicker.defaults.format = "dd/MM/yyyy";

  // clear the car id from service
  car.id=0;
  var datesData = dates;
  var makeData = make;

  $scope.cars = [];
  $scope.loading = true;
  $scope.no_car = false;
  $scope.filterText = '';
  $scope.mode = 0;
  $scope.no_date = false;
  $scope.sliderChanged = function(){
     load();
  }

   $.fn.datepicker.defaults.format = "yyyy-mm-dd";


  // $timeout(function () {
  //    $('#startDate1').datepicker({
  //    startDate: 'today',
  //    autoclose: true,
  //    });
  //
  //    $('#endDate').datepicker({
  //    startDate: 'today',
  //    autoclose: true,
  //    });
  //  }, 300);


   $scope.startChange = function(){

     $timeout(function () {
    $scope.endDateM =  $scope.startDateM;
       $scope.updateEndDate();
     }, 300);
   }

  // $("#startDate1").on("change",function(){
  //   //  $scope.startDateM = $(this).val();
  //   console.log('s');
  //
  // });
  //   $scope.updateEndDate;

  $scope.updateEndDate = function(){
   $('#endDate1').datepicker('setStartDate', $scope.startDateM);
     $scope.$apply();
  }

  resetSlider();
  function resetSlider(){
    $scope.slider = {
      min: 0,
      max: 3000,
      options: {
        floor: 0,
        ceil: 3000,
        onEnd: $scope.sliderChanged
      }
    };
  }

  //Call for  filters
  Data.get('getNewCarDetails').then(function (results) {
       $scope.models = results.model;
       $scope.category = results.category;
        $scope.transmission = results.transmission;
  });


  // searchbydate is opted at the homepage
  if(datesData.set){

    $scope.startDateM = datesData.startDate;
    $scope.endDateM = datesData.endDate;
    $scope.startTime = datesData.startTime;
    $scope.endTime = datesData.endTime;

    generateQuery(1);
     $('#startDate1').datepicker({
      startDate: $scope.startDateM,
      autoclose: true,
      });
     $('#endDate1').datepicker({
      startDate: $scope.endDateM,
      autoclose: true,
      });
  }
  // searchbymake is opted at the homepage
  else{
    $scope.startTime = '00:00:00';
    $scope.endTime = '00:00:00';
    $scope.make = makeData.id;
      byMake(makeData.id);
  }

  // funciton to generate filters
  function generateQuery(mode){
    var sDate = $filter('date')(new Date($scope.startDateM),"yyyy-MM-dd");
    var sDate_text = sDate + ' ' + $scope.startTime;
    var eDate = $filter('date')(new Date($scope.endDateM),"yyyy-MM-dd");
    var eDate_text = eDate + ' ' + $scope.endTime;
      var sliderData = $scope.slider;
      //modes
      // Browse all = 0
      // Browse by date = 0
      // Browse by make = 0

      if(mode == 0){
        $scope.filterText = "low_price="+sliderData.min+
        "&high_price="+sliderData.max;
        $scope.mode = mode;
      }else if (mode == 1) {
        $scope.filterText = "start_date="+sDate_text+"&end_date="+eDate_text+"&low_price="+sliderData.min+
        "&high_price="+sliderData.max;
        $scope.mode = mode;
      }else{
        $scope.filterText = "low_price="+sliderData.min+
        "&high_price="+sliderData.max;
        $scope.mode = mode;
      }


    // check for all the filters here
    if( !angular.isUndefined($scope.make) || $scope.make != null ){
      $scope.filterText +="&make_id="+$scope.make;
    }
    if( !angular.isUndefined($scope.category_select) || $scope.category_select != null){
      $scope.filterText +="&category_id="+$scope.category_select;
    }
    if( !angular.isUndefined($scope.transmission_select) || $scope.transmission_select != null){
      $scope.filterText +="&transmission_id="+$scope.transmission_select;
    }



    $timeout(function () {
    getFilteredCars();
   }, 300);
  }



  // Calling filtered car results from make/date
  function getFilteredCars(){
    Data.get('getCarsFiltered?'+$scope.filterText).then(function (results) {

      if(results.status == 200){
        //if the results has more thn one car
          $scope.cars = results.value;
          $scope.no_car = false;
      }else{
        //Create a few to show no cars available for applied filters
        $scope.cars =[];
        $scope.no_car = true;
          $scope.$apply;

      }
      $scope.loading = false;
      $scope.$apply;

    });
  }

$scope.$watchCollection('[startDateM]', function(newValues, oldValues){
  $scope.mode = 1;
  load();
});

$scope.$watchCollection('[endDateM]', function(newValues, oldValues){
  $scope.mode = 1;

  load();
});


  $scope.$watchCollection('[category_select, transmission_select, make]', function(newValues, oldValues){
    load();

});



  function byMake(id){
    $timeout(function () {
      $('#startDate1').datepicker('setDate', '');
      $('#endDate1').datepicker('setDate', '');
      $scope.no_date = true;
      //search api attribute
      $scope.filterText = 'make_id='+id;
      generateQuery(2);
       $scope.$apply();
      }, 300);
  }


  $scope.reset = function(){
    $scope.make = 0;
    $scope.category_select = 0;
    $scope.transmission_select = 0;
    resetSlider();
    generateQuery(0);

  }



    // after everything start loading the results
    function load(){
      $scope.loading = true;
      $timeout(function () {
      generateQuery($scope.mode);
     }, 300);

    }


    //Redirect to the car detail page
    $scope.car_details=function(id){
      dates.startDate = $scope.startDateM;
      dates.endDate = $scope.endDateM;
      dates.startTime = $scope.startTime;
      dates.endTime = $scope.endTime;
      car.id = id;
      $location.path("/car_detail");
    }


});
