@extends('layouts.app')

@section('content')
<div class="container">
    <killreport-show 
    :hunters="{{ $hunters }}"
    :anonhunter="{{ $anonhunter }}"
    :auth-user="{{ Auth::user() }}" 
    :shooter="{{ $killreport->shooter }}" 
    :reporter="{{ $killreport->reporter }}" 
    :area="{{ $killreport->area() }}" 
    :areas="{{ $areas }}" 
    :animal="{{ $killreport->animal() }}" 
    :killreport="{{ $killreport }}"
    :killreport-image="{{ json_encode($killreport->display_path()) }}"
    :meats="{{ $killreport->meat }}"
    :mail-base-url='{!! json_encode(url("mail")) !!}'
    :index-url='{!! json_encode(url("killreports/")) !!}'
    :image-url='{!! json_encode(url("image/".$killreport->id."/edit")) !!}'
    :animal-url='{!! json_encode(url("animals/".$killreport->animal()->id."/update")) !!}' 
    :killreport-url='{!! json_encode(url("killreports/".$killreport->id."/update")) !!}'
    :killreport-delete-url='{!! json_encode(url("killreports/".$killreport->id."/delete")) !!}'
    :meat-url='{!! json_encode(url("meat/")) !!}'
    :season="{{ json_encode($this_season) }}"
    :meat-moose-average='{{ json_encode($meat_moose_average) }}' 
    :meat-reddeer-average='{{ json_encode($meat_reddeer_average) }}' 
    :meat-fallowdeer-average='{{ json_encode($meat_fallowdeer_average) }}' 
    :meat-roedeer-average='{{ json_encode($meat_roedeer_average) }}' 
    :meat-boar-average='{{ json_encode($meat_boar_average) }}' 
    :meat-moose-this-season='{{ json_encode($meat_moose_this_season) }}' 
    :meat-reddeer-this-season='{{ json_encode($meat_reddeer_this_season) }}' 
    :meat-fallowdeer-this-season='{{ json_encode($meat_fallowdeer_this_season) }}' 
    :meat-roedeer-this-season='{{ json_encode($meat_roedeer_this_season) }}' 
    :meat-boar-this-season='{{ json_encode($meat_boar_this_season) }}' 
    ></killreport-show>
</div>

@endsection