
<?php
  include("header.php");
 ?>

  <!-- Full Page Image Background Carousel Header -->
  <header id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for Slides -->
    <div class="carousel-inner">
      <div class="item active">
        <!-- Set the first background image using inline CSS below. -->
        <div class="fill" style="background-image:url('./images/slider1.jpg'); background-position:bottom;"></div>
        <div class="carousel-caption">
          <h2 style="font-style:italic;">Redefining 'BAD'minton</h2>
        </div>
      </div>
      <div class="item">
        <!-- Set the second background image using inline CSS below. -->
        <div class="fill" style="background-image:url('./images/slider2.jpg'); background-position:bottom;"></div>
        <div class="carousel-caption">
          <h2 style="font-style:italic;">Redefining 'Bad'minton</h2>
        </div>
      </div>
      <div class="item">
        <!-- Set the third background image using inline CSS below. -->
        <div class="fill" style="background-image:url('./images/slider3.jpg');"></div>
        <div class="carousel-caption">
          <h2 style="font-style:italic;">Redefining 'BAD'minton</h2>
        </div>
      </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="icon-prev"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="icon-next"></span>
    </a>

  </header>

  <div class="jumbotron">

  <!-- Page Content -->
  <div class="container">

    <!-- Introduction Row -->
    <div class="row" id="about">
      <div class="col-lg-12">
        <h1 class="page-header">About Us
          <small>It's Nice to Meet You!</small>
        </h1>
        <!-- <p>
          licabo dolores ipsam aliquam inventore corrupti eveniet quisquam quod totam laudantium repudiandae obcaecati ea consectetur debitis velit facere nisi expedita vel?
        </p> -->
      </div>
    </div>

    <!-- Team Members Row -->
    <div class="row">
      <div class="col-lg-12">
        <h2 class="page-header">Our Team</h2>
      </div>
      <div class="col-lg-4 col-sm-6 text-center">
        <img class="img-circle img-responsive img-center" src="images/1.png" alt="">
        <h3>Eric Wang
          <small>Geek</small>
        </h3>
        <p>Technology crazy!</p>
      </div>
      <div class="col-lg-4 col-sm-6 text-center">
        <img class="img-circle img-responsive img-center" src="images/2.jpg" alt="">
        <h3>Aishwarya Boragalli
          <small>Dreamer</small>
        </h3>
        <p>Outgoing and comes up with great ideas</p>
      </div>
      <div class="col-lg-4 col-sm-6 text-center">
        <img class="img-circle img-responsive img-center" src="images/3.jpg" alt="">
        <h3>Sowmya Peyyeti
          <small>Architect</small>
        </h3>
        <p>Has good planning and design skills</p>
      </div>
      <div class="col-lg-4 col-sm-6 text-center">
        <img class="img-circle img-responsive img-center" src="images/4.jpg" alt="">
        <h3>Kent Huang
          <small>UI Developer</small>
        </h3>
        <p>Makes things look great! Mr.Silent</p>
      </div>

    </div>

    <!-- Footer -->


  </div>
  <!-- /.container -->


</div>


<?php
  include("footer.php");
 ?>
