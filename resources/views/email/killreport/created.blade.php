<h3>Ny rapport skapad</h3>
<div class="mt-2 mb-4 w-100" style="border-bottom: 1px solid #D8D8D8;">
    <span class="card-text" style="font-size: 14px;"><strong>RAPPPORTDATA</strong></span><br>
    <table class="w-100 card-text table-striped" >
        <tr>
        <td style="font-size: 14px; font-weight: bold;">Rapportör:</td>
        <td style="font-size: 12px;">{{$user->firstname}} {{$user->lastname}}</td>
        </tr>
        <tr>
        <td style="font-size: 14px; font-weight: bold;">Datum:</td>
        <td style="font-size: 14px;">{{substr($killreport->killdate, 0, 10)}}</td>
        </tr>
        <tr>
        <td style="font-size: 14px; font-weight: bold;">Djur:</td>
        <td style="font-size: 14px;">{{$killreport->animal()['species']}} - {{ $killreport->animal()['speciestype'] == "unknown" ? "Klassificering ej satt" : $killreport->animal()['speciestype'] }}<?= $killreport->animal()['antlers'] ? "; " . $killreport->animal()['antlers'] : "" ?></td>
        </tr>
        <tr>
        <td style="font-size: 14px; font-weight: bold;"><strong>Skytt:</strong></td>
        <td style="font-size: 14px;">{{$killreport->shooter['firstname'] != "-" ? $killreport->shooter['firstname'] ." ". $killreport->shooter['lastname'] : "Skytt ej satt"}}, [{{$killreport->kindofhunt}}]</td>
        </tr>
        <tr>
        <td style="font-size: 14px; font-weight: bold;"><strong>Område:</strong></td>
        <td style="font-size: 14px;">{{$killreport->area()['area_name']}}</td>
        </tr>
        @if(!is_null($killreport->place))
        <tr>
            <td style="font-size: 14px; font-weight: bold;"><strong>Plats:</strong></td>
            <td style="font-size: 14px;">{{$killreport->place}}</td>
        </tr>
        @endif
    </table>
</div>
