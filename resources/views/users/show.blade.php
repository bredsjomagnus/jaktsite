@extends('layouts.app')

@section('content')
<div class="container">
  <material-profile-card 
  :killreporturl='{!! json_encode(url("killreports/create")) !!}' 
  :killreportindexurl='{!! json_encode(url("killreports")) !!}' 
  :killreports='{{ $killreports }}'
  :meat-moose-average='{{ json_encode($meat_moose_average) }}' 
  :meat-reddeer-average='{{ json_encode($meat_reddeer_average) }}' 
  :meat-fallowdeer-average='{{ json_encode($meat_fallowdeer_average) }}' 
  :meat-roedeer-average='{{ json_encode($meat_roedeer_average) }}' 
  :meat-boar-average='{{ json_encode($meat_boar_average) }}' 
  :meat-moose-total='{{ json_encode($meat_moose_total) }}' 
  :meat-reddeer-total='{{ json_encode($meat_reddeer_total) }}' 
  :meat-fallowdeer-total='{{ json_encode($meat_fallowdeer_total) }}' 
  :meat-roedeer-total='{{ json_encode($meat_roedeer_total) }}' 
  :meat-boar-total='{{ json_encode($meat_boar_total) }}'
  :adminurl='{!! json_encode(url("admin")) !!}' 
  :logouturl='{!! json_encode(url("logout")) !!}' 
  :welcomeurl='{!! json_encode(url("")) !!}' 
  :userreportsurl='{!! json_encode(url(Auth::user()->path()."/killreports")) !!}' 
  :avatarurl='{!! json_encode(url("avatar/".Auth::user()->id."/edit")) !!}' 
  :auth-user="{{ Auth::user() }}" 
  :avatar="{{ json_encode($avatar) }}"
  :storage-base-url='{{ json_encode(asset("storage/images/avatars")) }}'
  :gravatar-src='{!! json_encode( Gravatar::src(Auth::user()->email)) !!}'>
  </material-profile-card>
</div>

@endsection