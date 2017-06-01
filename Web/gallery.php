<?php
/**
 * Created by PhpStorm.
 * User: Mamdouh El Nakeeb
 * Date: 4/13/17
 * Time: 3:09 PM
 */

require ("secure/access.php");
require("secure/DrNourConn.php");

$access = new access(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$access->connect();
$services = $access->getTableContent("Gallery");
$a = array();
$b = array();
if ($services != false){
    while ($row = mysqli_fetch_array($services)) {
        $b["name"] = $row["name"];
        $b["description"] = $row["description"];
        array_push($a, $b);
    }
    echo json_encode($a, JSON_UNESCAPED_UNICODE);
}

?>