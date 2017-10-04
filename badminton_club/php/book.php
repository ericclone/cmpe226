<?php
    $playerid = filter_input(INPUT_POST, "playerid");
    $cludid = filter_input(INPUT_POST, "clubid");
    $courtid = filter_input(INPUT_POST, "courtid");
    $begintime = filter_input(INPUT_POST, "courtid");
    $duration = filter_input(INPUT_POST, "duration");

    try {
        // Connect to the database.
        require("connect.php");
        $query = "INSERT INTO PlaysAt (PlayerID, ClubID, CourtID, BeginTime, Duration) values (:playerid, :clubid, :courtid, :begintime, :duration)";

        $ps = $con->prepare($query);
        $ps -> execute(array(':playerid' => $playerid, ':clubid' => $clubid, ":courtid" => $courtid, ":begintime" => $begintime, ":duration" => duration));
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
