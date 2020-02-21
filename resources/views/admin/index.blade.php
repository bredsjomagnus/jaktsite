@extends('layouts.app')

@section('content')
<div class="container">
    <div class="d-flex justify-content-center">
        <h1>ADMINSIDAN</h1>
    </div>
    <div class="d-flex justify-content-center">
    <table id="dt-basic-checkbox" class="table table-striped table-bordered" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Användarnamn
      </th>
      <th class="th-sm">Förnamn
      </th>
      <th class="th-sm">Efternamn
      </th>
    </tr>
  </thead>
  <tbody>
        @foreach($users as $user)
            <tr>
                <td>{{$user->username}}</td>
                <td>{{$user->firstname}}</td>
                <td>{{$user->lastname}}</td>
            </tr>
        @endforeach
    </body>
    </table>
        
    </div>
</div>
@endsection

<script type="text/javascript">
$('#dt-basic-checkbox').dataTable({

columnDefs: [{
orderable: false,
className: 'select-checkbox',
targets: 0
}],
select: {
style: 'os',
selector: 'td:first-child'
}
});
</script>