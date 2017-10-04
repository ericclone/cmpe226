<?php
    $primary_filter = filter_input(INPUT_POST, "filter");
    $year  = filter_input(INPUT_POST, "year");
    $quarter  = filter_input(INPUT_POST, "quarter");
    $month = filter_input(INPUT_POST, "month");
    $state  = filter_input(INPUT_POST, "state");
    $city  = filter_input(INPUT_POST, "city");
    $zipcode  = filter_input(INPUT_POST, "zipcode");

    $locations = ["State", "City", "ClubID"];
    $time = ["Year", "Quarter", "Month"];

    function create_conditions($keys) {
        $length = count($keys);
        $columns = "";
        $cond_arr = [];
        $conditions = "";
        for ($i = 0; $i < $length; ++$i) {
            $key = $keys[$i];
            $val = filter_input(INPUT_POST, $key);
            // echo $key." : ".$val."<br/>\n";
            if ($val != null && $val != "") {
                $cond_arr[":".$key] = $val;
                // $cond_arr[] = $val;
                $conditions = $conditions." AND ".$key."=:".$key;
            } 
        }

        return ["arr" => $cond_arr, "str" => $conditions];
    }

    try {
        // Connect to the database.
        $cond_arr = [];
        $conditions = "";
        if ($primary_filter == "location") {
            $result_array = create_conditions($locations);
            $cond_arr = $result_array["arr"];
            $conditions = $result_array["str"];

            $query = "SELECT year, sum(Duration) sum
                    FROM ActivityFact, Calendar, Court
                    WHERE ActivityFact.CalendarKey = Calendar.CalendarKey AND ActivityFact.CourtKey = Court.CourtKey".
                    $conditions .
                    " GROUP BY Year; ";
        }
        else if ($primary_filter == "time") {
            $result_array = create_conditions($time);
            $cond_arr = $result_array["arr"];
            $conditions = $result_array["str"];


            $query = "SELECT state, sum(Duration) sum
                    FROM ActivityFact, Calendar, Court
                    WHERE ActivityFact.CalendarKey = Calendar.CalendarKey AND ActivityFact.CourtKey = Court.CourtKey".
                    $conditions .
                    " GROUP BY State; ";
        }
        // Constrain the query if we got first and last names.
        $con = new PDO("mysql:host=localhost;dbname=suchwow_analytical",
                       "suchwow", "sesame");
        $con->setAttribute(PDO::ATTR_ERRMODE,
                           PDO::ERRMODE_EXCEPTION);
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
