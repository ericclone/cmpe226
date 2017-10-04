
<?php
  include("header.php");
 ?>


  <div class="jumbotron">
    <div class="container">

      <div class="row">

        <div class="">

          <h2>Statistics</h2>

          <div id="exTab2">
            <ul class="nav nav-tabs">
              <li class="active">
                <a  href="#1" data-toggle="tab">Drill-Down</a>
              </li>
              <li><a href="#2" data-toggle="tab">Roll-Up</a>
              </li>

            </ul>

            <div class="tab-content">
              <div class="tab-pane active" id="1">

                <h3>Player Activity Analysis</h3>

                <form id="form1" class="form-inline">
                  <label>
                    Filter:
                  </label>
                  <label class="radio-inline">
                    <input class="radio-filter" type="radio" name="filter" value="location" checked>Location
                  </label>
                  <label class="radio-inline">
                    <input class="radio-filter" type="radio" name="filter" value="time">Time
                  </label>
                  <br />
                  <div class="form-group location-input">
                    <label for="state" class="control-label">State: </label>
                    <select id="state" class="form-control" name="State" >
                      <option value="">All</option> <option value="AL">Alabama</option> <option value="AK">Alaska</option> <option value="AZ">Arizona</option> <option value="AR">Arkansas</option> <option value="CA">California</option> <option value="CO">Colorado</option> <option value="CT">Connecticut</option> <option value="DE">Delaware</option> <option value="DC">District of Columbia</option> <option value="FL">Florida</option> <option value="GA">Georgia</option> <option value="HI">Hawaii</option> <option value="ID">Idaho</option> <option value="IL">Illinois</option> <option value="IN">Indiana</option> <option value="IA">Iowa</option> <option value="KS">Kansas</option> <option value="KY">Kentucky</option> <option value="LA">Louisiana</option> <option value="ME">Maine</option> <option value="MD">Maryland</option> <option value="MA">Massachusetts</option> <option value="MI">Michigan</option> <option value="MN">Minnesota</option> <option value="MS">Mississippi</option> <option value="MO">Missouri</option> <option value="MT">Montana</option> <option value="NE">Nebraska</option> <option value="NV">Nevada</option> <option value="NH">New Hampshire</option> <option value="NJ">New Jersey</option> <option value="NM">New Mexico</option> <option value="NY">New York</option> <option value="NC">North Carolina</option> <option value="ND">North Dakota</option> <option value="OH">Ohio</option> <option value="OK">Oklahoma</option> <option value="OR">Oregon</option> <option value="PA">Pennsylvania</option> <option value="RI">Rhode Island</option> <option value="SC">South Carolina</option> <option value="SD">South Dakota</option> <option value="TN">Tennessee</option> <option value="TX">Texas</option> <option value="UT">Utah</option> <option value="VT">Vermont</option> <option value="VA">Virginia</option> <option value="WA">Washington</option> <option value="WV">West Virginia</option> <option value="WI">Wisconsin</option> <option value="WY">Wyoming</option>
                    </select>

                  </select>
                </div>

                <div class="form-group location-input">
                  <label for="city" class="control-label">City: </label>
                  <input id="city" type="text" class="form-control" name="City" placeholder="City" >
                </div>

                <div class="form-group time-input">
                  <label for="year" class="control-label">Year: </label>
                  <select id="year"  class="form-control" name="Year" >
                    <option value="">All</option><option value="2017">2017</option>
                    <option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option>
                    <option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option>
                    <option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option>
                    <option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option>
                    <option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option>
                    <option value="2001">2001</option><option value="2000">2000</option>
                  </select>
                </div>

                <div class="form-group time-input">
                  <label for="quarter" class="control-label">Quarter: </label>
                  <select id="quarter" class="form-control" name="Quarter" >
                    <option value="">All</option>
                    <option value="1">1</option><option value="2">2</option><option value="3">3</option>
                    <option value="4">4</option>
                  </select>
                </div>

                <div class="form-group time-input">
                  <label for="month" class="control-label">Month: </label>
                  <select class="form-control" name="Month" id="month"  >
                    <option value="">All</option>
                    <option value="1">01</option><option value="2">02</option><option value="3">03</option>
                    <option value="4">04</option><option value="5">05</option><option value="6">06</option>
                    <option value="7">07</option><option value="8">08</option><option value="9">09</option>
                    <option value="10">10</option><option value="11">11</option><option value="12">12</option>
                  </select>
                </div>

                <div class="form-group"> <!-- Submit Button -->
                  <button type="submit" id="submit-button" class="btn btn-primary">Show Data</button>
                </div>
              </form>

              <hr>

              <div class="data-table">
                <h3 id="table1-title">Table 1</h3>
                <table id="table1" class="display" cellspacing="0" width="100%">
                  <thead>
                    <tr>
                      <th class="table1-column1">Year</th>
                      <th class="table1-column2">Total Hours Played</th>
                    </tr>
                  </thead>
                </table>
              </div>

              <hr>

              <div class="data-table">
                <h3 id="table2-title">Table 2</h3>
                <table id="table2" class="display" cellspacing="0" width="100%">
                  <thead>
                    <tr>
                      <th class="table2-column1">Year</th>
                      <th class="table2-column2">Quarter</th>
                      <th class="table2-column3">Total Hours Played</th>
                    </tr>
                  </thead>
                </table>
              </div>

              <hr>

              <div id="table3Div" class="data-table">
                <h3 id="table3-title">Table 3</h3>
                <table id="table3" class="display" cellspacing="0" width="100%">
                  <thead>
                    <tr>
                      <th class="table3-column1">Year</th>
                      <th class="table3-column2">Quarter</th>
                      <th class="table3-column3">Month</th>
                      <th class="table3-column4">Total Hours Played</th>
                    </tr>
                  </thead>

                </table>
              </div>

            </div>

            <div class="tab-pane" id="2">
              <h3>Player Activity Analysis</h3>

              <form id="form12" class="form-inline">
                <label>
                  Filter:
                </label>
                <label class="radio-inline">
                  <input class="radio-filter2" type="radio" name="filter" value="location" checked>Location
                </label>
                <label class="radio-inline">
                  <input class="radio-filter2" type="radio" name="filter" value="time">Time
                </label>
                <br />
                <div class="form-group location-input2">
                  <label for="state2" class="control-label">State: </label>
                  <select id="state2" class="form-control" name="State" >
                    <option value="">All</option> <option value="AL">Alabama</option> <option value="AK">Alaska</option> <option value="AZ">Arizona</option> <option value="AR">Arkansas</option> <option value="CA">California</option> <option value="CO">Colorado</option> <option value="CT">Connecticut</option> <option value="DE">Delaware</option> <option value="DC">District of Columbia</option> <option value="FL">Florida</option> <option value="GA">Georgia</option> <option value="HI">Hawaii</option> <option value="ID">Idaho</option> <option value="IL">Illinois</option> <option value="IN">Indiana</option> <option value="IA">Iowa</option> <option value="KS">Kansas</option> <option value="KY">Kentucky</option> <option value="LA">Louisiana</option> <option value="ME">Maine</option> <option value="MD">Maryland</option> <option value="MA">Massachusetts</option> <option value="MI">Michigan</option> <option value="MN">Minnesota</option> <option value="MS">Mississippi</option> <option value="MO">Missouri</option> <option value="MT">Montana</option> <option value="NE">Nebraska</option> <option value="NV">Nevada</option> <option value="NH">New Hampshire</option> <option value="NJ">New Jersey</option> <option value="NM">New Mexico</option> <option value="NY">New York</option> <option value="NC">North Carolina</option> <option value="ND">North Dakota</option> <option value="OH">Ohio</option> <option value="OK">Oklahoma</option> <option value="OR">Oregon</option> <option value="PA">Pennsylvania</option> <option value="RI">Rhode Island</option> <option value="SC">South Carolina</option> <option value="SD">South Dakota</option> <option value="TN">Tennessee</option> <option value="TX">Texas</option> <option value="UT">Utah</option> <option value="VT">Vermont</option> <option value="VA">Virginia</option> <option value="WA">Washington</option> <option value="WV">West Virginia</option> <option value="WI">Wisconsin</option> <option value="WY">Wyoming</option>
                  </select>

                </select>
              </div>

              <div class="form-group location-input2">
                <label for="city2" class="control-label">City: </label>
                <input id="city2" type="text" class="form-control" name="City" placeholder="City" >
              </div>

              <div class="form-group time-input2">
                <label for="year2" class="control-label">Year: </label>
                <select id="year2"  class="form-control" name="Year" >
                  <option value="">All</option><option value="2017">2017</option>
                  <option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option>
                  <option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option>
                  <option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option>
                  <option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option>
                  <option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option>
                  <option value="2001">2001</option><option value="2000">2000</option>
                </select>
              </div>

              <div class="form-group time-input2">
                <label for="quarter2" class="control-label">Quarter: </label>
                <select id="quarter2" class="form-control" name="Quarter" >
                  <option value="">All</option>
                  <option value="1">1</option><option value="2">2</option><option value="3">3</option>
                  <option value="4">4</option>
                </select>
              </div>

              <div class="form-group time-input2">
                <label for="month2" class="control-label">Month: </label>
                <select class="form-control" name="Month" id="month2"  >
                  <option value="">All</option>
                  <option value="1">01</option><option value="2">02</option><option value="3">03</option>
                  <option value="4">04</option><option value="5">05</option><option value="6">06</option>
                  <option value="7">07</option><option value="8">08</option><option value="9">09</option>
                  <option value="10">10</option><option value="11">11</option><option value="12">12</option>
                </select>
              </div>

              <div class="form-group"> <!-- Submit Button -->
                <button type="submit" id="submit-button2" class="btn btn-primary">Show Data</button>
              </div>
              </form>

              <hr>

              <div class="data-table">
              <h3 id="table12-title">Table 1</h3>
              <table id="table12" class="display" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="table12-column1">Year</th>
                    <th class="table12-column2">Quarter</th>
                    <th class="table12-column3">Month</th>
                    <th class="table12-column4">Total Hours Played</th>
                  </tr>
                </thead>
              </table>
              </div>

              <hr>

              <div class="data-table">
              <h3 id="table22-title">Table 2</h3>
              <table id="table22" class="display" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="table22-column1">Year</th>
                    <th class="table22-column2">Quarter</th>
                    <th class="table22-column3">Total Hours Played</th>
                  </tr>
                </thead>

              </table>
              </div>

              <hr>

              <div id="table32Div" class="data-table">
              <h3 id="table32-title">Table 3</h3>
              <table id="table32" class="display" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="table32-column1">Year</th>
                    <th class="table32-column4">Total Hours Played</th>
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


  <?php
    include("footer.php");
   ?>
