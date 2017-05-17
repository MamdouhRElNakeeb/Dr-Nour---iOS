<?php
/**
 * Created by PhpStorm.
 * User: Mamdouh El Nakeeb
 * Date: 4/13/17
 * Time: 4:07 PM
 */

$service = htmlentities($_REQUEST["service"]);
$firstName = htmlentities($_REQUEST["firstName"]);
$lastName = htmlentities($_REQUEST["lastName"]);
$date = htmlentities($_REQUEST["date"]);
$gender = htmlentities($_REQUEST["gender"]);
$email = htmlentities($_REQUEST["email"]);
$mobile = htmlentities($_REQUEST["mobile"]);
$message = htmlentities($_REQUEST["message"]);


if (empty($service) || empty($firstName) || empty($lastName) || empty($date) || empty($gender) || empty($email) || empty($mobile) || empty($message)){

    $returnArray["status"] = "400";
    $returnArray["message"] = "Missing Fields!";
    echo json_encode($returnArray);
    return;
}

require ("secure/access.php");
require ("secure/DrNourConn.php");

$access = new access(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$access->connect();

$result = $access->makeAppointment($firstName, $lastName, $gender, $service, $date, $email ,$mobile, $message);

if ($result){
    $returnArray["error"] = FALSE;
    echo json_encode($returnArray);
}
else{
    $returnArray["error"] = TRUE;
    echo json_encode($returnArray);
}

$access->disconnect();

?>

