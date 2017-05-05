app.controller('bookCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data, car, dates) {

 $scope.chauffeur_selected = false;
 $scope.deliver_the_Car = 0;

 // Variables to be collected
 $scope.delivery_address = '';
 $scope.collection_address = '';
 $scope.pickup_location = '';
 $scope.collection_selector = '';
 $scope.additional_request = '';
 $scope.deliver_the_Car = 1;

 var datesData = dates;
 var carData = car;
 var centerLocation = 
 var mapOptions = {
        zoom: 16,
        center: new google.maps.LatLng(51.550503, -0.2477207),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    }

    // Car location form the db can be changed here
    var car_location = [
    {
        city : 'London',
        desc : 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK',
        lat : 51.550503,
        long : -0.2477207
    }
];
    $scope.map = new google.maps.Map(document.getElementById('carLocationMap'), mapOptions);
    $scope.markers = [];
    var infoWindow = new google.maps.InfoWindow();
    var createMarker = function (info){
        var marker = new google.maps.Marker({
            map: $scope.map,
            position: new google.maps.LatLng(info.lat, info.long),
            title: info.city
        });
        marker.content = '<div class="infoWindowContent">' + info.desc + '</div>';
        google.maps.event.addListener(marker, 'click', function(){
            infoWindow.setContent('<h2>' + marker.title + '</h2>' + marker.content);
            infoWindow.open($scope.map, marker);
        });
        $scope.markers.push(marker);
    }
    for (i = 0; i < cities.length; i++){
        createMarker(car_location[0]);
    }
    $scope.openInfoWindow = function(e, selectedMarker){
        e.preventDefault();
        google.maps.event.trigger(selectedMarker, 'click');
    }


});
