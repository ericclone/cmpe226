
<?php
  include("header.php");
 ?>


  <div class="jumbotron">
    <div class="container">

      <div class="row" >
        <div class="col-md-offset-1 col-md-10">

          <h1>Our Clubs</h1>

          <div class="media club-item">
            <a class="media-left" href="#">
              <img class="media-object club-pic" src="images/club-default.jpg" alt="Generic placeholder image">
            </a>
            <div class="media-body">
              <h2 class="media-heading">{Club Name}</h2>
              <h3 id="address">{Address}</h3>
              <h3 id="phone">{Phone}</h3>
              <h4>
                <a data-toggle="collapse" href="#collapse1" aria-expanded="false" aria-controls="collapse1">
                  Courts: {courts}
                  <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                </a>
              </h4>
              <div class="collapse" id="collapse1">
                <div class="card card-block">
                  <ul class="media-list">
                    <li class="media">
                      <div class="media-left">
                        <a href="#">
                          <img class="media-object court-pic" src="images/court-floor.jpg" alt="Generic placeholder image">
                        </a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">Court #1</h4>
                        <p><span>Floor Type: {floorType}</span>&nbsp;&nbsp;&nbsp;<span>Pirce: {price}</span></p>
                      </div>
                    </li>

                    <li class="media">
                      <div class="media-left">
                        <a href="#">
                          <img class="media-object court-pic" src="images/court-floor.jpg" alt="Generic placeholder image">
                        </a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">Court #2</h4>
                        <p><span>Floor Type: {floorType}</span>&nbsp;&nbsp;&nbsp;<span>Pirce: {price}</span></p>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>


          <div class="media club-item">
            <a class="media-left" href="#">
              <img class="media-object club-pic" src="images/club-default.jpg" alt="Generic placeholder image">
            </a>
            <div class="media-body">
              <h2 class="media-heading">{Club Name}</h2>
              <h3 id="address">{Address}</h3>
              <h3 id="phone">{Phone}</h3>
              <h4>
                <a data-toggle="collapse" href="#collapse2" aria-expanded="false" aria-controls="collapse2">
                  Courts: {courts}
                  <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                </a>
              </h4>
              <div class="collapse" id="collapse2">
                <div class="card card-block">
                  <ul class="media-list">
                    <li class="media">
                      <div class="media-left">
                        <a href="#">
                          <img class="media-object court-pic" src="images/court-floor.jpg" alt="Generic placeholder image">
                        </a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">Court #1</h4>
                        <p><span>Floor Type: {floorType}</span>&nbsp;&nbsp;&nbsp;<span>Pirce: {price}</span></p>
                      </div>
                    </li>

                    <li class="media">
                      <div class="media-left">
                        <a href="#">
                          <img class="media-object court-pic" src="images/court-floor.jpg" alt="Generic placeholder image">
                        </a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">Court #2</h4>
                        <p><span>Floor Type: {floorType}</span>&nbsp;&nbsp;&nbsp;<span>Pirce: {price}</span></p>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>


        </div>
      </div>


    </div>


  </div>


  <?php
    include("footer.php");
   ?>
