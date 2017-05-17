<?php
/**
 * Created by PhpStorm.
 * User: Mamdouh El Nakeeb
 * Date: 4/13/17
 * Time: 3:09 PM
 */

$dir = "gallery/";

$return_array = array();


// Open a directory, and read its contents
if ($handle = opendir($dir)) {

    while (false !== ($entry = readdir($handle))) {

        if ($entry != "." && $entry != ".." && $entry != '.DS_Store') {

            array_push($return_array, $entry);
        }
    }

    closedir($handle);
}

echo json_encode($return_array);

?>