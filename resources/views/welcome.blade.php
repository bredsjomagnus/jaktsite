@extends('layouts.welcome_app')

@section('content')

<div class="jumbotron card card-image" style="background-image: url('{{asset('images/res/elk12.JPG')}}')">
  <div class="text-white text-center py-5 px-4">
    <div>
      <h4>RAPPORTERING AV DJUR</h4>
      <p class="mx-5 mb-5">Ett rapporteringsverktyg tillgängligt för medlemmar av Småris jaktlag.
      </p>
      <a class="btn btn-outline-white btn-md" href="{{url('login')}}"><i class="fas fa-clone left"></i> Logga in</a>
       
    </div>
  </div>
</div>

@endsection


