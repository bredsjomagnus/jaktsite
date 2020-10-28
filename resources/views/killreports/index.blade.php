@extends('layouts.app')

@section('content')
<style>
  .cell_size {
    font-size: 10px;
  }
</style>
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

                <!--Card image-->
                <div class="view overlay">
                    <!-- <img class="card-img-top" src="https://lh3.googleusercontent.com/8S0LLfZsIGDHXfudM9bg_2OAORYZ-bx4GCbhBLkmMvikst77hjMw0B-6-hDmjhIZP3VzOQHRpo6Hbi368LMwE1xmMGl31_IRYQyCjQE--g5_jTsLibf-A7Ov3l8LP6sIqrSRj97g8gMRwdF1KSKVrfXy7qAFVAZmtZDKZJhHAZKSCqa7fTewv2RM8qFi0GL_onMhytsIwa4vBJBCW7oEW9HDxr0B5efHTg6dEOmsYSxlr3Kv3wx6-I8HmWpPpRgSBYNYzHoR71Bxaubc2ZY_uLQjvI8DlBKM0SgMK2qg51Y25-Cj7KLZrDE4QpaHJH5T3b7MTVeODFkmipbbcIH5T8BUQnfBvwrlRy1xZbseanPC2bE7lOrjeUxbnjaDDb5m02apwJvBEKdKnmvOV-MAe7zGM89eRGy5b3vVWeLV8cBFo9IvrVtwBCdo86Zr7MYhGx-xVduq7OD_H4MhfxcHeukDPJ8kuv0la3x2yXW8x77IASD9sagMsI0GrPO8tOl9b0FApdfgHocF804wpQZZBGlenj-kIgy2Cz-4OJ0i1nHi5RfVZtG7cUOwIRmosFSh3iI3DeAxsrfQCWZv3sggM1mNgo9ZfTnI9DdcG1hPW28-zFGe9AGD4u6Nr06be_hD1nViM6SuRpaEzB78Do-qRdXeNMPTzL0dQnNvuyLJ4QUKWTSE2u50f-JArlhYohk9WTmIgKiCdtKMPZRkxbbMuvEG3dOM0qjQ1E22yrYmKBD_vaRB=w1579-h888-no" alt="Card image cap"> -->
                    
                    
                    
                    <!-- <img class="card-img-top" src="{{ asset('images/hunterimages/'.$killreport->image) }}" alt="fuck"> -->
                    <!-- <img class="card-img-top lazy" data-src="{{ asset('images/huntingimages/'.$killreport->image) }}" alt=""> -->
                    <img class="card-img-top lazy" data-src="{{ $killreport->display_path() }}?<?php $date = new DateTime(); echo $date->getTimestamp(); ?>" alt="">
                     
                    <a href="#!">
                        <div class="mask rgba-white-slight"><span></span></div>
                    </a>
                </div>

                <!--Card content-->
                <div class="card-body" style="border-left: 5px solid {{ $killreport->report_status }}">
                    
                    <!--Title-->               
                    <h6 class="card-text" style="border-bottom: 1px solid #D8D8D8;">RAPPORT #{{$killreport->id}} - DATUM: {{substr($killreport->killdate, 0, 10)}}</h6>
                   
                   
                    <!-- Beskrivning -->
                    <div style="border-bottom: 1px solid #D8D8D8;">
                      <span class="card-text" style="font-size: 12px;"><strong>BILDTEXT</strong></span><br>
                      <i class="card-text" style="font-size: 12px;"><?= $killreport->display_image() == "default_display.jpg" ? "Bildtext saknas" : $killreport->display_image()->description ?></i>
                    </div>

                    <div class="mt-2 mb-4" style="border-bottom: 1px solid #D8D8D8;">
                     <span class="card-text" style="font-size: 12px;"><strong>RAPPPORTDATA</strong></span><br>
                      <table class="card-text" >
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
                    <div class="mt-2 mb-4" style="border-bottom: 1px solid #D8D8D8;">
                      <span class="card-text" style="font-size: 12px;"><strong>KÖTTILLDELNING</strong></span><br>
                      <table class="card-text" >
                      @foreach($killreport->meat as $meat)
                        @if(!is_null($meat->user_id))
                          <tr>
                            <td style="font-size: 12px; font-weight: bold;"><?= $meat->get_users_name() == '- -' ? 'Gäst' : $meat->get_users_name()?>:</td>
                            <td style="font-size: 12px;">{{$meat->share_kilogram}} kg</td>
                          </tr>
                        @endif
                      @endforeach
                      </table>
                     </div>
                    <!-- <p class="card-text">Skytt: </p> -->
                    <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                    <!-- <button type="button" class="btn btn-light-blue btn-md">Read more</button> -->
                    <button class="btn btn-mdb-color btn-sm"><a href="{{url($killreport->path())}}" style="color: white;">Rapporten</a></button>
                    <button class="btn btn-mdb-color btn-sm"><a href="{{url( '/image/'.$killreport->id.'/edit' )}}" style="color: white;">Bilder</a></button>

                </div>

            </div>
            <!-- Card -->
            
        @endforeach

    </div>
    <!-- Card deck -->

   
</div>

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
