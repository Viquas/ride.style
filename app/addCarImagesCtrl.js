app.controller('addCarImagesCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Upload, $timeout, Data) {

  var car_id = $routeParams.id;
  console.log(car_id);

  $scope.uploadFiles = function (files) {
    $scope.files = files;

    if (files && files.length) {
      // Data.post('postCarImages', {
      //     files: files
      // }).then(function (results) {
      //     Data.toast(results);
      //     console.log(results);
      //
      // });

        Upload.upload({
            url: 'http://localhost/treestack/ride.style/api/v1/postCarImages',
            data: {
                files: files,
                car_id:car_id
            }
        }).then(function (response) {
            $timeout(function () {
                $scope.result = response.data;
                console.log(response);
            });
        }, function (response) {
            if (response.status > 0) {
                $scope.errorMsg = response.status + ': ' + response.data;
            }
        }, function (evt) {
            $scope.progress =
                Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
        });
    }
};
});
