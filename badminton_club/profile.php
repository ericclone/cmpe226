
<?php
  include("header.php");
 ?>


  <div class="jumbotron">
    <div class="container">

      <div class="row">

        <div class="col-md-offset-2 col-md-8">

          <div class="media">
            <a class="media-left" href="#">
              <img class="media-object user-pic" src="images/icon-user-default.png" alt="Generic placeholder image">
            </a>
            <div class="media-body">
              <h2 class="media-heading profile-name">{User Name}</h2>
              <h3>Membership: <span id="profile-membership">{Membership}</span></h3>
              <!-- <p><span id="profile-points">Points: {points}</span>&nbsp;&nbsp;&nbsp;<span id="profile-hours">Hours Played: {hours}</span></p> -->
            </div>
          </div>

          <hr />


          <div id="exTab2">
            <ul class="nav nav-tabs">
              <li class="active">
                <a  href="#1" data-toggle="tab">Profile</a>
              </li>
              <li><a href="#2" data-toggle="tab">Activity History</a>
              </li>

            </ul>

            <div class="tab-content">
              <div class="tab-pane active" id="1">
                <h3>My Profile</h3>

                <form class="user-form">

                  <div class="form-group"> <!-- Full Name -->
                    <label for="profile-username" class="control-label">Username:</label><br>
                    <span id="profile-username"></span>
                  </div>

                  <div class="form-group"> <!-- Full Name -->
                    <label for="full_name_id" class="control-label">Full Name:</label><br>
                    <span class="profile-name"></span>
                  </div>

                  <div class="form-group"> <!-- Street 1 -->
                    <label class="control-label">Street Address:</label><br>
                    <span id="profile-street"></span>
                  </div>

                  <div class="form-group"> <!-- City-->
                    <label for="city_id" class="control-label">City:</label><br>
                    <span id="profile-city"></span>
                  </div>


                  <div class="form-group"> <!-- Zip Code-->
                    <label for="zip_id" class="control-label">Zip Code:</label><br>
                    <span id="profile-zipcode"></span>
                  </div>

                  <div class="form-group">
                    <label class="control-label">State:</label><br>
                    <span id="profile-state"></span>
                  </div>

                </form>
              </div>

              <div class="tab-pane" id="2">

                <div class="data-table">
                  <h3>Activity History</h3>
                  <table id="tableActivity" class="display" cellspacing="0" width="100%">
                    <thead>
                      <tr>
                        <th>Street</th>
                        <th>City</th>
                        <th>State</th>
                        <th>CourtID</th>
                        <th>BeginTime</th>
                        <th>Duration</th>
                      </tr>
                    </thead>
                  </table>
                </div>

              </div>

              <div class="tab-pane" id="3">
                <h3>add clearfix to tab-content (see the css)</h3>
              </div>
          </div>
        </div>

        </div>
      </div>

    </div>

  </div>

  <!-- Save Modal -->
  <div class="modal fade" id="saveModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">Save Changes?</h4>
      </div>
      <div class="modal-body">
        <h4>Are you sure you want to save the changes?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" id="cancel-button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="button" id="save-button" class="btn btn-primary">Save changes</button>
      </div>

      </div>
    </div>
  </div>



    <?php
      include("footer.php");
     ?>
