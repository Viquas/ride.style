<!DOCTYPE html>
<html lang="en" ng-app="myApp">

  <head>
    <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
          <title>AngularJS Authentication App</title>
          <!-- Bootstrap -->
          <link rel="shortcut icon" href="../favicon.ico">
          <link rel="stylesheet" href="css/bootstrap.min.css">
      		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
          <link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet">
          <link rel="stylesheet" type="text/css" href="css/tabs.css" />
      		<link rel="stylesheet" type="text/css" href="css/icons.css" />
      		<link rel="stylesheet" type="text/css" href="css/component.css" />
          <link rel="stylesheet" type="text/css" href="css/flaticons/flaticon.css">
          <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/angularjs-slider/6.0.0/rzslider.min.css"/>
          <link rel="stylesheet" type="text/css" href="css/demo.css" />
      		<script src="js/modernizr.custom.js"></script>


              </head>

  <body ng-cloak="" >

              		<div id="st-container" class="st-container">


              			<nav class="st-menu st-effect-12" id="menu-12">
              				<h2 class="icon white">
                         Ride.Style</h2>
              				<ul>
              					<li><a class="icon icon-user" href="#">Profile</a></li>
              					<li><a class="icon icon-location" href="#">Location</a></li>
              					<li><a class="icon icon-study" href="#">Study</a></li>
              					<li><a class="icon icon-photo" href="#">Collections</a></li>
              					<li><a class="icon icon-wallet" href="#">Credits</a></li>
              				</ul>
              			</nav>



              			<!-- content push wrapper -->
              			<div class="st-pusher">
                      <div class="codrops-top clearfix">
                        <div id="st-trigger-effects" >

                      <button type="button" class="menu " data-effect="st-effect-12">
                        <img src="img/ham_icon.png" class="ham-img">  </img>
                        <p class="logo-text"> Menu</p>
                      </button>

                      <a href="" class="logo-link">
                        <img src="img/logo.png" class="logo-img"> </img>
                      </a>

                        <button type="button" class="user" >
                          <i class="flaticon flaticon-user-3"></i>
                            <p class="user-text"> Sign up</p>
                        </button>
                    </div>

                      </div>


                          <div data-ng-view="" id="ng-view" class="slide-animation">
                          </div>



              			</div><!-- /st-pusher -->
              		</div><!-- /st-container -->





      </div>
    </body>
  <toaster-container toaster-options="{'time-out': 3000}"></toaster-container>
  <!-- Libs -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="js/angular.min.js"></script>
  <script src="js/angular-route.min.js"></script>
  <script src="js/angular-animate.min.js" ></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="ui-bootstrap-custom-build/ui-bootstrap-custom-2.5.0.js" rel="stylesheet"></script>
  <script src="ui-bootstrap-custom-build/ui-bootstrap-custom-tpls-2.5.0.js" rel="stylesheet"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/angularjs-slider/6.0.0/rzslider.min.js"></script>
  <script src="js/toaster.js"></script>
  <script src="js/classie.js"></script>
  <script src="js/sidebarEffects.js"></script>
 <script src="js/cbpFWTabs.js"></script>

  <script src="app/app.js"></script>
  <script src="app/data.js"></script>
  <script src="app/directives.js"></script>
  <script src="app/homeCtrl.js"></script>
  <script src="app/addCarCtrl.js"></script>
  <script src="app/addCarSpecsCtrl.js"></script>
  <script src="app/fileupload/ng-file-upload-shim.js"></script>
  <script src="app/fileupload/ng-file-upload.js"></script>
  <script src="app/addCarImagesCtrl.js"></script>
  <script src="app/addUserImagesCtrl.js"></script>
  <script src="app/bookCarCtrl.js"></script>
  <script src="app/authCtrl.js"></script>
  <script src="app/test.js"></script>
  <script src="app/carCtrl.js"></script>
  <script src="app/book.js"></script>
</html>
