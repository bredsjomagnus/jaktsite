<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark special-color-dark">

  <!-- Navbar brand -->
  <a class="navbar-brand" style="color: #dec08f;" href="#"><img class="rounded-circle" height="30px" src="{{ asset('images/logo/smårislogo.png') }}" alt="logo"> Småris</a>

  <!-- Collapse button -->
  <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
    aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> -->

  <!-- Collapsible content -->
  <!-- <div class="collapse navbar-collapse" id="basicExampleNav">

    Links 
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="{{ url('home') }}">Home
          <span class="sr-only">(current)</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="{{ url('killreports/create') }}">Rapportera</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="{{ url('killreports') }}">Rapportarkivet</a>
      </li>

    </ul>

    Right Side Of Navbar 
    <ul class="navbar-nav ml-auto">
         Authentication Links 
        @guest
            <li class="nav-item">
                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
            </li>
             <li class="nav-item">
              <a class="dropdown-item" href="{{ url('user/create') }}">
                        Registrera ny användare
              </a>
            </li> 
            
        @else
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">{{ Auth::user()->firstname }} <span class="caret"></span>
              </a>
              
              <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">

                @if (Auth::user()->role == "admin")

                    <a class="dropdown-item" href="{{ url('/admin') }}">
                        Admin
                    </a>

                    <a class="dropdown-item" href="{{ url('user/create') }}">
                        Registrera
                    </a>
      
                @endif

                <a href="{{ url(Auth::user()->path()) }}">Min sida</a>

                <a class="dropdown-item" href="{{ route('logout') }}"
                    onclick="event.preventDefault();
                                  document.getElementById('logout-form').submit();">
                    {{ __('Logout') }}
                </a>

                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>
                
              </div>
            </li>
        @endguest
    </ul>
     Links 
  </div> -->
  <!-- Collapsible content -->

</nav>
<!--/.Navbar-->