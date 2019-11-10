@extends('layouts.app')

@section('content')
<div class="container">
  <killreport-create :account-page='{!! json_encode(url(Auth::user()->path())) !!}' :auth-user="{{ Auth::user() }}" :hunters="{{ $hunters }}" :areas="{{ $areas }}" :animal-url='{!! json_encode(url("animals/store")) !!}' :killreport-url='{!! json_encode(url("killreports/store")) !!}' :killreport-index-url='{!! json_encode(url("killreports")) !!}' ></killreport-create>
</div>

@endsection