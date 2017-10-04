<?php
    $username = filter_input(INPUT_POST, "username");
    $password  = filter_input(INPUT_POST, "password");
    $name = filter_input(INPUT_POST, "name");
    $street  = filter_input(INPUT_POST, "street");
    $city  = filter_input(INPUT_POST, "city");
    $state  = filter_input(INPUT_POST, "state");
    $zipcode  = filter_input(INPUT_POST, "zipcode");


    function combine_condition($condition, $new_condition) {
        if (strlen($condition) > 0) {
            return $condition . " AND " . $new_condition;
        } else {
            return " WHERE " . $new_condition;
        }
    }

    try {
        // Connect to the database.
        $con = new PDO("mysql:host=localhost;dbname=suchwow",
                       "suchwow", "sesame");
        $con->setAttribute(PDO::ATTR_ERRMODE,
                           PDO::ERRMODE_EXCEPTION);
        // Constrain the query if we got first and last names.
        $query = "INSERT INTO Player (Username, Password, Name, Street, City, State, ZipCode) VALUES (:username, :password, :name, :street, :city, :state, :zipcode)";

        $ps = $con->prepare($query);
        $ps -> execute(array(':username' => $username, ':password' => $password, ":name" => $name, ":street" => $street, ":city" => $city, ":state"=>$state, ":zipcode"=>$zipcode));
        if ($ps->rowCount() == 1) {
            echo json_encode(["result"=>"sucess"]);
        } else {
            echo json_encode(["result"=>"failure"]);
        }
    }
    catch(PDOException $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
?>
