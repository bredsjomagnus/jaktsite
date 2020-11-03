@extends('layouts.admin_app')

@section('content')

<admin-index
    :account-page='{!! json_encode(url(Auth::user()->path())) !!}'
    :accounts="{{ $users }}"
    :user-base-url='{!! json_encode(url("user")) !!}'
></admin-index>
@endsection