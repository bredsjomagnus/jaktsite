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
    :meats="{{ $killreport->meat }}"
    :index-url='{!! json_encode(url("killreports/")) !!}' 
    :animal-url='{!! json_encode(url("animals/".$killreport->animal()->id."/update")) !!}' 
    :killreport-url='{!! json_encode(url("killreports/".$killreport->id."/update")) !!}'></killreport-show>
</div>

@endsection