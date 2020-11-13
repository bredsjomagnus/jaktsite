@extends('layouts.app')

@section('content')

    <data-index 
    :hunters="{{ $hunters }}"
    :anonhunter="{{ $anonhunter }}"
    :user-profile-url='{!! json_encode(url(Auth::user()->path())) !!}' 
    :killreport-base-url='{!! json_encode(url("killreports")) !!}'
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
    :animal-moose='{{ $animal_moose }}'
    :animal-reddeer='{{ $animal_reddeer }}'
    :animal-fallowdeer='{{ $animal_fallowdeer }}'
    :animal-boar='{{ $animal_boar }}'
    :animal-roedeer='{{ $animal_roedeer }}'
    :kind-ensamjakt='{{ $kind_ensamjakt }}'
    :kind-gemensam-jakt='{{ $kind_gemensam_jakt }}'
    :animals-shot='{{ json_encode($animals_shot) }}'
    :animals-shot-by-guests='{{ json_encode($animals_shot_by_guests) }}'
    :reddeer-dist='{{ json_encode($reddeer_dist) }}'
    :fallowdeer-dist='{{ json_encode($fallowdeer_dist) }}'
    :moose-dist='{{ json_encode($moose_dist) }}'
    :boar-dist='{{ json_encode($boar_dist) }}'
    :roedeer-dist='{{ json_encode($roedeer_dist) }}'
    
    >
    </data-index>

@endsection
