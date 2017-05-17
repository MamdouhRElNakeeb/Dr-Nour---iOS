<?php
/**
 * Created by PhpStorm.
 * User: Mamdouh El Nakeeb
 * Date: 4/13/17
 * Time: 3:30 PM
 */


class access{
    //connection global variables
    var $host = null;
    var $username = null;
    var $dpass = null;
    var $dname = null;
    var $conn = null;
    var $result = null;

    public function __construct($dbhost, $dbuser, $dbpass, $dbname){

        $this->host = $dbhost;
        $this->username = $dbuser;
        $this->dpass = $dbpass;
        $this->dname = $dbname;
    }

    public function connect(){
        $this->conn = new mysqli($this->host, $this->username, $this->dpass, $this->dname);
        if (mysqli_connect_errno()) {
            echo "Failed to connect to Database: " . mysqli_connect_error();
        }
        $this->conn->set_charset("utf8");
    }

    public function disconnect(){
        if($this->conn != null){
            $this->conn->close();
        }
    }

    public function getTableContent($tableName){

        $sql = "SELECT * FROM $tableName";
        $result = $this->conn->query($sql);
        return $result;

    }

    // insert appointment into database
    public function makeAppointment($firstName, $lastName, $gender, $service, $date, $email, $mobile, $message){

        $sql = "INSERT INTO Appointment SET firstName=?, lastName=?, gender=?, service=?, date=?, email=?, mobile=?, message=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 8 parameters of type string to be placed in $sql command
        $statement->bind_param("ssssssss", $firstName, $lastName, $gender, $service, $date, $email, $mobile, $message);
        $returnValue = $statement->execute();
        return $returnValue;

    }

    // insert service into database
    public function insertService($title, $content, $advantages, $video){

        $sql = "INSERT INTO Services SET title=?, content=?, advantages=?, video=?";
        $statement = $this->conn->prepare($sql);
        if(!$statement){
            throw new Exception($statement->error);
        }
        // bind 4 parameters of type string to be placed in $sql command
        $statement->bind_param("ssss", $title, $content, $advantages, $video);
        $returnValue = $statement->execute();
        return $returnValue;

    }
}

?>