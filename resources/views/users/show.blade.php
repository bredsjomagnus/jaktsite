@extends('layouts.app')

@section('content')
<div class="container">
  <material-profile-card 
  :killreporturl='{!! json_encode(url("killreports/create")) !!}' 
  :killreportindexurl='{!! json_encode(url("killreports")) !!}' 
  :adminurl='{!! json_encode(url("admin")) !!}' 
  :auth-user="{{ Auth::user() }}" 
  :gravatar-src='{!! json_encode( Gravatar::src(Auth::user()->email)) !!}'>
  </material-profile-card>
</div>

@endsection