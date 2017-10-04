<?php
    $username = filter_input(INPUT_POST, "username");
    $password  = filter_input(INPUT_POST, "password");

    try {
        // Connect to the database.
        require("connect.php");
        $query = "SELECT * FROM Employee WHERE Username = :username AND Password = :password";

        $ps = $con->prepare($query);
        $ps -> execute(array(':username' => $username, ':password' => $password));
        $rows = $ps->fetchAll(PDO::FETCH_ASSOC);
        if (count($rows) == 1) {
            $result = $rows[0];
            $result["type"] = "employee";
            echo json_encode($result);
        }
        else {
            $query = "SELECT * FROM Player WHERE Username = :username AND Password = :password";

            $ps = $con->prepare($query);
            $ps -> execute(array(':username' => $username, ':password' => $password));
            $rows = $ps->fetchAll(PDO::FETCH_ASSOC);
            if (count($rows) == 1) {
                $result = $rows[0];
                $result["type"] = "player";
                echo json_encode($result);
            }
            else {
              $result = ["error" => "Invalid username or password"];
              $result["count"] = $ps->rowCount();
              $result["username"] = $username;
              $result["password"] = $password;
              echo json_encode($result);
            }
        }
    }
    catch(PDOException $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
?>
