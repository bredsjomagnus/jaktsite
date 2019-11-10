@extends('layouts.app')

@section('content')
<div class="container">
    <!-- Card deck -->
    <div class="card-deck clearfix">

        @foreach($killreports as $killreport)

            <!-- Card -->
            <div class="card mb-4" style="min-width: 300px; max-height:500px;">

                <!--Card image-->
                <div class="view overlay">
                    <!-- <img class="card-img-top" src="https://lh3.googleusercontent.com/8S0LLfZsIGDHXfudM9bg_2OAORYZ-bx4GCbhBLkmMvikst77hjMw0B-6-hDmjhIZP3VzOQHRpo6Hbi368LMwE1xmMGl31_IRYQyCjQE--g5_jTsLibf-A7Ov3l8LP6sIqrSRj97g8gMRwdF1KSKVrfXy7qAFVAZmtZDKZJhHAZKSCqa7fTewv2RM8qFi0GL_onMhytsIwa4vBJBCW7oEW9HDxr0B5efHTg6dEOmsYSxlr3Kv3wx6-I8HmWpPpRgSBYNYzHoR71Bxaubc2ZY_uLQjvI8DlBKM0SgMK2qg51Y25-Cj7KLZrDE4QpaHJH5T3b7MTVeODFkmipbbcIH5T8BUQnfBvwrlRy1xZbseanPC2bE7lOrjeUxbnjaDDb5m02apwJvBEKdKnmvOV-MAe7zGM89eRGy5b3vVWeLV8cBFo9IvrVtwBCdo86Zr7MYhGx-xVduq7OD_H4MhfxcHeukDPJ8kuv0la3x2yXW8x77IASD9sagMsI0GrPO8tOl9b0FApdfgHocF804wpQZZBGlenj-kIgy2Cz-4OJ0i1nHi5RfVZtG7cUOwIRmosFSh3iI3DeAxsrfQCWZv3sggM1mNgo9ZfTnI9DdcG1hPW28-zFGe9AGD4u6Nr06be_hD1nViM6SuRpaEzB78Do-qRdXeNMPTzL0dQnNvuyLJ4QUKWTSE2u50f-JArlhYohk9WTmIgKiCdtKMPZRkxbbMuvEG3dOM0qjQ1E22yrYmKBD_vaRB=w1579-h888-no" alt="Card image cap"> -->
                    
                    
                    
                    <!-- <img class="card-img-top" src="{{ asset('images/hunterimages/'.$killreport->image) }}" alt="fuck"> -->
                    <img class="card-img-top" src="{{ asset('images/huntingimages/'.$killreport->image) }}" alt="fuck">
                    <a href="#!">
                        <div class="mask rgba-white-slight"></div>
                    </a>
                </div>

                <!--Card content-->
                <div class="card-body" style="border-left: 5px solid {{ $killreport->report_status }}">

                    <!--Title-->
                    
                    <h6 class="card-title">{{substr($killreport->killdate, 0, 10)}}</h6>
                    <!--Text-->
                    <p class="card-text">{{$killreport->shooter['firstname']}}; {{$killreport->animal()['species']}}, {{$killreport->area()['area_name']}}</p>
                    <!-- <p class="card-text">Skytt: </p> -->
                    <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                    <!-- <button type="button" class="btn btn-light-blue btn-md">Read more</button> -->
                    <button type="button" class="btn btn-mdb-color btn-sm">Rapporten</button>

                </div>

            </div>
            <!-- Card -->
        @endforeach

    </div>
    <!-- Card deck -->

   
</div>

@endsection