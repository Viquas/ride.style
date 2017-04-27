app.controller('testCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data,$filter) {


$scope.formatDate = function (date) {
    function pad(n) {
        return n < 10 ? '0' + n : n;
    }

    return date && date.getFullYear()
        + '-' + pad(date.getMonth() + 1)
        + '-' + pad(date.getDate());
};

$scope.parseDate = function (s) {
    var tokens = /^(\d{4})-(\d{2})-(\d{2})$/.exec(s);

    return tokens && new Date(tokens[1], tokens[2] - 1, tokens[3]);
};

// Enter date test here
// $scope.date = '2017-04-17' ;
});
