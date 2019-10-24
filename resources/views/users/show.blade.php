@extends('layouts.app')

@section('content')

<material-profile-card :auth-user="{{ Auth::user() }}" :gravatar-src='{!! json_encode( Gravatar::src(Auth::user()->email)) !!}'></material-profile-card>
<!-- Card -->
<!-- <div class="card" style="background-color:#255172; margin-left:10px; margin-right:10px"> -->
  <!-- Card image -->
  <!-- <div class="view overlay">
    <div class="d-flex justify-content-center" style="height:175px; padding-top:10px; background-color: #2a4153;">
      <img class="rounded-circle z-depth-2" style="height:100px" alt="{{ Auth::user()->username }}" src="{{ Gravatar::src(Auth::user()->email) }}" data-holder-rendered="true">  
    </div>
    <a href="#!">
      <div class="mask rgba-white-slight"></div>
    </a>
  </div> -->

  <!-- Card content -->
  <!-- <div class="card-body"> -->

    <!-- <div class="d-flex justify-content-center">
      <h3 style="color:white">{{Auth::user()->firstname}} {{Auth::user()->lastname}}</h3>
    </div> -->
    <!-- <div class="d-flex justify-content-center">
      <a style="color:white; font-size: 24px;" data-toggle="collapse" href="#userData" aria-expanded="false" aria-controls="collapseExample">
        {{Auth::user()->firstname}} {{Auth::user()->lastname}}
      </a>
    </div> -->
    <!-- <div class="d-flex justify-content-start">
      <div style="display:block; margin-bottom: -20px; margin-left: 20px; padding-top:20px;">
        <a style="color:white" href="#profileData">
          Profil
        </a>
      </div>
      <div style="display:block; margin-bottom: -20px; margin-left: 20px; padding-top:20px;">
        <a style="color:white" href="#statistikData">
          Statistik
        </a>  
      </div>
      <div style="display:block; margin-bottom: -20px; margin-left: 20px; padding-top:20px;">
        <a style="color:white" href="#redigeraData">
          Redigera
        </a>  
      </div>
    </div>   -->

  <!-- </div>

</div> -->
<!-- Card -->



<!-- Card -->
<!-- <div class="card" style="background-color:rgb(223, 223, 223); margin-left:10px; margin-right:10px; margin-top:10px">
  <div class="collapse" id="userData">
    <div class="view overlay">
      <div class="d-flex justify-content-center" style="height:5px; padding-top:10px; background-color: #2a4153; color: white;">
      </div>
      <a href="#!">
        <div class="mask rgba-white-slight"></div>
      </a>
    </div>
    <div>
      <div class="mt-3 ml-3">
        <table>
          <tr>
            <td>Användarnamn:</td>
            <td>{{Auth::user()->username}}</td>
          </tr>
          <tr>
            <td>Namn:</td>
            <td>{{Auth::user()->firstname}} {{Auth::user()->lastname}}</td>
          </tr>
          <tr>
            <td>Adress:</td>
            <td>{{Auth::user()->address}}</td>
          </tr>
          <tr>
            <td>Postort:</td>
            <td>{{Auth::user()->postnumber}} {{Auth::user()->city}}</td>
          </tr>
          <tr>
            <td>Mobil:</td>
            <td>{{Auth::user()->mobilenumber}}</td>
          </tr>
          <tr>
            <td>Tel:</td>
            <td>{{Auth::user()->phonenumber}}</td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div> -->
<!-- Card -->


<!-- Card
<div class="card" style="background-color:#255172; margin-left:10px; margin-right:10px; margin-top:10px">
  <div>
    <div class="mt-3">
      STATISTIK
    </div>
  </div>
</div> -->
<!-- Card -->


<!-- Card -->
<!-- <div class="card" style="background-color:#255172; margin-left:10px; margin-right:10px; margin-top:10px">
  <div>
    <div class="mt-3">
      STATISTIK
    </div>
  </div>
</div> -->
<!-- Card -->


<!-- <div class="d-flex justify-content-center">
  <a href="#" class="btn btn-primary">Rapportera djur</a>
</div> -->


@endsection