
@extends('layouts.app')

@section('content')
<killreport-image-edit
    :killreport="{{ json_encode($killreport) }}"
    :auth-user="{{ Auth::user() }}"
    :users='{{ json_encode($users)}}'
    :image-store-url='{!! json_encode(url("image/".$killreport->id."/store")) !!}'
    :image-base-url='{!! json_encode(url("image")) !!}'
    :file-store-url='{!! json_encode(url("killreportfile/store")) !!}'
    :images='{{ json_encode($images) }}'
    :storage-base-url='{{ json_encode(asset("storage/images/killreports")) }}'
    :killreport-url='{!! json_encode(url("killreports/".$killreport->id)) !!}'
    :image-base-url='{!! json_encode(url("image")) !!}'
    :file-base-url='{!! json_encode(url("killreportfile")) !!}'
    :killreport-index-url='{!! json_encode(url("killreports")) !!}'
></killreport-image-edit>

@endsection