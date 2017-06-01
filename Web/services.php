<?php
/**
 * Created by PhpStorm.
 * User: Mamdouh El Nakeeb
 * Date: 4/13/17
 * Time: 9:51 AM
 */

require ("secure/access.php");
require("secure/DrNourConn.php");

$access = new access(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$access->connect();
$services = $access->getTableContent("Services");
$a = array();
$b = array();
if ($services != false){
    while ($row = mysqli_fetch_array($services)) {
        $b["id"] = $row["id"];
        $b["title"] = $row["title"];
        $b["content"] = $row["content"];
        $b["advantages"] = $row["advantages"];
        $b["image"] = $row["image"];
        $b["video"] = $row["video"];
        array_push($a, $b);
    }
    echo json_encode($a, JSON_UNESCAPED_UNICODE);
}

?>