<?php
$app->get('/session', function() {
    $db = new DbHandler();
    $session = $db->getSession();
    $response["uid"] = $session['uid'];
    $response["email"] = $session['email'];
    $response["name"] = $session['name'];
    echoResponse(200, $session);
});

$app->post('/login', function() use ($app) {
    require_once 'passwordHash.php';
    $r = json_decode($app->request->getBody());
    verifyRequiredParams(array('email', 'password'),$r->customer);
    $response = array();
    $db = new DbHandler();
    $password = $r->customer->password;
    $email = $r->customer->email;
    $user = $db->getOneRecord("select uid,first_name,last_name,password,email,created from customers_auth where phone='$email' or email='$email'");
    if ($user != NULL) {
        if(passwordHash::check_password($user['password'],$password)){
        $response['status'] = 200;
        $response['message'] = 'Logged in successfully.';
        $response['first_name'] = $user['first_name'];
        $response['last_name'] = $user['last_name'];
        $response['uid'] = $user['uid'];
        $response['email'] = $user['email'];
        $response['createdAt'] = $user['created'];
        if (!isset($_SESSION)) {
            session_start();
        }
        $_SESSION['uid'] = $user['uid'];
        $_SESSION['email'] = $email;
        $_SESSION['name'] = $user['first_name'];
        } else {
            $response['status'] = "201";
            $response['message'] = 'Login failed. Incorrect credentials';
        }
    }else {
            $response['status'] = "201";
            $response['message'] = 'No such user is registered';
        }
    echoResponse(200, $response);
});
$app->post('/signUp', function() use ($app) {
    $response = array();
    $r = json_decode($app->request->getBody());
    verifyRequiredParams(array('email', 'first_name', 'password'),$r->customer);
    require_once 'passwordHash.php';
    $db = new DbHandler();

    $phone = $r->customer->mobile;
    $first_name = $r->customer->first_name;
    $last_name = $r->customer->last_name;
    $email = $r->customer->email;
    $address_line1 = $r->customer->address_line1;
    $address_line2 = $r->customer->address_line2;
    $dob = $r->customer->dob;
    $password = $r->customer->password;
     $isUserExists = $db->getOneRecord("select 1 from customers_auth where phone='$phone' or email='$email'");
    //  print_r($r);
    if(!$isUserExists){

        $r->customer->password = passwordHash::hash($password);
        $tabble_name = "customers_auth";
        $column_names = array('phone', 'first_name', 'last_name','email', 'password','dob');

        $result = $db->insertIntoTable($r->customer, $column_names, $tabble_name);
        if ($result != NULL) {
            $response["status"] = 200;
            $response["message"] = "User account created successfully";
            $response["uid"] = $result;

            if(add_address($r->customer,$result)){
              if (!isset($_SESSION)) {
                  session_start();
              }
              $_SESSION['uid'] = $response["uid"];
              $_SESSION['phone'] = $phone;
              $_SESSION['name'] = $first_name;
              $_SESSION['email'] = $email;
              echoResponse(200, $response);
            }else{
              $response["status"] = "fail";
              $response["message"] = "User account cannot be created";

              echoResponse(200, $response);
            }

        } else {
            $response["status"] = "error";
            $response["message"] = "Failed to create customer. Please try again";
            echoResponse(201, $response);
        }
    }else{
        $response["status"] = "error";
        $response["message"] = "An user with the provided phone or email exists!";
        echoResponse(201, $response);
    }
});


$app->post('/postCard', function() use ($app) {
    $response = array();
    $r = json_decode($app->request->getBody());
    $db = new DbHandler();

    $name = $r->card->name;
    $number = $r->card->number;
    $month = $r->card->month;
    $year = $r->card->year;
    $country = $r->card->country;
    $user_id = $r->card->user_id;
    $card_name = $r->card->card_name;

     $isCardExists = $db->getOneRecord("select 1 from card where card_number='$number' or user_id='$user_id'");
    //  print_r($r);
    if(!$isCardExists){
        $table_name = "card";
        $column_names = array('name', 'card_number', 'month','year', 'country','card_name','user_id');
        $result = $db->insertIntoTable($r->customer, $column_names, $tabble_name);
        if ($result != NULL) {
            $response["status"] = 200;
            $response["message"] = "Card added successfully";
            $response["uid"] = $result;

        } else {
            $response["status"] = "error";
            $response["message"] = "Failed to create card. Please try again";
            echoResponse(201, $response);
        }
    }else{
        $response["status"] = "error";
        $response["message"] = "Card entered exists already!";
        echoResponse(201, $response);
    }
});
function add_address($customer,$id){
  $return_value = 0;
  $r = new stdClass();
  $r->{'user_id'} = $id;
  $r->{'address_line_1'} = $customer->address_line1;
  $r->{'address_line_2'} = $customer->address_line2;
  $r->{'city'} = $customer->city;
  $r->{'county'} = $customer->county;
  $r->{'postcode'} = $customer->postal_code;
  $r->{'type_id'} = 1;
  $table_name = "address";
  $column_names = array('address_line_1', 'address_line_2', 'city','county', 'postcode','type_id','user_id');
  $db = new DbHandler();
  $result = $db->insertIntoTable($r, $column_names, $table_name);
  if ($result != NULL) {
      $return_value = 1;
  }else{
      $return_value = 0;
  }
  return $return_value;
}

$app->get('/logout', function() {
    $db = new DbHandler();
    $session = $db->destroySession();
    $response["status"] = "info";
    $response["message"] = "Logged out successfully";
    echoResponse(200, $response);
});

$app->get('/getAllUser', function() use ($app) {
    $db = new DbHandler();
    $result = $db->getRecord("SELECT uid, name, email, phone, created,image FROM customers_auth Where 1");
    $message = '';
    $status = 0;
    if ($result != NULL) {
        $status = 200;
        $data= array();
        for ($i=0; $i < sizeof($result) ; $i++) {
        $row = $result[$i];
        $json_obj = new stdClass();
           $json_obj->{'uid'} = $row[0];
           $json_obj->{'name'} = $row[1];
           $json_obj->{'email'} = $row[2];
           $json_obj->{'phone'} = $row[3];
           $json_obj->{'created'} = $row[4];
           $json_obj->{'image'} = $row[5];
           $data[] = $json_obj;
        }
        $message = 'All users';
        } else {
            $status = 500;
            $message = 'No user found';
        }

    echoResponse(200, array("status"=>200,"message"=>$message,"value"=>$data));
});

$app->get('/getAllBooking', function() use ($app) {
    $db = new DbHandler();
    $result = $db->getRecord("SELECT * FROM car_booking Where 1");
    $message = '';
    $status = 0;
    if ($result != NULL) {
        $status = 200;
        $data= array();
        for ($i=0; $i < sizeof($result) ; $i++) {
        $row = $result[$i];
        $json_obj = new stdClass();
           $json_obj->{'id'} = $row[0];
           $json_obj->{'car_id'} = $row[1];
           $json_obj->{'user_id'} = $row[2];
           $json_obj->{'from_time'} = $row[3];
           $json_obj->{'to_time'} = $row[4];
           $json_obj->{'chauffeur'} = $row[5];
           $json_obj->{'pickup_location'} = $row[6];
           $json_obj->{'delivery_location'} = $row[7];
           $json_obj->{'collection_location'} = $row[8];
           $json_obj->{'distance'} = $row[9];
           $json_obj->{'additional_request'} = $row[10];
           $data[] = $json_obj;
        }
        $message = 'All users';
        } else {
            $status = 500;
            $message = 'No user found';

        }

    echoResponse(200, array("status"=>200,"message"=>$message,"value"=>$data));
});
$app->get('/getBooking', function() use ($app) {

    $db = new DbHandler();
    $car_id = $app->request()->get('car_id');
    $user_id = $app->request()->get('user_id');
    $booking_id = $app->request()->get('booking_id');
    if(isset($car_id)){
      $compare_id = $app->request()->get('car_id');
      $query = "select b.id ,b.user_id, b.car_id, b.additional_request, b.chauffeur, b.collection_location,
      b.delivery_location, b.distance, b.from_time, b.to_time, b.pickup_location, u.name as username,
       c.name as car_name from car_booking  as b
  inner join customers_auth u on b.user_id = u.uid
  inner join cars c on b.car_id = c.id where b.car_id = ".$compare_id;
    }else if(isset($user_id)){
      $compare_id = $app->request()->get('user_id');
      $query = "select b.id ,b.user_id, b.car_id, b.additional_request, b.chauffeur, b.collection_location,
      b.delivery_location, b.distance, b.from_time, b.to_time, b.pickup_location, u.name as username,
       c.name as car_name from car_booking  as b
  inner join customers_auth u on b.user_id = u.uid
  inner join cars c on b.car_id = c.id where b.user_id = ".$compare_id;
    }else if(isset($booking_id)){
      $compare_id = $app->request()->get('booking_id');
      $query = "select b.id ,b.user_id, b.car_id, b.additional_request, b.chauffeur, b.collection_location,
      b.delivery_location, b.distance, b.from_time, b.to_time, b.pickup_location, u.name as username,
       c.name as car_name from car_booking  as b
  inner join customers_auth u on b.user_id = u.uid
  inner join cars c on b.car_id = c.id where b.id = ".$compare_id;
    }else{
      $message = 'Need an id';
    }

    $result = $db->getRecord($query);
    $data= array();
    $message = '';
    $status = 0;
      $json_obj = new stdClass();

      if ($result != NULL) {
          $status = 200;
          $data= array();
          for ($i=0; $i < sizeof($result) ; $i++) {
          $row = $result[$i];
          $json_obj = new stdClass();
             $json_obj->{'id'} = $row[0];
             $json_obj->{'user_id'} = $row[1];
             $json_obj->{'car_id'} = $row[2];
             $json_obj->{'additional_request'} = $row[3];
             $json_obj->{'chauffeur'} = $row[4];
             $json_obj->{'collection_location'} = $row[5];
             $json_obj->{'delivery_location'} = $row[6];
             $json_obj->{'distance'} = $row[7];
             $json_obj->{'from_time'} = $row[8];
             $json_obj->{'to_time'} = $row[9];
             $json_obj->{'pickup_location'} = $row[10];
             $json_obj->{'username'} = $row[11];
             $json_obj->{'car_name'} = $row[12];
             $data[] = $json_obj;
          }
          $message = 'All users';
          }else {
            $status = 500;
            $message = 'No booking found';

        }
    echoResponse(200, array("status"=>$status,"message"=>$message,"value"=>$data));
});
function addCarImage($image_name,$car_id){
  $db = new DbHandler();
  $table_name = "car_images";
  $r = new stdClass();
  $r->{'car_id'} = $car_id;
  $r->{'image_link'} = $image_name;
      $column_names = array('car_id', 'image_link');
      $result = $db->insertIntoTable($r, $column_names, $table_name);
      if ($result != NULL) {
          $response["status"] = "success";
          $response["message"] = "Car added successfully";
          $response["id"] = $result;
          echoResponse(200, $response);
      } else {
          $response["status"] = "error";
          $response["message"] = "Failed to create car. Please try again";
          echoResponse(201, $response);
      }
}

function addUserImage($image_name,$user_id){
  $db = new DbHandler();
  $table_name = "customers_auth";
  $r = new stdClass();
  $r->{'uid'} = $user_id;
  $r->{'image'} = $image_name;
      $column_names = array('uid', 'image');
      $query = "UPDATE customers_auth SET `image` = '$image_name' WHERE `uid` = $user_id";

      $result = $db->updateTable($query);
      if ($result != NULL) {
          $response["status"] = "success";
          $response["message"] = "Image updated successfully";
          $response["id"] = $result;
          // echoResponse(200, $response);
      } else {
          $response["status"] = "error";
          $response["message"] = "Image updated successfully";
          // echoResponse(201, $response);
      }
}



$app->post('/postCarImages', function() use($app){

  if (!isset($_FILES['files'])) {
       echo "No files uploaded!!";
       return;
   }
   $imgs = array();

   $files = $_FILES['files'];
   $cnt = count($files['name']);

   for($i = 0 ; $i < $cnt ; $i++) {
       if ($files['error'][$i] === 0) {
           $name = uniqid('img-'.date('Ymd').'-');
           $upload_folder = '../../images/cars/';
           $userfile_name = $files['name'][$i];
           $userfile_extn = substr($userfile_name, strrpos($userfile_name, '.')+1);
          // echo('hi');
           if (move_uploaded_file($files['tmp_name'][$i], $upload_folder . $name.".".$userfile_extn) === true) {
               $imgs[] = array('url' => '/uploads/' . $name, 'name' => $files['name'][$i]);
               $send_image = $name.".".$userfile_extn;
               addCarImage($send_image,$_POST['car_id']);
           }

       }
   }

   $imageCount = count($imgs);

   if ($imageCount == 0) {
      echo 'No files uploaded!!  <p><a href="/">Try again</a>';
      return;
   }

   $plural = ($imageCount == 1) ? '' : 's';

   foreach($imgs as $img) {
       printf('%s <img src="%s" width="50" height="50" /><br/>', $img['name'], $img['url']);
   }
});


$app->post('/postUserImage', function() use($app){
  if (!isset($_FILES['files'])) {
       echo "No files uploaded!!";
       return;
   }
   $imgs = array();

   $files = $_FILES['files'];
   $cnt = count($files['name']);

   for($i = 0 ; $i < $cnt ; $i++) {
       if ($files['error'][$i] === 0) {
           $name = uniqid('img-'.date('Ymd').'-');
           $upload_folder = '../../images/user/';
           $userfile_name = $files['name'][$i];
           $userfile_extn = substr($userfile_name, strrpos($userfile_name, '.')+1);
           if (move_uploaded_file($files['tmp_name'][$i], $upload_folder . $name.".".$userfile_extn) === true) {
               $imgs[] = array('url' => 'images/user/' . $name.".".$userfile_extn, 'name' => $files['name'][$i]);
               $send_image = $name.".".$userfile_extn;
               addUserImage($send_image,$_POST['user_id']);
           }

       }
   }

   $imageCount = count($imgs);

   if ($imageCount == 0) {
      echo 'No files uploaded!!  <p><a href="/">Try again</a>';
      return;
   }

   $plural = ($imageCount == 1) ? '' : 's';

   foreach($imgs as $img) {
       printf('<img src="%s" width="50" height="50" /><br/>', $img['url']);
   }
});

$app->post('/postDrivingLicense', function() use($app){
  if (!isset($_FILES['files'])) {
       echo "No files uploaded!!";
       return;
   }
   $imgs = array();

   $files = $_FILES['files'];
   $cnt = count($files['name']);

   for($i = 0 ; $i < $cnt ; $i++) {
       if ($files['error'][$i] === 0) {
           $name = uniqid('img-'.date('Ymd').'-');
           $upload_folder = '../../images/driving_license/';
           $userfile_name = $files['name'][$i];
           $userfile_extn = substr($userfile_name, strrpos($userfile_name, '.')+1);
           if (move_uploaded_file($files['tmp_name'][$i], $upload_folder . $name.".".$userfile_extn) === true) {
               $imgs[] = array('url' => 'images/driving_license/' . $name.".".$userfile_extn, 'name' => $files['name'][$i]);
               $send_image = $name.".".$userfile_extn;
                 $table_name = "driving_license";
                addImagesToTable($send_image,$_POST['user_id'],$table_name);
           }

       }
   }

   $imageCount = count($imgs);

   if ($imageCount == 0) {
      echo 'No files uploaded!!  <p><a href="/">Try again</a>';
      return;
   }
   $plural = ($imageCount == 1) ? '' : 's';
   foreach($imgs as $img) {
       printf('%s', $img['url']);
   }
});

$app->post('/postAddressProof', function() use($app){
  if (!isset($_FILES['files'])) {
       echo "No files uploaded!!";
       return;
   }
   $imgs = array();

   $files = $_FILES['files'];
   $cnt = count($files['name']);

   for($i = 0 ; $i < $cnt ; $i++) {
       if ($files['error'][$i] === 0) {
           $name = uniqid('img-'.date('Ymd').'-');
           $upload_folder = '../../images/address_proof/';
           $userfile_name = $files['name'][$i];
           $userfile_extn = substr($userfile_name, strrpos($userfile_name, '.')+1);
           if (move_uploaded_file($files['tmp_name'][$i], $upload_folder . $name.".".$userfile_extn) === true) {
               $imgs[] = array('url' => 'images/address_proof/' . $name.".".$userfile_extn, 'name' => $files['name'][$i]);
               $send_image = $name.".".$userfile_extn;
               $table_name = 'address_proof';
                addImagesToTable($send_image,$_POST['user_id'],$table_name);
           }

       }
   }

   $imageCount = count($imgs);

   if ($imageCount == 0) {
      echo 'No files uploaded!!  <p><a href="/">Try again</a>';
      return;
   }
   $plural = ($imageCount == 1) ? '' : 's';
   foreach($imgs as $img) {
       printf('%s', $img['url']);
   }
});

function addImagesToTable($image_name,$user_id,$table_name){
  $db = new DbHandler();
  $r = new stdClass();
  $r->{'user_id'} = $user_id;
  $r->{'image'} = $image_name;
      $column_names = array('user_id', 'image');
      $result = $db->insertIntoTable($r, $column_names, $table_name);
      if ($result != NULL) {
          $response["status"] = "success";
          $response["message"] = "Driving License added successfully";
          $response["id"] = $result;
          // echoResponse(200, $response);
      } else {
          $response["status"] = "error";
          $response["message"] = "Failed to add driving license. Please try again";
          // echoResponse(201, $response);
      }
}
function getCarImages($tableName,$car_id){
  $db = new DbHandler();
  $query = "SELECT * FROM ".$tableName." WHERE car_id =".$car_id;

  $result = $db->getRecord($query);
  return $result;
}

$app->get('/getCarsByMake', function() use ($app) {
    $db = new DbHandler();
    $make_id = $app->request()->get('id');
    $result = $db->getRecord("select u.id, u.name,m.name as make, s.name as category, u.model,
    u.information, u.year, t.type as transmission, cs.daily_price, cs.weekly_price ,
     cs.security_deposit from cars u
     inner join car_category s on u.car_category_id = s.id
     inner join car_model m on u.make_id = m.id
     inner join transmission t on u.transmission_id = t.id
     inner join car_specifications cs on cs.car_id = u.id
     where m.id = ".$make_id);

    $message = '';
    $status = 0;
    if ($result != NULL) {
        $status = 200;
        $data= array();
        for ($i=0; $i < sizeof($result) ; $i++) {

        $row = $result[$i];
        $json_obj = new stdClass();
           $json_obj->{'id'} = $row[0];
           $json_obj->{'name'} = $row[1];
           $json_obj->{'make'} = $row[2];
           $json_obj->{'category'} = $row[3];
           $json_obj->{'model'} = $row[4];
           $json_obj->{'information'} = $row[5];
           $json_obj->{'year'} = $row[6];
           $json_obj->{'transmission'} = $row[7];
           $json_obj->{'daily_price'} = $row[8];
           $json_obj->{'weekly_price'} = $row[9];
           $json_obj->{'security_deposit'} = $row[10];
           // get images of all car id
           $images = getCarImages('car_images',$row[0]);
            $image_data = array();

             if(sizeof($images) > 0){
           for ($j=0; $j < sizeof($images) ; $j++) {
              $image_obj = new stdClass();
             $imagerow = $images[$j];
              $image_obj = new stdClass();
              $image_obj->{'image_id'} = $imagerow[0];
              $image_obj->{'car_id'} = $imagerow[1];
              $image_obj->{'image_link'} = $imagerow[2];
              $image_data[] = $image_obj;
           }
         }
           $json_obj->{'images'} = $image_data;
           $data[] = $json_obj;
        }
        $message = 'All users';
        } else {
            $status = 500;
            $message = 'No user found';

        }

    echoResponse(200, array("status"=>200,"message"=>$message,"value"=>$data));
});





$app->get('/getCarsFiltered', function() use ($app) {
    $db = new DbHandler();
    $transmission = $app->request()->get('transmission_id');
    $category = $app->request()->get('category_id');
    $make = $app->request()->get('make_id');
    $startDate = $app->request()->get('start_date');
    $endDate = $app->request()->get('end_date');
    $low_price = $app->request()->get('low_price');
    $high_price = $app->request()->get('high_price');

    $query = "SELECT c.id, c.name, m.name as make, s.name as category, c.model, c.information, c.year, t.type as transmission,cs.daily_price, cs.weekly_price , cs.security_deposit
          FROM cars c
          inner join car_category s on c.car_category_id = s.id
          inner join car_model m on c.make_id = m.id
          inner join transmission t on c.transmission_id = t.id
          inner join car_specifications cs on cs.car_id = c.id
          LEFT JOIN car_booking b ON ( c.id = b.car_id AND b.from_time <= '$startDate' AND b.to_time >= '$endDate' )
          WHERE b.id IS NULL";

          if($category != 0 && $category != NULL){
              $query .= " AND s.id = ".$category ;
          }
          if($transmission != 0 && $transmission != NULL){
              $query .= " AND t.id = ".$transmission;
          }
          if($make != 0 && $make != NULL){
              $query .= " AND m.id = ".$make;
          }

          if($high_price != 0 && $low_price != NULL && $high_price != NULL ){
            $query .= " AND cs.daily_price BETWEEN ". $low_price . " AND " .$high_price;
          }


          // print_r($query);

// Query for selecting the dates with the car
//  SELECT c.id, c.name, m.name as make, s.name as category, c.model, c.information, c.year, t.type as transmission,cs.daily_price, cs.weekly_price , cs.security_deposit
// FROM cars c
// inner join car_category s on c.car_category_id = s.id
// inner join car_model m on c.make_id = m.id
// inner join transmission t on c.transmission_id = t.id
// inner join car_specifications cs on cs.car_id = c.id
// LEFT JOIN car_booking b ON ( c.id = b.car_id AND b.from_time <= '2017-04-12 05:15:16' AND b.to_time >= '2017-04-21 07:17:19' )
//  WHERE b.id IS NULL

    $result = $db->getRecord($query);
    $message = '';
    $status = 0;
      $data= array();
    if ($result != NULL) {
        $status = 200;
        for ($i=0; $i < sizeof($result) ; $i++) {
        $row = $result[$i];
        $json_obj = new stdClass();
           $json_obj->{'id'} = $row[0];
           $json_obj->{'name'} = $row[1];
           $json_obj->{'make'} = $row[2];
           $json_obj->{'category'} = $row[3];
           $json_obj->{'model'} = $row[4];
           $json_obj->{'information'} = $row[5];
           $json_obj->{'year'} = $row[6];
           $json_obj->{'transmission'} = $row[7];
           $json_obj->{'daily_price'} = $row[8];
           $json_obj->{'weekly_price'} = $row[9];
           $json_obj->{'security_deposit'} = $row[10];

           $images = getCarImages('car_images',$row[0]);
            $image_data = array();

             if(sizeof($images) > 0){
           for ($j=0; $j < sizeof($images) ; $j++) {
              $image_obj = new stdClass();
             $imagerow = $images[$j];
              $image_obj = new stdClass();
              $image_obj->{'image_id'} = $imagerow[0];
              $image_obj->{'car_id'} = $imagerow[1];
              $image_obj->{'image_link'} = $imagerow[2];
              $image_data[] = $image_obj;
           }
         }
           $json_obj->{'images'} = $image_data;
           $data[] = $json_obj;
        }
        $message = 'Cars after applying filters';
        } else {
            $status = 500;
            $message = 'No Cars found';

        }
    echoResponse(200, array("status"=>$status ,"message"=>$message,"value"=>$data));
});


$app->get('/getAllCars', function() use ($app) {
    $db = new DbHandler();
    $result = $db->getRecord("select u.id, u.name,m.name as make, s.name as category, u.model, u.information, u.year, t.type as transmission,
    cs.daily_price, cs.weekly_price , cs.security_deposit  from cars u
    inner join car_category s on u.car_category_id = s.id
    inner join car_model m on u.make_id = m.id
    inner join transmission t on u.transmission_id = t.id
    inner join car_specifications cs on cs.car_id = u.id
 ");


    $message = '';
    $status = 0;
    if ($result != NULL) {
        $status = 200;
        $data= array();
        for ($i=0; $i < sizeof($result) ; $i++) {

        $row = $result[$i];
        $json_obj = new stdClass();
           $json_obj->{'id'} = $row[0];
           $json_obj->{'name'} = $row[1];
           $json_obj->{'make'} = $row[2];
           $json_obj->{'category'} = $row[3];
           $json_obj->{'model'} = $row[4];
           $json_obj->{'information'} = $row[5];
           $json_obj->{'year'} = $row[6];
           $json_obj->{'transmission'} = $row[7];
           $json_obj->{'daily_price'} = $row[8];
           $json_obj->{'weekly_price'} = $row[9];
           $json_obj->{'security_deposit'} = $row[10];
           // get images of all car id
           $images = getCarImages('car_images',$row[0]);
            $image_data = array();

             if(sizeof($images) > 0){
           for ($j=0; $j < sizeof($images) ; $j++) {
              $image_obj = new stdClass();
             $imagerow = $images[$j];
              $image_obj = new stdClass();
              $image_obj->{'image_id'} = $imagerow[0];
              $image_obj->{'car_id'} = $imagerow[1];
              $image_obj->{'image_link'} = $imagerow[2];
              $image_data[] = $image_obj;
           }
         }
           $json_obj->{'images'} = $image_data;
           $data[] = $json_obj;
        }
        $message = 'All users';
        } else {
            $status = 500;
            $message = 'No user found';

        }

    echoResponse(200, array("status"=>200,"message"=>$message,"value"=>$data));
});




$app->get('/getNewCarDetails', function() use ($app) {
    $db = new DbHandler();
    $result = $db->getRecord("SELECT * FROM car_model Where 1");
    $status = 0;
    if ($result != NULL) {
        $status = 200;
        $model= array();

        for ($i=0; $i < sizeof($result) ; $i++) {
        $row = $result[$i];
        $json_obj = new stdClass();
           $json_obj->{'id'} = $row[0];
           $json_obj->{'name'} = $row[1];
           $model[] = $json_obj;
        }

        } else {
            $status = 500;
        }
        $result1 = $db->getRecord("SELECT * FROM car_category Where 1");
        if ($result1 != NULL) {
            $status = 200;
            $category= array();
            for ($i=0; $i < sizeof($result1) ; $i++) {
            $row = $result1[$i];
            $json_obj = new stdClass();
               $json_obj->{'id'} = $row[0];
               $json_obj->{'name'} = $row[1];
               $category[] = $json_obj;
            }

            } else {
                $status = 500;
            }

            $result2 = $db->getRecord("SELECT * FROM transmission Where 1");
            if ($result2 != NULL) {
                $status = 200;
                $tranmission= array();
                for ($i=0; $i < sizeof($result2) ; $i++) {
                $row = $result2[$i];
                $json_obj = new stdClass();
                   $json_obj->{'id'} = $row[0];
                   $json_obj->{'type'} = $row[1];
                   $tranmission[] = $json_obj;
                }

                } else {
                    $status = 500;
                }
    echoResponse(200, array("status"=>200,"model"=>$model,"category"=>$category,"transmission"=>$tranmission));
});

$app->get('/getUser', function() use ($app) {
    $userId = $app->request()->get('user_id');
    $db = new DbHandler();
    $result = $db->getOneRecord("SELECT uid, name, email, phone, created,image FROM customers_auth where  uid = ".$userId);
    $data= array();
    $message = '';
    $status = 0;
    if ($result != NULL) {
        $json_obj = new stdClass();
        $status = 200;
        $json_obj->{'name'} = $result['name'];
        $json_obj->{'uid'} = $result['uid'];
        $json_obj->{'email'} = $result['email'];
        $json_obj->{'created'} = $result['created'];
        $json_obj->{'phone'} = $result['phone'];
        $json_obj->{'image'} = $result['image'];
        $data[] = $json_obj;
        $message = 'All users';
        } else {
            $status = 500;
            $message = 'No user found';

        }
    echoResponse(200, array("status"=>200,"message"=>$message,"value"=>$data));
});

$app->get('/getCar', function() use ($app) {
    $carId = $app->request()->get('car_id');
    $db = new DbHandler();
    $result = $db->getOneRecord("select u.id, u.name,  m.name as make, s.name as category, u.model, u.information, u.year, t.type as transmission,
    cs.daily_price,cs.weekly_price , cs.security_deposit,cs.location_city,cs.address,cs.latitude,cs.longitude  from cars u
    inner join car_category s on u.car_category_id = s.id
    inner join car_model m on u.make_id = m.id
    inner join transmission t on u.transmission_id = t.id
    inner join car_specifications cs on cs.car_id = u.id where u.id = ".$carId);
    $data= array();
    $message = '';
    $status = 0;
      $json_obj = new stdClass();
    if ($result != NULL) {
        $status = 200;
        $json_obj->{'id'} = $result['id'];
        $json_obj->{'name'} = $result['name'];
        $json_obj->{'make'} = $result['make'];
        $json_obj->{'category'} = $result['category'];
        $json_obj->{'model'} = $result['model'];
        $json_obj->{'information'} = $result['information'];
        $json_obj->{'year'} = $result['year'];
        $json_obj->{'transmission'} = $result['transmission'];
        $json_obj->{'daily_price'} = floatval($result['daily_price']);
        $json_obj->{'weekly_price'} = floatval($result['weekly_price']);
        $json_obj->{'security_deposit'} = floatval($result['security_deposit']);
        $json_obj->{'city'} = $result['location_city'];
        $json_obj->{'address'} = $result['address'];
        $json_obj->{'latitude'} = $result['latitude'];
        $json_obj->{'longitude'} = $result['longitude'];
        $images = getCarImages('car_images',$result['id']);
        $image_data = array();
        if(sizeof($images) > 0){
        for ($j=0; $j < sizeof($images) ; $j++) {
           $image_obj = new stdClass();
          $imagerow = $images[$j];
           $image_obj = new stdClass();
           $image_obj->{'image_id'} = $imagerow[0];
           $image_obj->{'car_id'} = $imagerow[1];
           $image_obj->{'image_link'} = $imagerow[2];
           $image_data[] = $image_obj;
        }
      }
        $json_obj->{'images'} = $image_data;
        $data[] = $json_obj;
        $message = 'Car Details';
        } else {
            $status = 500;
            $message = 'No car found';

        }
    echoResponse(200, array("status"=>$status,"message"=>$message,"value"=>$json_obj));
});

$app->put('/updateCarSpecs', function() use ($app) {
  $response = array();
  $r = json_decode($app->request->getBody());
    $db = new DbHandler();
  $weekly_price = $r->car->weekly_price;
  $daily_price = $r->car->daily_price;
  $security_deposit = $r->car->security_deposit;
  $car_id = $r->car->car_id;
  $query = "UPDATE car_specifications SET `weekly_price` = $weekly_price ,`daily_price` = $daily_price, `security_deposit` = $security_deposit
  WHERE `car_specifications`.`car_id` = $car_id";
  $result = $db->updateTable($query);

  if ($result != NULL) {
      $response["status"] = "success";
      $response["message"] = "Car update successfully";
      $response["id"] = $result;
      echoResponse(200, $response);
  } else {
      $response["status"] = "error";
      $response["message"] = "Failed to update car. Please try again";
      echoResponse(201, $response);
  }

});

$app->post('/bookCar', function() use ($app) {
    $response = array();
    $r = json_decode($app->request->getBody());

    $db = new DbHandler();
        $table_name = "car_booking";
        $column_names = array('car_id', 'user_id', 'from_time','to_time','chauffeur','pickup_location','delivery_location','collection_location','distance','additional_request','chauffeur_location');
        $result = $db->insertIntoTable($r->book, $column_names, $table_name);
        if ($result != NULL) {
            $response["status"] = "success";
            $response["message"] = "Booking done successfully";
            $response["id"] = $result;
            echoResponse(200, $response);
        } else {
            $response["status"] = "error";
            $response["message"] = "Failed to create a new booking. Please try again";
            echoResponse(201, $response);
        }

});

$app->post('/addNewCar', function() use ($app) {
    $response = array();
    $r = json_decode($app->request->getBody());

    $db = new DbHandler();
    $name = $r->car->name;
    $model = $r->car->model;
    $make = $r->car->make_id;
    $category = $r->car->car_category_id;
    $transmission = $r->car->transmission_id;
    $year = $r->car->year;
    $info = $r->car->information;
        $table_name = "cars";
        $column_names = array('name', 'model', 'make_id', 'car_category_id', 'transmission_id', 'year', 'information');
        $result = $db->insertIntoTable($r->car, $column_names, $table_name);
        if ($result != NULL) {
            $response["status"] = "success";
            $response["message"] = "Car added successfully";
            $response["id"] = $result;
            echoResponse(200, $response);
        } else {
            $response["status"] = "error";
            $response["message"] = "Failed to create car. Please try again";
            echoResponse(201, $response);
        }

});

$app->post('/addCarSpecs', function() use ($app) {
    $response = array();
    $r = json_decode($app->request->getBody());

    $db = new DbHandler();
        $table_name = "car_specifications";
        $column_names = array('daily_price', 'weekly_price', 'security_deposit', 'car_id');
        $result = $db->insertIntoTable($r->car, $column_names, $table_name);
        if ($result != NULL) {
            $response["status"] = "success";
            $response["message"] = "Car added successfully";
            $response["id"] = $result;
            echoResponse(200, $response);
        } else {
            $response["status"] = "error";
            $response["message"] = "Failed to create car. Please try again";
            echoResponse(201, $response);
        }

});
?>
