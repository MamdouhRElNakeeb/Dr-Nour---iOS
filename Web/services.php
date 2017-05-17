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
$exercises = $access->getTableContent("services");
$a = array();
$b = array();
if ($exercises != false){
    while ($row = mysqli_fetch_array($exercises)) {
        $b["id"] = $row["id"];
        $b["title"] = $row["title"];
        $b["content"] = $row["content"];
        $b["advantages"] = $row["advantages"];
        $b["video"] = $row["video"];
        array_push($a, $b);
    }
    echo json_encode($a, JSON_UNESCAPED_UNICODE);
}

?>