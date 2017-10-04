<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SuchWow Badminton Club</title>
  <link rel="shortcut icon" href="images/logo.jpg">


  <!-- Bootstrap Core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.css"/>
  <link rel="stylesheet" href="https://cdn.datatables.net/keytable/2.1.3/css/keyTable.bootstrap.min.css"/>

  <!-- Custom CSS -->
  <link href="css/half-slider.css" rel="stylesheet">
  <link href="css/round-about.css" rel="stylesheet">
  <link href="css/jumbotron.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">



  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.php"><img class="logo" src="images/logo.jpg">SuchWow Badminton Club</a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li>
            <a href="index.php#about">About</a>
          </li>
          <li id="profile-tab">
            <a href="profile.php">My Profile</a>
          </li>
          <li id="book-tab">
            <a href="book.php">Booking</a>
          </li>
          <li id="stats-tab">
            <a href="stats.php">Statistics</a>
          </li>
        </ul>


        <form class="navbar-form navbar-right">

          <button type="button" class="btn btn-primary user-button" data-toggle="modal" data-target="#loginModal">
            Login
          </button>
          <button type="button" class="btn btn-warning user-button" data-toggle="modal" data-target="#registerModal">
            Register
          </button>
          <button type="button" id="logout-button" class="btn btn-danger" style="disply:none;">
            Logout
          </button>

        </form>

      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
  </nav>


  <!-- Login Modal -->
  <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">Login</h4>
        </div>
        <div class="modal-body">
          <form id="login-form">
            <div class="form-group">
              <input type="text" placeholder="Username" name="username" class="form-control" required>
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" name="password" class="form-control" required>
            </div>
            <button type="submit" id="login-button" class="btn btn-success btn-block">Sign in</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Register Modal -->
  <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">Register</h4>
        </div>
        <div class="modal-body">
          <form id="signup-form">

            <div class="form-group"> <!-- Full Name -->
              <label for="username_id" class="control-label">Username</label>
              <input type="text" class="form-control" id="username_id" name="username" placeholder="abc">
            </div>

            <div class="form-group"> <!-- Full Name -->
              <label for="password_id" class="control-label">Password</label>
              <input type="password" class="form-control" id="password_id" name="password" placeholder="pass">
            </div>


            <div class="form-group"> <!-- Full Name -->
              <label for="full_name_id" class="control-label">Full Name</label>
              <input type="text" class="form-control" id="full_name_id" name="name" placeholder="John Deer">
            </div>

            <div class="form-group"> <!-- Street 1 -->
              <label for="street1_id" class="control-label">Street Address</label>
              <input type="text" class="form-control" id="street_id" name="street" placeholder="Street address, P.O. box, company name, c/o">
            </div>

            <div class="form-group"> <!-- City-->
              <label for="city_id" class="control-label">City</label>
              <input type="text" class="form-control" id="city_id" name="city" placeholder="Smallville">
            </div>

            <div class="form-group"> <!-- State Button -->
              <label for="state_id" class="control-label">State</label>
              <select class="form-control" id="state_id" name="state">
                <option value="AL">Alabama</option>
                <option value="AK">Alaska</option>
                <option value="AZ">Arizona</option>
                <option value="AR">Arkansas</option>
                <option value="CA">California</option>
                <option value="CO">Colorado</option>
                <option value="CT">Connecticut</option>
                <option value="DE">Delaware</option>
                <option value="DC">District Of Columbia</option>
                <option value="FL">Florida</option>
                <option value="GA">Georgia</option>
                <option value="HI">Hawaii</option>
                <option value="ID">Idaho</option>
                <option value="IL">Illinois</option>
                <option value="IN">Indiana</option>
                <option value="IA">Iowa</option>
                <option value="KS">Kansas</option>
                <option value="KY">Kentucky</option>
                <option value="LA">Louisiana</option>
                <option value="ME">Maine</option>
                <option value="MD">Maryland</option>
                <option value="MA">Massachusetts</option>
                <option value="MI">Michigan</option>
                <option value="MN">Minnesota</option>
                <option value="MS">Mississippi</option>
                <option value="MO">Missouri</option>
                <option value="MT">Montana</option>
                <option value="NE">Nebraska</option>
                <option value="NV">Nevada</option>
                <option value="NH">New Hampshire</option>
                <option value="NJ">New Jersey</option>
                <option value="NM">New Mexico</option>
                <option value="NY">New York</option>
                <option value="NC">North Carolina</option>
                <option value="ND">North Dakota</option>
                <option value="OH">Ohio</option>
                <option value="OK">Oklahoma</option>
                <option value="OR">Oregon</option>
                <option value="PA">Pennsylvania</option>
                <option value="RI">Rhode Island</option>
                <option value="SC">South Carolina</option>
                <option value="SD">South Dakota</option>
                <option value="TN">Tennessee</option>
                <option value="TX">Texas</option>
                <option value="UT">Utah</option>
                <option value="VT">Vermont</option>
                <option value="VA">Virginia</option>
                <option value="WA">Washington</option>
                <option value="WV">West Virginia</option>
                <option value="WI">Wisconsin</option>
                <option value="WY">Wyoming</option>
              </select>
            </div>

            <div class="form-group"> <!-- Zip Code-->
              <label for="zip_id" class="control-label">Zip Code</label>
              <input type="text" class="form-control" id="zip_id" name="zipcode" placeholder="#####">
            </div>

            <div class="form-group"> <!-- Submit Button -->
              <button id="signup-button" type="submit" class="btn btn-primary btn-block">Sign Up</button>
            </div>

          </form>
        </div>

      </div>
    </div>
  </div>
