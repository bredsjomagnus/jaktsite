@extends('layouts.app')

@section('content')

<!-- container -->
<div class="container">
  <div class="d-flex justify-content-center" style="margin-top: -20px; margin-bottom: 5px; background-color: rgb(236 236 236);">
    <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
      <button class="btn btn-mdb-color btn-sm" ><a style="color: white;" href="{{ url(auth()->user()->path()) }}"><span class="fas fa-user"></span></a></button>
      <button class="btn btn-mdb-color btn-sm" ><a style="color: white;" href="{{ url('/killreports/create') }}">Rapportera</a></button>
      <button class="btn btn-mdb-color btn-sm" ><a style="color: white;" href="{{ url('/data') }}">Data</a></button>
    </div>
  </div>

  <div class="d-flex justify-content-center mt-2">
    <h6>RAPPORTARKIVET</h6>
  </div>
  

  <div class="accordion mb-2" id="filter">
    <div class="d-flex flex-row justify-content-center" id="filterheader" style="background-color: #3490dc; padding: 5px;" data-toggle="collapse" data-target="#formfilter">
      <!-- <p class="mb-0"> -->
          <a style="color: white; font-size: 12px;" class="accordion-btn">
            <span class="fas fa-sliders-h"></span> KLICKA FÖR ATT VISA/DÖLJA FILTER
          </a>
      <!-- </p> -->
    </div>
    <div id="formfilter" class="collapse" data-parent="#filter">
  

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
                <option value="21/22" <?php if(isset($_GET['season'])) { echo $_GET['season'] == "21/22" ? "selected" : ""; } ?>>21/22</option>
                <option value="22/23" <?php if(isset($_GET['season'])) { echo $_GET['season'] == "22/23" ? "selected" : ""; } ?>>22/23</option>
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
                @foreach($hunters as $hunter)
                  <option value="{{ $hunter->id }}" <?php if(isset($_GET['meat'])) { echo $_GET['meat'] ==  $hunter->id ? "selected" : ""; } ?>>{{ $hunter->firstname }} {{$hunter->lastname}}</option>
                @endforeach
                <option value="{{ $anonhunter->id }}" <?php if(isset($_GET['meat'])) { echo $_GET['meat'] ==  $anonhunter->id ? "selected" : ""; } ?>>Utanför jaktlaget</option>
              </select>
            </td>
          </tr>
          <tr>
            <td><label class="mt-2 mdb-main-label text-muted" style="font-size: 12px;">Låst:</label></td>
            <td><label class="mt-2 mdb-main-label text-muted" style="font-size: 12px;">Sorts jakt:</label></td>
          </tr>
          <tr>
            <td>
              <select class="custom-select custom-select-sm" name="locked" id="status_select">
                <option value="">Alla</option>
                <option value="no"   <?php if(isset($_GET['locked'])) { echo $_GET['locked'] == "no" ? "selected" : ""; } ?>>Nej</option>
                <option value="yes"  <?php if(isset($_GET['locked'])) { echo $_GET['locked'] == "yes" ? "selected" : ""; } ?>>Ja</option>
              </select>
            </td>
            <td>
              
              <select class="custom-select custom-select-sm" name="kind" id="status_select">
                <option value="">Alla</option>
                <option value="Gemensam jakt"   <?php if(isset($_GET['kind'])) { echo $_GET['kind'] == "Gemensam jakt" ? "selected" : ""; } ?>>Gemensam jakt</option>
                <option value="Ensamjakt"  <?php if(isset($_GET['kind'])) { echo $_GET['kind'] == "Ensamjakt" ? "selected" : ""; } ?>>Ensamjakt</option>
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


  </div>
  <!-- /formfilter -->
<div class="mt-2" style="padding: 0; font-size: 14px;">
      <!-- <p class="mb-0"> -->
          <div style="color: rgb(113 113 113);">
            @if($filtering)
              <span style="font-weight:bold"><b>Sökning med filter:</b></span><br>

              @if(isset($_GET['season']))
                @if($_GET['season'] != '')
                  <span class="ml-1">Säsong: {{ $_GET['season'] }}</span> <br>
                @endif
              @endif

              @if(isset($_GET['users']))
                @if($_GET['users'] != '')
                  <span class="ml-1">Skytt: {{$shooter}}</span> <br>
                @endif
              @endif

              @if(isset($_GET['species']))
                @if($_GET['species'] != '')
                  <span class="ml-1">Djurslag: {{ $_GET['species'] }}</span> <br>
                @endif
              @endif

              @if(isset($_GET['areas']))
                @if($_GET['areas'] != '')
                  <span class="ml-1">Område: {{ $searched_area_name }}</span> <br>
                @endif
              @endif

              @if(isset($_GET['status']))
                @if($_GET['status'] != '')
                  @if( $_GET['status'] == 'green')
                    <span class="ml-1">Rapportstatus: Klar</span> <br>
                  @else
                    <span class="ml-1">Rapportstatus: Ej klar</span> <br>
                  @endif
                @endif
              @endif

              @if(isset($_GET['meat']))
                @if($_GET['meat'] != '')
                  @if($meat_to == '- -')
                    <span class="ml-1">Köttilldelning: Utanför jaktlaget</span> <br>
                  @else
                    <span class="ml-1">Köttilldelning: {{ $meat_to }}</span> <br>
                  @endif
                  
                @endif
              @endif

              @if(isset($_GET['locked']))
                @if($_GET['locked'] != '')
                  @if( $_GET['locked'] == 'yes')
                    <span class="ml-1">Låst: Ja</span> <br>
                  @else
                    <span class="ml-1">Låst: Nej</span> <br>
                  @endif
                @endif
              @endif

              @if(isset($_GET['kind']))
                @if($_GET['kind'] != '')
                  <span class="ml-1">Sorts jakt: {{ $_GET['kind'] }}</span> <br>
                @endif
              @endif
            @else
              <span style="font-weight:bold"><b>Sökning utan filter:</b></span><br>
            @endif
            <div style="border-top: 1px dashed #d8d8d8;">
              Antal träffar: <?= count($killreports) ?> st
            </div>
          </div>
      <!-- </p> -->
</div>
</div>
<!-- /filter -->


    <!-- Card deck -->
  <div class="card-deck clearfix">

    @foreach($killreports as $killreport)
        
      <!-- Card -->
      <div class="card mb-4" style="min-width: 300px; max-height:1000px;">

        <!-- översta kanten med killreport->id -->
        <!-- <div class="text-left" style="background-color: #dccc9b;"> -->
          <!-- <div class="text-left" style="background-color: rgb(85 93 145);"> -->
          <div class="text-left" style="background-color: white">
          <p class="pl-2 card-text" style="font-size: 12px; color: black;">#{{$killreport->id}}</p>
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
        <div style="margin-top:-20px; z-index: 1;">
          <span class="badge" > <span class="fas fa-images"></span> {{count($killreport->images) }}</span>
        </div>
        <!--/Card image-->

        <!--Card content-->
        <div class="card-body">

          @if(isset($killreport->display_image()->description))
          <blockquote class="blockquote">
            <p class="card-text" style="font-size: 12px;">"<?= $killreport->display_image() == "default_display.jpg" ? "" : $killreport->display_image()->description ?>"</p>
          </blockquote>
            
            <hr>
          @endif

          @if($killreport->report_status == 'yellow')
            <div class="w-100 d-flex flex-row justify-content-between" style="color: <?= $killreport->area()->area_name == 'Småris' ? 'black' : '#828282' ?>;  background-color: <?= $killreport->area()->area_name == 'Småris' ? '#ffbb33' : 'rgb(239 239 239)' ?>; padding-top: 3px; padding-left: 5px; padding-right: 5px; height: 25px;">
              <p style="font-size: 12px;"><span class="fas fa-exclamation-triangle"></span> Rapporten ej klar!</p>
              @if($killreport->locked == 'yes')
                <p style="font-size: 12px;"><span class="fas fa-lock"></span> Låst!</p>
              @else
                <p style="font-size: 12px;"><span class="fas fa-lock-open"></span> Olåst!</p>
              @endif
            </div>
          @elseif($killreport->report_status == 'green')
            <div class="w-100 d-flex flex-row justify-content-between" style="background-color: rgb(145 214 148); padding-top: 3px; padding-left: 5px; padding-right: 5px; height: 25px;">
              <p style="font-size: 12px;"><span class="fas fa-clipboard-check"></span> Rapporten klar!</p>
              @if($killreport->locked == 'yes')
                <p style="font-size: 12px;"><span class="fas fa-lock"></span> Låst!</p>
                @else
                <p style="font-size: 12px;"><span class="fas fa-lock-open"></span> Olåst!</p>
              @endif
            </div>
          @endif
          <!-- <span class="card-text" style="font-size: 12px;"><strong>BILDTEXT</strong></span><br> -->
          
        

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
                <td style="font-size: 12px;">{{$killreport->animal()['species']}} - {{ $killreport->animal()['speciestype'] == "unknown" ? "Klassificering ej satt" : $killreport->animal()['speciestype'] }}<?= $killreport->animal()['antlers'] ? "; " . $killreport->animal()['antlers'] : "" ?></td>
              </tr>
              <tr>
                <td style="font-size: 12px; font-weight: bold;"><strong>Skytt:</strong></td>
                <td style="font-size: 12px;">{{$killreport->shooter['firstname'] != "-" ? $killreport->shooter['firstname'] ." ". $killreport->shooter['lastname'] : "Skytt ej satt"}}, [{{$killreport->kindofhunt}}]</td>
              </tr>
              <tr>
                <td style="font-size: 12px; font-weight: bold;"><strong>Område:</strong></td>
                <td style="font-size: 12px;">{{$killreport->area()['area_name']}}</td>
              </tr>
              @if(!is_null($killreport->place))
                <tr>
                  <td style="font-size: 12px; font-weight: bold;"><strong>Plats:</strong></td>
                  <td style="font-size: 12px;">{{$killreport->place}}</td>
                </tr>
              @endif
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
                    <td style="font-size: 12px; font-weight: bold;"><?= $meat->get_users_name() == '- -' ? 'Utanför jaktlaget' : $meat->get_users_name()?>:</td>
                    <td style="font-size: 12px;">{{$meat->share_kilogram}} kg</td>
                  </tr>
                @endif
              @endforeach
              </tbody>
            </table>
            <i class="card-text" style="font-size: 12px;">{{$killreport->animal()->waste_notes}}</i>
          </div>

        
        </div>
        <!--/Card content-->

        <!-- footer -->
        <div class="d-flex flex-row justify-content-around card-footer">
          <button class="btn btn-mdb-color btn-sm"><a href="{{url($killreport->path())}}" style="color: white;">Rapporten</a></button>
          <button class="btn btn-mdb-color btn-sm"><a href="{{url( '/image/'.$killreport->id.'/edit' )}}" style="color: white;">Bilder</a></button>

        </div>
        <!-- /footer -->

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
