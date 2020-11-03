@extends('layouts.app')

@section('content')

<!-- container -->
<div class="container">
  <div class="d-flex justify-content-center" style="margin-top: -20px; margin-bottom: 5px;">
    <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
      <button class="btn btn-mdb-color btn-sm" ><a style="color: white;" href="{{ url(auth()->user()->path()) }}">Min sida</a></button>
      <button class="btn btn-mdb-color btn-sm" ><a style="color: white;" href="{{ url('/killreports/create') }}">Rapportera</a></button>
    </div>
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
              <a href="{{url( '/image/'.$killreport->id.'/edit' )}}">
                  <div class="mask rgba-white-slight"><span></span></div>
              </a>

          </div>
          <!--/Card image-->

          <!--Card content-->
          <div class="card-body" style="border-left: 5px solid {{ $killreport->report_status }}">

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
