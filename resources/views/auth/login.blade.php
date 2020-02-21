@extends('layouts.app')

@section('content')
<div class="container">
<!-- <h1>hej</h1> -->
    <material-login-form 
    :post-url='{!! json_encode(url("login")) !!}'
    :resetbymail-url='{!! json_encode(url("password")) !!}'>
    </material-login-form>
</div>
@endsection
