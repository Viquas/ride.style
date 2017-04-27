app.controller('addUserImagesCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Upload, $timeout, Data) {



  $scope.uploadUserFiles = function (files) {
    $scope.UserImage = files;

    if (files && files.length) {
      // Data.post('postCarImages', {
      //     files: files
      // }).then(function (results) {
      //     Data.toast(results);
      //     console.log(results);
      //
      // });

        Upload.upload({
            url: 'http://localhost/treestack/ride/api/v1/postUserImage',
            data: {
                files: files,
                user_id:parseInt($rootScope.uid)
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
