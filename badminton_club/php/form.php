<?php


  $name = $_POST['name'];

  // print_r($_POST);
  // echo json_encode(array('returned_val' => 'yoho'));

  $ar = array('name' => 'yoho', 'position' => 'orange', 'office' => 'banana', 'salary' => 'strawberry');
  echo json_encode($ar);

?>
