@extends('layouts.app')

@section('content')

<!-- container -->
<div class="container">
  <div class="d-flex justify-content-center" style="margin-top: -20px; margin-bottom: 5px; background-color: rgb(236 236 236);">
    <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
      <button class="btn btn-mdb-color btn-sm" ><a style="color: white;" href="{{ url(auth()->user()->path()) }}">Min sida</a></button>
      <button class="btn btn-mdb-color btn-sm" ><a style="color: white;" href="{{ url('/killreports/create') }}">Rapportera</a></button>
      <button class="btn btn-mdb-color btn-sm" ><a style="color: white;" href="{{ url('/data') }}">Data</a></button>
    </div>
  </div>

  <form action="#" method="GET">
    @csrf
      <table class="w-100">
        <tr>
          <td><label class="mt-2 mdb-main-label text-muted" style="font-size: 12px;">Säsong:</label></td>
          <td><label class="mt-2 mdb-main-label text-muted" style="font-size: 12px;">Skytt:</label></td>
        </tr>
        <tr>
          <td>
            <select class="custom-select custom-select-sm" name="season" id="season_search">
              <option value="">Alla</option>
              <option value="17/18" <?php if(isset($_GET['season'])) { echo $_GET['season']  == "17/18" ? "selected" : ""; } ?>>17/18</option>
              <option value="18/19" <?php if(isset($_GET['season'])) { echo $_GET['season'] == "18/19" ? "selected" : ""; } ?>>18/19</option>
              <option value="19/20" <?php if(isset($_GET['season'])) { echo $_GET['season'] == "19/20" ? "selected" : ""; } ?>>19/20</option>
              <option value="20/21" <?php if(isset($_GET['season'])) { echo $_GET['season'] == "20/21" ? "selected" : ""; } ?>>20/21</option>
            </select>
          </td>

          <td>
            <select class="custom-select custom-select-sm" name="users" id="user_select">
              <option value="">Alla</option>
              @foreach($users as $user)
                <option value="{{ $user->id }}" <?php if(isset($_GET['users'])) { echo $_GET['users'] ==  $user->id ? "selected" : ""; } ?>>{{ $user->firstname }} {{$user->lastname}}</option>
              @endforeach
            </select>
          </td>
        </tr>
        <tr>
          <td><label class="mt-2 mdb-main-label text-muted" style="font-size: 12px;">Djurslag:</label></td>
          <td><label class="mt-2 mdb-main-label text-muted" style="font-size: 12px;">Område:</label></td>
        </tr>
        <tr>
          <td>
            <select class="custom-select custom-select-sm" name="species" id="species_select">
              <option value="">Alla</option>
              <option value="Dovvilt"   <?php if(isset($_GET['species'])) { echo $_GET['species'] == "Dovvilt" ? "selected" : ""; } ?>>Dovvilt</option>
              <option value="Kronvilt"  <?php if(isset($_GET['species'])) { echo $_GET['species'] == "Kronvilt" ? "selected" : ""; } ?>>Kronvilt</option>
              <option value="Vildsvin"  <?php if(isset($_GET['species'])) { echo $_GET['species'] == "Vildsvin" ? "selected" : ""; } ?>>Vildsvin</option>
              <option value="Älg"       <?php if(isset($_GET['species'])) { echo $_GET['species'] == "Älg" ? "selected" : ""; } ?>>Älg</option>
              <option value="Rådjur"    <?php if(isset($_GET['species'])) { echo $_GET['species'] == "Rådjur" ? "selected" : ""; } ?>>Rådjur</option>
            </select>
          </td>
          <td>
             <select class="custom-select custom-select-sm" name="areas" id="area_select">
              <option value="">Alla</option>
              @foreach($areas as $area)
                <option value="{{ $area->id }}" <?php if(isset($_GET['areas'])) { echo $_GET['areas'] ==  $area->id ? "selected" : ""; } ?>>{{ $area->area_name }}</option>
              @endforeach
            </select>
          </td>
        </tr>
        <tr>
          <td><label class="mt-2 mdb-main-label text-muted" style="font-size: 12px;">Rapportstatus:</label></td>
          <td><label class="mt-2 mdb-main-label text-muted" style="font-size: 12px;">Köttilldelning:</label></td>
        </tr>
        <tr>
        <td>
            <select class="custom-select custom-select-sm" name="status" id="status_select">
              <option value="">Alla</option>
              <option value="green"   <?php if(isset($_GET['status'])) { echo $_GET['status'] == "green" ? "selected" : ""; } ?>>Klara</option>
              <option value="yellow"  <?php if(isset($_GET['status'])) { echo $_GET['status'] == "yellow" ? "selected" : ""; } ?>>Ej klara</option>
            </select>
          </td>
          <td>
            <select class="custom-select custom-select-sm" name="meat" id="meat_select">
              <option value="">Alla</option>
              @foreach($users as $user)
                <option value="{{ $user->id }}" <?php if(isset($_GET['meat'])) { echo $_GET['meat'] ==  $user->id ? "selected" : ""; } ?>>{{ $user->firstname }} {{$user->lastname}}</option>
              @endforeach
            </select>
        </td>
        </tr>
      </table>

    <div class="d-flex justify-content-between">
      <p></p>
      <p class="ml-3 mt-3 text-muted" style="font-size: 12px;">Sökningen gav <?= count($killreports) ?> träffar</p>
      <input class="btn btn-mdb-color btn-sm" type="submit" value="SÖK">
    </div>
  </form>
    <!-- Card deck -->
    <div class="card-deck clearfix">

      @foreach($killreports as $killreport)
          
        <!-- Card -->
        <div class="card mb-4" style="min-width: 300px; max-height:1000px;">

          <!-- översta kanten med killreport->id -->
          <div class="text-left" style="background-color: #dccc9b;">
            <p class="pl-2 card-text" style="font-size: 12px;">#{{$killreport->id}}</p>
          </div>  

          <!--Card image-->
          <div class="view overlay">

              <!-- bilden -->
              <img class="card-img-top lazy" data-src="{{ $killreport->display_path() }}?<?php $date = new DateTime(); echo $date->getTimestamp(); ?>" alt="">
              <!-- länk via bilden -->
              <a href="{{url($killreport->path())}}">
                  <div class="mask rgba-white-slight"><span></span></div>
              </a>

          </div>
          <!--/Card image-->

          <!--Card content-->
          <!-- <div class="card-body" style="border-top: 5px solid {{ $killreport->report_status }}"> -->
          <!-- <div class="card-body" <?php if($killreport->report_status == 'yellow') { echo 'style="border-left: 5px solid #ffbb33"'; } else if($killreport->report_status == 'green') { echo 'style="border-left: 5px solid #71a273"'; } ?>> -->
          <div class="card-body">

            @if($killreport->report_status == 'yellow')
            <div class="w-100" style="background-color: #ffbb33; padding-top: 5px; padding-left: 5px; margin-top: -2px;">
              <p style="font-size: 12px;"><span class="fas fa-exclamation-triangle"></span> Rapporten ej klar!</p>
            </div>
            @elseif($killreport->report_status == 'green')
              <div class="w-100" style="background-color: rgb(145 214 148); padding-top: 5px; padding-left: 5px; margin-top: -2px;">
                <p style="font-size: 12px;"><span class="fas fa-lock"></span> Rapporten klar och låst!</p>
              </div>
            @endif
            <!-- Beskrivning -->
            <div style="border-bottom: 1px solid #D8D8D8;">
              <!-- <span class="card-text" style="font-size: 12px;"><strong>BILDTEXT</strong></span><br> -->
              <i class="card-text" style="font-size: 12px;"><?= $killreport->display_image() == "default_display.jpg" ? "Bildtext saknas" : $killreport->display_image()->description ?></i>
            </div>

            <!-- rapportdata -->
            <div class="mt-2 mb-4 w-100" style="border-bottom: 1px solid #D8D8D8;">
              <span class="card-text" style="font-size: 12px;"><strong>RAPPPORTDATA</strong></span><br>
              <table class="w-100 card-text table-striped" >
                <tr>
                  <td style="font-size: 12px; font-weight: bold;">Datum:</td>
                  <td style="font-size: 12px;">{{substr($killreport->killdate, 0, 10)}}</td>
                </tr>
                <tr>
                  <td style="font-size: 12px; font-weight: bold;">Djur:</td>
                  <td style="font-size: 12px;">{{$killreport->animal()['species']}} - {{$killreport->animal()['speciestype']}}<?= $killreport->animal()['antlers'] ? "; " . $killreport->animal()['antlers'] : "" ?></td>
                </tr>
                <tr>
                  <td style="font-size: 12px; font-weight: bold;"><strong>Skytt:</strong></td>
                  <td style="font-size: 12px;">{{$killreport->shooter['firstname']}} {{$killreport->shooter['lastname']}}, [{{$killreport->kindofhunt}}]</td>
                </tr>
                <tr>
                  <td style="font-size: 12px; font-weight: bold;"><strong>Område:</strong></td>
                  <td style="font-size: 12px;">{{$killreport->area()['area_name']}}</td>
                </tr>
              </table>
            </div>

            <!-- köttilldelning -->
            <div class="mt-2 mb-4 w-100" style="border-bottom: 1px solid #D8D8D8;">
              <span class="card-text" style="font-size: 12px;"><strong>KÖTTILLDELNING</strong></span><br>
              <table class="card-text" >
                <tbody>
                @foreach($killreport->meat as $meat)
                  @if(!is_null($meat->user_id))
                    <tr>
                      <td style="font-size: 12px; font-weight: bold;"><?= $meat->get_users_name() == '- -' ? 'Gäst' : $meat->get_users_name()?>:</td>
                      <td style="font-size: 12px;">{{$meat->share_kilogram}} kg</td>
                    </tr>
                  @endif
                @endforeach
                </tbody>
              </table>
              <i class="card-text" style="font-size: 12px;">{{$killreport->animal()->waste_notes}}</i>
            </div>
            
            <!-- footer -->
            <div class="d-flex flex-row justify-content-around card-footer">
              <button class="btn btn-mdb-color btn-sm"><a href="{{url($killreport->path())}}" style="color: white;">Rapporten</a></button>
              <button class="btn btn-mdb-color btn-sm"><a href="{{url( '/image/'.$killreport->id.'/edit' )}}" style="color: white;">Bilder</a></button>
             <!-- @if(Auth::user()->role == 'admin')
              </div>
              <div class="w-100 justify-content-right" style="background-color: lightgray;">
                <form class="w-100 text-center" method="POST" action="{{url( '/killreports/'.$killreport->id.'/delete' )}}">
                  @csrf
                  @method('DELETE')
                  <button onclick="return confirm('Detta tar oåterkalleligt bort rapporten, djuret, köttilldelning och bilder som är associerat med rapporten. Vill du fortsätta?')" class="btn btn-danger btn-sm" type="submit"><span class="fas fa-trash-alt"></span></button>
                 
                </form>
              </div>
              @else
              </div>

              @endif-->
              
            
            </div>
          </div>
          <!--/Card content-->

        </div>
        <!-- /Card -->    
      @endforeach
    </div>
    <!-- Card deck -->
</div>
<!-- /Container -->
   


@endsection
<script>
document.addEventListener("DOMContentLoaded", function() {
  var lazyloadImages;    

  if ("IntersectionObserver" in window) {
    lazyloadImages = document.querySelectorAll(".lazy");
    var imageObserver = new IntersectionObserver(function(entries, observer) {
      entries.forEach(function(entry) {
        if (entry.isIntersecting) {
          var image = entry.target;
          image.src = image.dataset.src;
          image.classList.remove("lazy");
          imageObserver.unobserve(image);
        }
      });
    });

    lazyloadImages.forEach(function(image) {
      imageObserver.observe(image);
    });
  } else {  
    var lazyloadThrottleTimeout;
    lazyloadImages = document.querySelectorAll(".lazy");
    
    function lazyload () {
      if(lazyloadThrottleTimeout) {
        clearTimeout(lazyloadThrottleTimeout);
      }    

      lazyloadThrottleTimeout = setTimeout(function() {
        var scrollTop = window.pageYOffset;
        lazyloadImages.forEach(function(img) {
            if(img.offsetTop < (window.innerHeight + scrollTop)) {
              img.src = img.dataset.src;
              img.classList.remove('lazy');
            }
        });
        if(lazyloadImages.length == 0) { 
          document.removeEventListener("scroll", lazyload);
          window.removeEventListener("resize", lazyload);
          window.removeEventListener("orientationChange", lazyload);
        }
      }, 20);
    }

    document.addEventListener("scroll", lazyload);
    window.addEventListener("resize", lazyload);
    window.addEventListener("orientationChange", lazyload);
  }
})
</script>
