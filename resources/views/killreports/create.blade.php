@extends('layouts.app')

@section('content')
<div class="container">
  <killreport-create 
  :account-page='{!! json_encode(url(Auth::user()->path())) !!}' 
  :auth-user="{{ Auth::user() }}" 
  :hunters="{{ $hunters }}" 
  :anonhunter="{{ $anonhunter }}" 
  :areas="{{ $areas }}" 
  :meats="{{ $meats }}" 
  :meat-moose-total='{{ json_encode($meat_moose_total) }}' 
  :meat-reddeer-total='{{ json_encode($meat_reddeer_total) }}' 
  :meat-fallowdeer-total='{{ json_encode($meat_fallowdeer_total) }}' 
  :meat-roedeer-total='{{ json_encode($meat_roedeer_total) }}' 
  :meat-boar-total='{{ json_encode($meat_boar_total) }}' 
  :meat-moose-this-season='{{ json_encode($meat_moose_this_season) }}' 
  :meat-reddeer-this-season='{{ json_encode($meat_reddeer_this_season) }}' 
  :meat-fallowdeer-this-season='{{ json_encode($meat_fallowdeer_this_season) }}' 
  :meat-roedeer-this-season='{{ json_encode($meat_roedeer_this_season) }}' 
  :meat-boar-this-season='{{ json_encode($meat_boar_this_season) }}' 
  :animal-url='{!! json_encode(url("animals/store")) !!}' 
  :killreport-url='{!! json_encode(url("killreports/store")) !!}' 
  :killreport-index-url='{!! json_encode(url("killreports")) !!}'
  :meat-url='{!! json_encode(url("meat/store")) !!}' ></killreport-create>
</div>
@endsection