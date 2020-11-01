@extends('layouts.admin_app')

@section('content')

<admin-index
    :account-page='{!! json_encode(url(Auth::user()->path())) !!}'
    :accounts="{{ $users }}"
></admin-index>
@endsection