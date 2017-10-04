
<?php
  include("header.php");
 ?>


  <div class="jumbotron">
    <div class="container">

      <div class="row" >
        <div class="col-md-offset-2 col-md-8">

          <h1>Booking</h1>

          <form id="book-form">
            <div class="form-group"> <!-- Full Name -->
              <label class="control-label">Player ID</label>
              <input type="text" class="form-control" name="playerid" >
            </div>

            <div class="form-group"> <!-- Full Name -->
              <label class="control-label">Club ID</label>
              <input type="password" class="form-control"  name="clubid" >
            </div>


            <div class="form-group"> <!-- Full Name -->
              <label class="control-label">Court ID</label>
              <input type="text" class="form-control"  name="courtid" >
            </div>

            <div class="form-group"> <!-- Street 1 -->
              <label  class="control-label">BeginTime (yyyy-mm-dd hh:mm:ss)</label>
              <input type="text" class="form-control"  name="begintime" >
            </div>

            <div class="form-group"> <!-- City-->
              <label class="control-label">Duration (hours)</label>
              <input type="text" class="form-control" name="duration">
            </div>

            <div class="form-group"> <!-- Submit Button -->
              <button id="book-button"  class="btn btn-primary btn-block">Book</button>
            </div>

          </form>

        </div>
      </div>

    </div>

  </div>


  <?php
    include("footer.php");
   ?>
