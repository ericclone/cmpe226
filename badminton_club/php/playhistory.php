<?php
    $playerid = filter_input(INPUT_POST, "userid");

    try {
        // Connect to the database.
        require("connect.php");
        $query = "SELECT * FROM PlaysAt NATURAL JOIN Club WHERE PlayerID = :playerid";

        $ps = $con->prepare($query);
        $ps -> execute(array(':playerid' => $playerid));
        $rows = $ps->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($rows);
    }
    catch(PDOException $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
?>
