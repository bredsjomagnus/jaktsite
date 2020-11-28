
@extends('layouts.app')

@section('content')
<avatar-image-edit
    :auth-user="{{ Auth::user() }}"
    :avatar="{{ json_encode($avatar) }}"
    :avatar-base-url='{!! json_encode(url("avatar")) !!}'
    :file-base-url='{!! json_encode(url("avatarfile")) !!}' 
    :storage-base-url='{{ json_encode(asset("storage/images/avatars")) }}'
></avatar-image-edit>


@endsection