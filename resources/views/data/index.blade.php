@extends('layouts.app')

@section('content')

    <data-index 
    :hunters="{{ $hunters }}"
    :anonhunter="{{ $anonhunter }}"
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
    >
    </data-index>

@endsection
