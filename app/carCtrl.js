app.controller('carCtrl', function ($scope, $rootScope, $routeParams, $location, $http,$filter, Data, dates, $timeout, make, car) {

// $.fn.datepicker.defaults.format = "dd/MM/yyyy";

  // clear the car id from service
  car.id=0;
  var datesData = dates;
  console.log(dates);
  var makeData = make;
  $scope.cars = [];
  $scope.loading = true;
  $scope.no_car = false;
  $scope.filterText = '';
  $scope.sliderChanged = function(){
     load();
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


  //Setup the filters
  // Make Filter
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
    generateQuery();
  }
  // searchbymake is opted at the homepage
  else{
    $('#startDate').datepicker({
     startDate: 'today',
     autoclose: true,
     });
     $('#endDate').datepicker({
      startDate: 'tomorrow',
      autoclose: true,
      });

    $scope.startTime = '00:00:00';
    $scope.endTime = '00:00:00';
    $scope.make = makeData.id;
      byMake(makeData.id);

  }


  // funciton to generate filter text
  function generateQuery(){
    var sDate = $filter('date')(new Date($scope.startDateM),"yyyy-MM-dd");
    var sDate_text = sDate + ' ' + $scope.startTime;
    var eDate = $filter('date')(new Date($scope.endDateM),"yyyy-MM-dd");
    var eDate_text = eDate + ' ' + $scope.endTime;
      var sliderData = $scope.slider;


    $scope.filterText = "start_date="+sDate_text+"&end_date="+eDate_text+"&low_price="+sliderData.min+
    "&high_price="+sliderData.max;

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


  $scope.$watchCollection('[category_select, transmission_select, make]', function(newValues, oldValues){

    load();

});

  $("#startDate").on("change",function(){
     $scope.startDateM = $(this).val();
     $scope.endDateM  = $(this).val();
       $scope.updateEndDate();
  });

  $scope.updateEndDate;

  $scope.updateEndDate = function(){
   $('#endDate').datepicker('setStartDate', $scope.startDateM);
     $scope.$apply();
  }


  function byMake(id){
    $timeout(function () {
      $('#startDate').datepicker('setDate', '+1d');
      $('#endDate').datepicker('setDate', '+2d');
      //search api attribute
      $scope.filterText = 'make_id='+id;
      generateQuery();
       $scope.$apply();
}, 300);
  }


  $scope.reset = function(){
    $scope.make = 0;
    $scope.category_select = 0;
    $scope.transmission_select = 0;
    resetSlider();
    generateQuery();

  }



    // after everything start loading the results
    function load(){
      $scope.loading = true;
      $timeout(function () {
      generateQuery();
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
