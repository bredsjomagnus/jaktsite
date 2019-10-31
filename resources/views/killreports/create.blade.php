@extends('layouts.app')

@section('content')
<div class="container">
  <killreport-create :auth-user="{{ Auth::user() }}"></killreport-create>
</div>

@endsection