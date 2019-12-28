@extends('layouts.app')

@section('content')
<div class="container">
    <killreport-show :hunters="{{ $hunters }}" :auth-user="{{ Auth::user() }}" :shooter="{{ $killreport->shooter }}" :reporter="{{ $killreport->reporter }}" :area="{{ $killreport->area() }}" :areas="{{ $areas }}" :animal="{{ $killreport->animal() }}" :killreport="{{  $killreport }}"></killreport-show>
</div>

@endsection