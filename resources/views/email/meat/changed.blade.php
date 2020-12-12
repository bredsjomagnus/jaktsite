<h1>Nya köttabeller</h1>

<h3>DOVVILT</h3>
<table class="table-striped w-100">
    <tbody>
        @foreach($meat_fallowdeer_average as $hunter)
            <tr>   
                <td width="80%">{{$hunter["firstname"]}} {{$hunter["lastname"]}}</td>
                <td>{{$hunter["kg"]}} kg</td>
            </tr>
        @endforeach
    </tbody>
</table>
<hr>
<h3>KRONVILT</h3>
<table class="table-striped w-100">
    <tbody>
        @foreach($meat_reddeer_average as $hunter)
            <tr>   
                <td width="80%">{{$hunter["firstname"]}} {{$hunter["lastname"]}}</td>
                <td>{{$hunter["kg"]}} kg</td>
            </tr>
        @endforeach
    </tbody>
</table>
<hr>
<h3>VILDSVIN</h3>
<table class="table-striped w-100">
    <tbody>
        @foreach($meat_boar_average as $hunter)
            <tr>   
                <td width="80%">{{$hunter["firstname"]}} {{$hunter["lastname"]}}</td>
                <td>{{$hunter["kg"]}} kg</td>
            </tr>
        @endforeach
    </tbody>
</table>
<hr>
<h3>ÄLG</h3>
<table class="table-striped w-100">
    <tbody>
        @foreach($meat_moose_average as $hunter)
            <tr>   
                <td width="80%">{{$hunter["firstname"]}} {{$hunter["lastname"]}}</td>
                <td>{{$hunter["kg"]}} kg</td>
            </tr>
        @endforeach
    </tbody>
</table>
<hr>
<h3>RÅDJUR</h3>
<table class="table-striped w-100">
    <tbody>
        @foreach($meat_roedeer_average as $hunter)
            <tr>   
                <td width="80%">{{$hunter["firstname"]}} {{$hunter["lastname"]}}</td>
                <td>{{$hunter["kg"]}} kg</td>
            </tr>
        @endforeach
    </tbody>
</table>