
$(document).ready(function() {

  var columns12, columns22, columns32;
  var filter2;


  filterLocation();

  $("#month2").change(function() {

    switch ($(this).val()) {
      case "1":
      case "2":
      case "3":
        $("#quarter2").val(1).change();
        break;
      case "4":
      case "5":
      case "6":
        $("#quarter2").val(2).change();
        break;
      case "7":
      case "8":
      case "9":
        $("#quarter2").val(3).change();
        break;
      case "10":
      case "11":
      case "12":
        $("#quarter2").val(4);
        break;
    }

  });

  $( ".radio-filter2" ).change(function() {
    $('#table12').dataTable().fnClearTable();
    $('#table22').dataTable().fnClearTable();
    $('#table32').dataTable().fnClearTable();

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
    // console.log("A2");
    filter2 = "location";

    $(".location-input2").show();
    $(".time-input2").hide();
    $("#table32Div").show();

    $(".table12-column1").html("Year");
    $(".table12-column2").html("Quarter");
    $(".table12-column3").html("Month");
    $(".table12-column4").html("Total Hours Played");

    $(".table22-column1").html("Year");
    $(".table22-column2").html("Quarter");
    $(".table22-column3").html("Total Hours Played");


    columns12 = [{ "data": "year" }, { "data": "quarter" }, { "data": "month" }, { "data": "sum" }];
    columns22 = [{ "data": "year" }, { "data": "quarter" }, { "data": "sum" }];
    columns32 = [{ "data": "year" }, { "data": "sum" }];

    $("#table12-title").html("By Year");
    $("#table22-title").html("By Quarter");
    $("#table32-title").html("By Month");

    destroyTables();
    initializeTables();
  }

  function filterTime() {
    // console.log("B2");
    filter2 = "time";

    $(".time-input2").show();
    $(".location-input2").hide();
    $("#table32Div").hide();

    $(".table12-column1").html("State");
    $(".table12-column2").html("City");
    $(".table12-column3").html("Total Hours Played");
    $(".table12-column4").html(" ");


    $(".table22-column1").html("State");
    $(".table22-column2").html("Total Hours Played");
    $(".table22-column3").html(" ");

    columns12 = [{ "data": "state" }, { "data": "city" }, { "data": "sum" }];
    columns22 = [{ "data": "state" }, { "data": "sum" }];

    $("#table12-title").html("By State");
    $("#table22-title").html("By City");
    $("#table32-title").html("");

    destroyTables();
    initializeTables();
  }


  var data22, data32;
  var request1,  request2, request3;

  var $form2 = $("#form12");
  var serializedData;


  $("#form12").submit(function(event){
    event.preventDefault();

    requestMainData();
  });


  function requestMainData() {

    var phpFile;
    if (filter2 == "location") {
      phpFile = "php/query3.php";
    } else {
      phpFile = "php/query22.php";
    }

    if (request1) {
      request1.abort();
    }

    var $inputs = $form2.find("input, select, button, textarea");
    serializedData = $form2.serialize();

    $inputs.prop("disabled", true);

    request1 = $.ajax({
      url: phpFile,
      type: "post",
      data: serializedData
    });

    request1.done(function (response, textStatus, jqXHR){

      // console.log(response);
      var obj = $.parseJSON(response);
      var newData = obj;
      // console.log(newData);
      populateTable1(newData);

      // Start Second Request
      secondRequest();
    });

    request1.fail(function (jqXHR, textStatus, errorThrown){
      console.error(
        "The following error occurred: "+
        textStatus, errorThrown
      );
    });


    request1.always(function () {
      // Reenable the inputs
      $inputs.prop("disabled", false);
    });
  }


  function secondRequest() {

    var phpFile;
    if (filter2 == "location") {
      phpFile = "php/query22.php";
    } else {
      phpFile = "php/analyzeplay2.php";
    }

    if (request2) {
      request2.abort();
    }

    request2 = $.ajax({
      url: phpFile,
      type: "post",
      data: serializedData
    });

    request2.done(function (response, textStatus, jqXHR){
      // console.log(response);
      data22 = $.parseJSON(response);
      if (filter2 == "location") {
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
      url: "php/analyzeplay2.php",
      type: "post",
      data: serializedData
    });

    request3.done(function (response, textStatus, jqXHR){
      // console.log(response);
      data32 = $.parseJSON(response);
      // console.log(data32);
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

    var order, columnDefs1, columnDefs2;
    if (filter2 == "time") {
      order = [[0, 'asc']];
      columnDefs1 = [
        { "width": "25%", "targets": 0 },
        { "width": "25%", "targets": 1 },
        { "width": "25%", "targets": 2 },
      ];
      columnDefs2 = [
        { "width": "25%", "targets": 0 },
        { "width": "25%", "targets": 1 }
      ];
    } else {
      order = [[0, 'dsc']];
      columnDefs1 = [
        { "width": "25%", "targets": 0 },
        { "width": "25%", "targets": 1 },
        { "width": "25%", "targets": 2 },
        { "width": "25%", "targets": 3 }
      ];
      columnDefs2 = [
        { "width": "25%", "targets": 0 },
        { "width": "25%", "targets": 1 },
        { "width": "25%", "targets": 2 }
      ];

    }

    $('#table12').DataTable( {
      "bDestroy": true,
      "keys": true,
      "data": [],
      "columns": columns12,
      "order": order,
      "columnDefs": columnDefs1
    } );

    $('#table22').DataTable( {
      "bDestroy": true,
      "keys": true,
      "data": [],
      "columns": columns22,
      "order": [[1, 'asc']],
      "columnDefs": columnDefs2
    } );

    $('#table32').DataTable( {
      "keys": true,
      "data": [],
      "columns": columns32,
      "order": [[1, 'asc']]
    } );

  }

  function destroyTables() {
    $("#table12").dataTable().fnDestroy();
    $("#table22").dataTable().fnDestroy();
    $("#table32").dataTable().fnDestroy();
  }


  $('#table12').on( 'key-focus', function (e, datatable, cell) {
    // console.log(cell.data());
    var rowData = datatable.row( cell.index().row ).data();

    var filteredData, filteredData2;
    if (filter2 == "location") {
      filteredData =  matchYear(data22, rowData.year);
      filteredData2 = matchYear(data32, rowData.year);
    } else if (filter2 == "time") {
      filteredData =  matchState(rowData.state);
    }
    populateTable2(filteredData);
    populateTable3(filteredData2);


  });

  $('#table22').on( 'key-focus', function (e, datatable, cell) {
    if (filter2 == "location") {
      var rowData = datatable.row( cell.index().row ).data();
      var filteredData =  matchYear(data32, rowData.year);
      populateTable3(filteredData);
    }
  });


  function populateTable1(data) {
    $('#table12').dataTable().fnClearTable();
    if (data[0]) {
      $('#table12').dataTable().fnAddData(data);
    }
  }

  function populateTable2(data) {
    $('#table22').dataTable().fnClearTable();
    if (data[0]) {
      $('#table22').dataTable().fnAddData(data);
    }  }

  function populateTable3(data) {
    $('#table32').dataTable().fnClearTable();
    if (data) {
      $('#table32').dataTable().fnAddData(data);
    }  }

  function matchYear(data, year) {
    // console.log(year);
    return data.filter(function (obj) {
      return obj.year == year;
    });
  }

  function matchQuarter(quarter, year) {
    // console.log(year);
    return data32.filter(function (obj) {
      return obj.quarter == quarter && obj.year == year;
    });
  }

  function matchState(state) {
    return data22.filter(function (obj) {
      return obj.state == state;
    });
  }

} );
