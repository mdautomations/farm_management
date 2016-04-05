<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Graph Database</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <header class="main-header">

        <a href="index2.html" class="logo">
          <span class="logo-mini"><b>A</b>LT</span>
          <span class="logo-lg"><b>Simillarity</b>&nbsp;Matching</span>
        </a>

        <nav class="navbar navbar-static-top" role="navigation">
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li>

              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <ul class="menu">
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <li class="dropdown tasks-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 9 tasks</li>
                  <li>
                    <ul class="menu">
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Design some buttons
                            <small class="pull-right">20%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">20% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs">ManiMaran</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="user-header">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    <p>
                      Mani - manimaran@gmail.com
                      <small>Member since Nov. 2015</small>
                    </p>
                  </li>
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="#" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <aside class="main-sidebar">

        <section class="sidebar">

          <div class="user-panel">
            <div class="pull-left image">
              <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>ManiMaran</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>

          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>

          <ul class="sidebar-menu">
            <li class="header">Menu</li>
            <li class="active"><a href="#"><i class="fa fa-link"></i> <span>User Profile</span></a></li>
            <li><a href="#"><i class="fa fa-link"></i> <span>Graph API</span></a></li>
                 <li><a href="#"><i class="fa fa-link"></i> <span>Syntax Analysis</span></a></li>
                      <li><a href="#"><i class="fa fa-link"></i> <span>Filteration and Report</span></a></li>
                           <li><a href="#"><i class="fa fa-link"></i> <span>Admin Console</span></a></li>
          </ul>
        </section>
      </aside>

      <div class="content-wrapper">
        <section class="content-header">
          <h1>
            Simillarity Matching Via Graph API
            <small>Build User Profile</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
            <li class="active">Here</li>
          </ol>
        </section>

        <section class="content">
<div class="row">
<div class="col-md-6">
             
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">User Input</h3>
                </div>
                
                <form role="form">
                  <div class="box-body">
	                    <div class="form-group">
	                      <label for="exampleInputEmail1">Your Interest( Comma Seperated )</label>
	                      <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleInputPassword1">Your Favourite Place</label>
	                      <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Favourite Place">
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleInputEmail1">Your Favourite Dish</label>
	                      <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleInputPassword1">Your Favourite Game</label>
	                      <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleInputEmail1">Your Favourite Outing</label>
	                      <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleInputPassword1">Your Favourite Wear</label>
	                      <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleInputPassword1">Your Favourite Adventure</label>
	                      <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleInputPassword1">Your Favourite Personality</label>
	                      <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleInputPassword1">Your Favourite Technology</label>
	                      <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
	                    </div>
                  </div>

                  <div class="box-footer">
                    <button type="button" id="getuserinput" class="btn btn-primary">Submit</button>
                  </div>
                </form>
              </div>

              


            

            </div>

</div>

        </section>
      </div>

      <footer class="main-footer">
        <strong>Copyright &copy; 2015 <a href="#">Mani & Co</a>.</strong> All rights reserved.
      </footer>

      <aside class="control-sidebar control-sidebar-dark">
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript::;">
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                    <p>Will be 23 on April 24th</p>
                  </div>
                </a>
              </li>
            </ul>

            <h3 class="control-sidebar-heading">Tasks Progress</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript::;">
                  <h4 class="control-sidebar-subheading">
                    Custom Template Design
                    <span class="label label-danger pull-right">70%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                  </div>
                </a>
              </li>
            </ul>

          </div><!-- /.tab-pane -->
          <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->
          <div class="tab-pane" id="control-sidebar-settings-tab">
            <form method="post">
              <h3 class="control-sidebar-heading">General Settings</h3>
              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Report panel usage
                  <input type="checkbox" class="pull-right" checked>
                </label>
                <p>
                  Some information about this general settings option
                </p>
              </div>
            </form>
          </div>
        </div>
      </aside>
      <div class="control-sidebar-bg"></div>
    </div>


    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="dist/js/app.min.js"></script>
 <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/action.js"></script>
  </body>
</html>
