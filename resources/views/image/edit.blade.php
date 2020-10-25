

@extends('layouts.app')

@section('content')
<image-edit
    :killreport="{{ json_encode($killreport) }}"
    :auth-user="{{ Auth::user() }}"
    :image-store-url='{!! json_encode(url("image/".$killreport->id."/store")) !!}'
    :image-base-url='{!! json_encode(url("image")) !!}'
    :file-store-url='{!! json_encode(url("file/store")) !!}'
></image-edit>

@endsection