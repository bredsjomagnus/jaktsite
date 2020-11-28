
@extends('layouts.app')

@section('content')
<avatar-image-edit
    :auth-user="{{ Auth::user() }}"
    :avatar="{{ json_encode($avatar) }}"
    :avatar-base-url='{!! json_encode(url("avatar")) !!}'
    :file-base-url='{!! json_encode(url("avatarfile")) !!}' 
    :storage-base-url='{{ json_encode(asset("storage/images/avatars")) }}'
    :user-show-url='{{ json_encode(url(Auth::user()->path()))}}'
></avatar-image-edit>


@endsection