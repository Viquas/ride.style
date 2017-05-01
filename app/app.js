var app = angular.module('myApp', ['rzModule','ngRoute', 'ngAnimate','ngFileUpload','ui.bootstrap']);

app.config(['$routeProvider',
  function ($routeProvider) {
        $routeProvider.
        when('/login', {
            title: 'Login',
            templateUrl: 'partials/login.html',
            controller: 'authCtrl'
        })
            .when('/logout', {
                title: 'Logout',
                templateUrl: 'partials/login.html',
                controller: 'logoutCtrl'
            })
            .when('/signup', {
                title: 'Signup',
                templateUrl: 'partials/signup.html',
                controller: 'authCtrl'
            })
            .when('/dashboard', {
                title: 'Dashboard',
                templateUrl: 'partials/dashboard.html',
                controller: 'homeCtrl'
            })
            .when('/', {
                title: 'home',
                templateUrl: 'partials/home.html',
                controller: 'homeCtrl',
                role: '0'
            })
            .when('/car', {
                title: 'Car',
                templateUrl: 'partials/car.html',
                controller: 'carCtrl',

            })
            .when('/book', {
                title: 'Book Car',
                templateUrl: 'partials/book.html',
                controller: 'bookCtrl',
            })
            .when('/book1', {
                title: 'Book Car',
                templateUrl: 'partials/book1.html',
                controller: 'bookCtrl',
            })
            .when('/book2', {
                title: 'Book Car',
                templateUrl: 'partials/book2.html',
                controller: 'bookCtrl',
            })
            .when('/book3', {
                title: 'Book Car',
                templateUrl: 'partials/book3.html',
                controller: 'bookCtrl',
            })
            .when('/verify', {
                title: 'Verify',
                templateUrl: 'partials/verify.html',
                controller: 'bookCtrl',
            })
            .when('/car_detail', {
                title: 'Car Detail',
                templateUrl: 'partials/car_detail.html',
                controller: 'carCtrl',

            })
            .when('/addCar', {
                title: 'Add Car',
                templateUrl: 'partials/addcar.html',
                controller: 'addCarCtrl'
            })
            .when('/addCarSpecs', {
                title: 'Add Car',
                templateUrl: 'partials/addcarspecs.html',
                controller: 'addCarSpecsCtrl',
                 paramExample: 'car_id'
            })
            .when('/bookCar', {
                title: 'Book Car',
                templateUrl: 'partials/bookcar.html',
                controller: 'bookCarCtrl'

            })
            .when('/addCarImages', {
              title: 'Add Car',
              templateUrl: 'partials/addcarimages.html',
              controller: 'addCarImagesCtrl',
               paramExample: 'car_id'
            })
            .when('/test',{
              title:'Test',
              templateUrl:'partials/test.html',
              controller:'testCtrl'
            })
            .when('/addUserImages', {
              title: 'Add User Images',
              templateUrl: 'partials/adduserimages.html',
              controller: 'addUserImagesCtrl',
              paramExample: 'user_id'
            })
            .when('/selectDate', {
              title: 'Select date for booking',
              templateUrl: 'partials/dateForBooking.html',
              controller: 'bookCarCtrl'
            })
            .otherwise({
                redirectTo: '/login'
            });
  }])
    .run(function ($rootScope, $location, Data) {
        $rootScope.$on("$routeChangeStart", function (event, next, current) {
            // $rootScope.authenticated = false;
            // Data.get('session').then(function (results) {
            //     if (results.uid) {
            //
            //         $rootScope.authenticated = true;
            //         $rootScope.uid = results.uid;
            //         $rootScope.name = results.name;
            //         $rootScope.email = results.email;
            //         // $location.path("/dashboard");
            //           console.log("hereNow");
            //     }
            //      else {
            //         var nextUrl = next.$$route.originalPath;
            //         if (nextUrl == '/signup' || nextUrl == '/login') {
            //
            //         } else {
            //             $location.path("/login");
            //         }
            //     }
            // });
        });
    });
