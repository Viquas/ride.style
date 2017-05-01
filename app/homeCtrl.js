app.controller('homeCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {

  Data.get('getAllUser').then(function (results) {
      $scope.allUsers = results.value;
  });

  $scope.startDate = 'today';
  $scope.endDate = 'tomorrow';

  $.fn.datepicker.defaults.format = "dd/mm/yyyy";

  $('#startDate').datepicker({
   startDate: '01/05/2017',
   daysOfWeekDisabled: [0],
   autoclose: true,
   });

  $('#startDate').datepicker('setDate', $scope.startDate);

  $("#startDate").on("change",function(){
      $scope.startDate = $(this).val();
      console.log($scope.startDate);
      $scope.updateEndDate;
      $scope.$apply()
   });

    $scope.updateEndDate;

   $scope.updateEndDate = function(){
     $('#endDate').datepicker('setDate', $scope.startDate);
   }

   $('#endDate').datepicker({
    daysOfWeekDisabled: [0],
    autoclose: true,
    });


   $("#endDate").on("change",function(){
       $scope.endDate = $(this).val();
    });

   $('#endDate').datepicker('setDate', $scope.endDate);


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


  //start here Date picker angular ui





});
