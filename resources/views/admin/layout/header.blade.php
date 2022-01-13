
<div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            @include('admin.layout.menu')
        </div>
        <!-- /.sidebar-collapse -->
    </div>

<div class="container-fluid" >
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" >

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">

            

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{ session('admin_details')->username }}</span>
                    <img class="img-profile rounded-circle pfp" src="{{ asset(session('admin_details')->image) }}">
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="{{ route('admin_account_settings') }}">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Profile
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-danger" href="{{ route('logout') }}">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-danger"></i>
                        Logout
                    </a>
                </div>
            </li>

        </ul>

    </nav>


    
    <!-- /.navbar-static-side -->
