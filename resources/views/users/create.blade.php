@extends('layouts.app')

@section('content')
<div class="container">
<material-register-form :store-url='{!! json_encode(url("user/store")) !!}' :create-url='{!! json_encode(url("user/create")) !!}'></material-register-form>
</div>
@endsection