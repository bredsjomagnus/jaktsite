@extends('layouts.app')

@section('content')
<div class="container">
  <killreport-create :account-page='{!! json_encode(url(Auth::user()->path())) !!}' :auth-user="{{ Auth::user() }}" :hunters="{{ $hunters }}" :areas="{{ $areas }}" ></killreport-create>
</div>

@endsection