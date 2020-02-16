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
  :meat-moose='{{ json_encode($meat_moose) }}' 
  :meat-reddeer='{{ json_encode($meat_reddeer) }}' 
  :meat-fallowdeer='{{ json_encode($meat_fallowdeer) }}' 
  :meat-roedeer='{{ json_encode($meat_roedeer) }}' 
  :meat-boar='{{ json_encode($meat_boar) }}' 
  :animal-url='{!! json_encode(url("animals/store")) !!}' 
  :killreport-url='{!! json_encode(url("killreports/store")) !!}' 
  :killreport-index-url='{!! json_encode(url("killreports")) !!}' ></killreport-create>
</div>
@endsection