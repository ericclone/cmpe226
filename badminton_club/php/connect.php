<?php
    $con = new PDO("mysql:host=localhost;dbname=suchwow",
                    "suchwow", "sesame");
    $con->setAttribute(PDO::ATTR_ERRMODE,
                        PDO::ERRMODE_EXCEPTION);
?>