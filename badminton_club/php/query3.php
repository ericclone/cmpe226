<?php
    $primary_filter = filter_input(INPUT_POST, "filter");
    $year  = filter_input(INPUT_POST, "year");
    $quarter  = filter_input(INPUT_POST, "quarter");
    $month = filter_input(INPUT_POST, "month");
    $state  = filter_input(INPUT_POST, "state");
    $city  = filter_input(INPUT_POST, "city");
    $zipcode  = filter_input(INPUT_POST, "zipcode");

    $locations = ["State", "City", "ClubID"];
    $time = ["year", "quarter", "month", "day"];

    function combine_condition($condition, $new_condition) {
        if (strlen($condition) > 0) {
            return $condition . " AND " . $new_condition;
        } else {
            return " WHERE " . $new_condition;
        }
    }

    try {
        // Connect to the database.
        $con = new PDO("mysql:host=localhost;dbname=suchwow_analytical",
                       "suchwow", "sesame");
        $con->setAttribute(PDO::ATTR_ERRMODE,
                           PDO::ERRMODE_EXCEPTION);
        if ($primary_filter == "location") {
            $length = count($locations);
            $columns = "";
            $cond_arr = [];
            $conditions = "";
            for ($i = 0; $i < $length; ++$i) {
                $key = $locations[$i];
                $val = filter_input(INPUT_POST, $key);
                if ($val != null && $val != "") {
                    $cond_arr[":".$key] = $val;
                    // $cond_arr[] = $val;
                    $conditions = $conditions." AND ".$key."=:".$key;
                } 
            }

            $query = "SELECT Calendar.year, Calendar.quarter, Calendar.month, sum(Duration) sum
                    FROM ActivityFact, Calendar, Court
                    WHERE ActivityFact.CalendarKey = Calendar.CalendarKey AND ActivityFact.CourtKey = Court.CourtKey".
                    $conditions .
                    " GROUP BY Calendar.year, Calendar.quarter, Calendar.month; ";
        }
        // Constrain the query if we got first and last names.

        $ps = $con->prepare($query);
        $ps -> execute($cond_arr);
        $data = $ps->fetchAll(PDO::FETCH_ASSOC);
        $output = [];
        foreach($data as $row) {
            $output[] = $row;
        }
        echo json_encode($output);
    }
    catch(PDOException $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
?>
