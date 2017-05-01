app.controller('homeCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data, $timeout, dates) {

  var first = this;
  first.datesTime = dates;
  console.log(first.datesTime);

  Data.get('getAllUser').then(function (results) {
      $scope.allUsers = results.value;
  });

  $scope.startTime = '12am';
  $scope.endTime = '12am';

  $.fn.datepicker.defaults.format = "dd/mm/yyyy";

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
        Data.toast(results);
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




});
