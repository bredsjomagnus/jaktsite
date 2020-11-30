@extends('layouts.app')

@section('content')
<div class="container">
  <material-profile-card 
  :killreporturl='{!! json_encode(url("killreports/create")) !!}' 
  :killreportindexurl='{!! json_encode(url("killreports")) !!}' 
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