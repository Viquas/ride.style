app.controller('homeCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data, $timeout, dates , make) {

// reset the date and make services when in home
  var today = new Date();
  var tomorrow = new Date();
  tomorrow.setDate(today + 1);
  dates.startDate = today;
  dates.endDate = today;
  dates.startTime = '';
  dates.endTime = '';
  dates.set = false;
  make.id = 0;
  make.name = '';
  make.set = false;

  var first = this;
  first.datesTime = dates;
  first.make = make;

  Data.get('getAllUser').then(function (results) {
      $scope.allUsers = results.value;
  });
  $scope.startTime = '00:00:00';
  $scope.endTime = '00:00:00';

  $.fn.datepicker.defaults.format = "dd/MM/yyyy";

  $('#startDate').datepicker({
   startDate: 'today',
   daysOfWeekDisabled: [0],
   autoclose: true,
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

   $('#endDate').datepicker({
  startDate: 'tomorrow',
    autoclose: true,
    });

   $("#endDate").on("change",function(){

    });

    $timeout(function () {
      $('#endDate').datepicker('setDate', '+2d');
      $('#startDate').datepicker('setDate', '+1d');
      // $scope.apply();
}, 300);

  var user_id = 187;
  Data.get('getUser?user_id='+user_id).then(function (results) {
      $scope.me = results.value;

  });

  $scope.logout = function () {
      Data.get('logout').then(function (results) {

          $location.path('login');
      });
  };


  // Start searching by date
  $scope.searchDate =function(){
    first.datesTime.startDate = $scope.startDateM;
      first.datesTime.endDate = $scope.endDateM;
        first.datesTime.startTime = $scope.startTime;
          first.datesTime.endTime = $scope.endTime;
          first.datesTime.set = true;
          $location.path("/car");
          // get request to search the db for dated parameters

  };

  // Get by make settings
  Data.get('getNewCarDetails').then(function (results) {
       $scope.models = results.model;
       $scope.category = results.category;
  });

  $scope.searchMake =function(){
    first.make.id = $scope.make;
    first.make.set = true;
    $location.path("/car");
  };


});
