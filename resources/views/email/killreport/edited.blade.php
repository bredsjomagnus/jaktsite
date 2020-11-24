<h3>#{{$killreport->id}} Rapport har ändrats av {{$user->firstname}} {{$user->lastname}}, {{ date("Y-m-d, H:i:s") }}</h3>

<p>Följande förändringar gjordes:</p>
<table class="table table-striped">
<thead>
    <tr>
        <th style="text-align: left">Vad</th>
        <th style="text-align: left">Gamla värdet</th>
        <th></th>
        <th style="text-align: left">Nya värdet</th>
    </tr>
</thead>
<tbody>
    @foreach($old as $key => $value)
    <tr>
        <td>[{{$key}}]</td>
        <td>{{$value}}</td>
        <td> > </td>
        <td>{{$new[$key]}}</td>
    </tr>
    @endforeach
</tbody>
</table>