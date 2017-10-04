$(document).ready(function () {


  if ($.cookie('user')){
    var user = $.parseJSON($.cookie('user'));
  }
  if (user) {

    checkUser(user);

    loggedin();

  } else {
    $("#book-tab").hide();
    $("#stats-tab").hide();
    $("#profile-tab").hide();

    loggedout();

  }

  function loggedin() {
    $(".user-button").hide();
    $("#logout-button").show();
  }

  function loggedout() {
    $(".user-button").show();
    $("#logout-button").hide();
  }

  function checkUser(user) {
    var userType = $.parseJSON($.cookie('user')).type;

    console.log(userType);

    if (userType == "player") {

      $("#book-tab").hide();
      $("#stats-tab").hide();
      $("#profile-tab").show();
      console.log(user);

      var currentUser = $.parseJSON($.cookie('user'));

      getUserActivity(currentUser.PlayerID);

      $(".profile-name").html(currentUser.Name);
      $("#profile-membership").html(currentUser.MembershipType);
      $("#profile-points").html(currentUser.Points);
      $("#profile-hours").html(currentUser.Hours);

      $("#profile-username").html(currentUser.Username);

      $("#profile-street").html(currentUser.Street);
      $("#profile-city").html(currentUser.City);
      $("#profile-zipcode").html(currentUser.ZipCode);
      $("#profile-state").html(currentUser.State);


    } else if (userType == "employee") {
      $("#book-tab").show();
      $("#stats-tab").show();
      $("#profile-tab").hide();
    }
  }


  $(".user-form input").attr('readonly', true);

  $("#signup-button").click(function (event) {
    event.preventDefault();
    $.ajax({
      url: 'php/register.php',
      type: 'POST',
      data: $('#signup-form').serialize(),
      success: function(response) {
        console.log("success");
        var obj = $.parseJSON(response);
        console.log(obj);
      },
      error: function(error) {
        console.log("fail");
        console.log(error);
      }
    });

  });

  $("#login-button").click(function (event) {
    event.preventDefault();
    $.ajax({
      url: 'php/login.php',
      type: 'POST',
      data: $('#login-form').serialize(),
      success: function(response) {
        console.log("success");
        var user = $.parseJSON(response);
        console.log(user);

        $.cookie('user', response);
        loggedin();
        checkUser(response);

        $("#loginModal").modal('hide');

      },
      error: function(error) {
        console.log("fail");
        console.log(error);
      }
    });
  });

  $("#logout-button").click(function (event) {
    $.removeCookie('user');
    window.location.href = "http://localhost/badminton_club/index.php";
    loggedout();

  });

  $("#book-button").click(function (event) {
    event.preventDefault();
    $.ajax({
      url: 'php/book.php',
      type: 'POST',
      data: $('#book-form').serialize(),
      success: function(response) {
        console.log("success");
        console.log(response);
      },
      error: function(error) {
        console.log("fail");
        console.log(error);
      }
    });
  });


function getUserActivity(id) {
  $.ajax({
    url: 'php/playhistory.php',
    type: 'POST',
    data: {userid: id},
    success: function(response) {
      console.log("success");
      var obj = $.parseJSON(response);
      console.log(obj);

      $('#tableActivity').DataTable( {
        "bDestroy": true,
        "data": obj,
        "columns": [{ "data": "Street" }, { "data": "City" }, { "data": "State" }, { "data": "CourtID" }, { "data": "BeginTime" }, { "data": "Duration" }],
        "order": [[1, 'asc']]
      } );

    },
    error: function(error) {
      console.log("fail");
      console.log(error);
    }
  });

}

});
