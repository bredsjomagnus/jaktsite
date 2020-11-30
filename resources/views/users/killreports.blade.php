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
    <h4>"DINA" RAPPORTER</h4>
  </div>
  <div>
    <p style="font-size: 14px;">De rapporter där du står som skytt eller där du fått köttilldelat.</p>
  </div>
   <div style="border-top: 1px dashed #d8d8d8; font-size: 14px;">
        Antal träffar: <?= count($killreports) ?> st
    </div>


    
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


