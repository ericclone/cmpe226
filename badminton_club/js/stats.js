
$(document).ready(function() {


  var columns1, columns2, columns3;
  var filter;

  filterLocation();

  $("#month").change(function() {

    switch ($(this).val()) {
      case "1":
      case "2":
      case "3":
        $("#quarter").val(1).change();
        break;
      case "4":
      case "5":
      case "6":
        $("#quarter").val(2).change();
        break;
      case "7":
      case "8":
      case "9":
        $("#quarter").val(3).change();
        break;
      case "10":
      case "11":
      case "12":
        $("#quarter").val(4);
        break;
    }

  });

  $( ".radio-filter" ).change(function() {
    $('#table1').dataTable().fnClearTable();
    $('#table2').dataTable().fnClearTable();
    $('#table3').dataTable().fnClearTable();

    switch($(this).val()) {
      case 'location' :
      filterLocation();
      break;
      case 'time' :
      filterTime();
      break;
    }
  });

  function filterLocation() {
    // console.log("A1");
    filter = "location";
    $(".time-input").hide();
    $(".location-input").show();
    $("#table3Div").show();

    $(".table1-column1").html("Year");
    $(".table2-column1").html("Year");
    $(".table2-column2").html("Quarter");

    columns1 = [{ "data": "year" }, { "data": "sum" }];
    columns2 = [{ "data": "year" }, { "data": "quarter" }, { "data": "sum" }];
    columns3 = [{ "data": "year" }, { "data": "quarter" }, { "data": "month" }, { "data": "sum" }];

    $("#table1-title").html("By Year");
    $("#table2-title").html("By Quarter");
    $("#table3-title").html("By Month");

    destroyTables();
    initializeTables();
  }

  function filterTime() {
    // console.log("B1");

    filter = "time";
    $(".time-input").show();
    $(".location-input").hide();
    $("#table3Div").hide();

    $(".table1-column1").html("State");
    $(".table2-column1").html("State");
    $(".table2-column2").html("City");

    columns1 = [{ "data": "state" }, { "data": "sum" }];
    columns2 = [{ "data": "state" }, { "data": "city" }, { "data": "sum" }];

    $("#table1-title").html("By State");
    $("#table2-title").html("By City");
    $("#table3-title").html("");


    destroyTables();
    initializeTables();
  }


  var data2, data3;
  var request1,  request2, request3;

  var $form = $("#form1");
  var serializedData;


  $("#form1").submit(function(event){
    event.preventDefault();

    // var filter = $('.radio-filter:checked').val();
    // if (filter == "location") {
    //   $("#year").val(true);
    // } else if (filter == "time") {
    //
    // }

    requestMainData();
  });


  function requestMainData() {
    // Abort any pending request
    if (request1) {
      request1.abort();
    }
    // // setup some local variables
    // var $form = $(this);

    // Let's select and cache all the fields
    var $inputs = $form.find("input, select, button, textarea");

    // Serialize the data in the form
    serializedData = $form.serialize();

    // Let's disable the inputs for the duration of the Ajax request.
    // Note: we disable elements AFTER the form data has been serialized.
    // Disabled form elements will not be serialized.
    $inputs.prop("disabled", true);

    // Fire off the request to /form.php
    request1 = $.ajax({
      url: "php/analyzeplay2.php",
      type: "post",
      data: serializedData
    });

    // Callback handler that will be called on success
    request1.done(function (response, textStatus, jqXHR){
      // Log a message to the console
      // console.log("Hooray, it worked!");
      // console.log(response);
      var obj = $.parseJSON(response);
      var newData = obj;
      // console.log(newData);
      populateTable1(newData);

      // Start Second Request
      secondRequest();
    });

    // Callback handler that will be called on failure
    request1.fail(function (jqXHR, textStatus, errorThrown){
      // Log the error to the console
      console.error(
        "The following error occurred: "+
        textStatus, errorThrown
      );
    });

    // Callback handler that will be called regardless
    // if the request failed or succeeded
    request1.always(function () {
      // Reenable the inputs
      $inputs.prop("disabled", false);
    });
  }


  function secondRequest() {
    if (request2) {
      request2.abort();
    }

    request2 = $.ajax({
      url: "php/query22.php",
      type: "post",
      data: serializedData
    });

    request2.done(function (response, textStatus, jqXHR){
      // console.log(response);
      data2 = $.parseJSON(response);
      if (filter == "location") {
        thirdRequest();
      }
    });

    request2.fail(function (jqXHR, textStatus, errorThrown){
      // Log the error to the console
      console.error(
        "The following error occurred: "+
        textStatus, errorThrown
      );
    });
  }

  function thirdRequest() {
    if (request3) {
      request3.abort();
    }

    request3 = $.ajax({
      url: "php/query3.php",
      type: "post",
      data: serializedData
    });

    request3.done(function (response, textStatus, jqXHR){
      // console.log(response);
      data3 = $.parseJSON(response);
      // console.log(data3);
    });

    request3.fail(function (jqXHR, textStatus, errorThrown){
      // Log the error to the console
      console.error(
        "The following error occurred: "+
        textStatus, errorThrown
      );
    });
  }

  function initializeTables() {

    var order;
    if (filter == "time") {
      order = [[0, 'asc']];
    } else {
      order = [[0, 'dsc']];
    }


    $('#table1').DataTable( {
      "bDestroy": true,
      "keys": true,
      // "ajax": "data/objects.txt",
      "data": [],
      "columns": columns1,
      "order": order
    } );

    $('#table2').DataTable( {
      "bDestroy": true,
      "keys": true,
      "data": [],
      "columns": columns2,
      "order": [[1, 'asc']]
    } );


    $('#table3').DataTable( {
      "keys": true,
      "data": [],
      "columns": columns3,
      "order": [[1, 'asc']]
    } );

  }

  function destroyTables() {
    $("#table1").dataTable().fnDestroy();
    $("#table2").dataTable().fnDestroy();
    $("#table3").dataTable().fnDestroy();
  }


  $('#table1').on( 'key-focus', function (e, datatable, cell) {
    // console.log(cell.data());
    var rowData = datatable.row( cell.index().row ).data();

    var filteredData;
    if (filter == "location") {
      filteredData =  matchYear(rowData.year);
    } else if (filter == "time") {
      filteredData =  matchState(rowData.state);
    }
    populateTable2(filteredData);
    $('#table3').dataTable().fnClearTable();

  });

  $('#table2').on( 'key-focus', function (e, datatable, cell) {
    // console.log(cell.data());

    if (filter == "location") {
      var rowData = datatable.row( cell.index().row ).data();

      var filteredData =  matchQuarter(rowData.quarter, rowData.year);
      // console.log(filteredData);
      populateTable3(filteredData);
    }

  });


  var chartData = [];

  function populateTable1(data) {
    $('#table1').dataTable().fnClearTable();
    if (data[0]) {
      $('#table1').dataTable().fnAddData(data);
    }
  }

  function populateTable2(data) {
    $('#table2').dataTable().fnClearTable();
    if (data[0]) {
      $('#table2').dataTable().fnAddData(data);
    }  }

  function populateTable3(data) {
    $('#table3').dataTable().fnClearTable();
    if (data[0]) {
      $('#table3').dataTable().fnAddData(data);
    }  }

  function matchYear(year) {
    // console.log(year);
    return data2.filter(function (obj) {
      return obj.year == year;
    });
  }

  function matchQuarter(quarter, year) {
    // console.log(year);
    return data3.filter(function (obj) {
      return obj.quarter == quarter && obj.year == year;
    });
  }

  function matchState(state) {
    return data2.filter(function (obj) {
      return obj.state == state;
    });
  }

} );
