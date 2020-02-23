<?php

namespace App\Http\Controllers;

use App\Killreport;
use Illuminate\Http\Request;

use App\User;
use App\Area;
use App\Animal;
use App\Meat;

class KillreportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $killreports = Killreport::where('deleted_at', null)->orderBy('killdate', 'desc')->get();

        return view('killreports.index', compact('killreports'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        $meats                  = Meat::all();
        $this_season            = $this->getSeason(date('Y-m-d'));

        // The over all seasons total summed and sorted list of users shared_kilograms; ['user_id'] => sum (float)
        $user_boar_total              = $this->sumMeatWrapper('Vildsvin', 'total');
        $user_moose_total             = $this->sumMeatWrapper('Älg', 'total');
        $user_reddeer_total           = $this->sumMeatWrapper('Kronvilt', 'total');
        $user_fallowdeer_total        = $this->sumMeatWrapper('Dovvilt', 'total');
        $user_roedeer_total           = $this->sumMeatWrapper('Rådjur', 'total');

        // This seasons summed and sorted lists of users shared_kilograms; ['user_id'] => sum (float)
        $user_boar_this_season              = $this->sumMeatWrapper('Vildsvin', $this_season);
        $user_moose_this_season             = $this->sumMeatWrapper('Älg', $this_season);
        $user_reddeer_this_season           = $this->sumMeatWrapper('Kronvilt', $this_season);
        $user_fallowdeer_this_season        = $this->sumMeatWrapper('Dovvilt', $this_season);
        $user_roedeer_this_season           = $this->sumMeatWrapper('Rådjur', $this_season);
        
        
        $data = [
            'hunters'                       => User::where('occupation', 'hunter')->where('role', '!=', 'guest')->get(),
            'anonhunter'                    => User::where('occupation', 'anonhunter')->limit(1)->get(),
            'areas'                         => Area::all(),
            'meats'                         => $meats,
            'meat_moose_total'              => $user_moose_total,
            'meat_reddeer_total'            => $user_reddeer_total,
            'meat_fallowdeer_total'         => $user_fallowdeer_total,
            'meat_roedeer_total'            => $user_roedeer_total,
            'meat_boar_total'               => $user_boar_total,
            'meat_moose_this_season'        => $user_moose_this_season,
            'meat_reddeer_this_season'      => $user_reddeer_this_season,
            'meat_fallowdeer_this_season'   => $user_fallowdeer_this_season,
            'meat_roedeer_this_season'      => $user_roedeer_this_season,
            'meat_boar_this_season'         => $user_boar_this_season,
        ];
        return view('killreports.create', $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $killreport = new Killreport();
        $killreport = $killreport->create(request()->all());

        // $killreports = Killreport::where('deleted_at', null)->orderBy('killdate', 'desc')->get();
        
        // return view('killreports.index', compact('killreports'));
        return response()->json(['killreport' => $killreport]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\KillReport  $killReport
     * @return \Illuminate\Http\Response
     */
    public function show(Killreport $killreport)
    {
        // dd($killreport->shooter['username']);
        $data = [
            'killreport'    => $killreport,
            'anonhunter'    => User::where('occupation', 'anonhunter')->limit(1)->get(),
            'hunters'       => User::where('occupation', 'hunter')->get(),
            'areas'         => Area::all()
        ];
        return view('killreports.show', $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\KillReport  $killReport
     * @return \Illuminate\Http\Response
     */
    public function edit(Killreport $killreport)
    {
        return view('killreports.edit', compact('killreport'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\KillReport  $killReport
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Killreport $killreport)
    {
        $killreport->update(request()->all());

        // $killreports = Killreport::where('deleted_at', null)->orderBy('killdate', 'desc')->get();

        return ['redirect' => url('killreports')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\KillReport  $killReport
     * @return \Illuminate\Http\Response
     */
    public function destroy(KillReport $killReport)
    {
        //
    }

    /**
     * Filters out rows from meats depending on species of animal
     * 
     * @param String $species; 'Älg', 'Kronvilt',...
     * @return Object $result; rows from meats of selected species
     */
    public function getSpeciesMeat($specie, $season)
    {
        $meats = Meat::all();
        if($season != 'total') {
            $meats = $meats->filter(function($row) use ($season) {
                return $row->season() == $season;
            });
        }
        
        $result = $meats->filter(function ($row) use ($specie)  {
            return $row->isSpecies($specie);
        });

        return $result;
    }

    /**
     * Group rows in object table with user_id as key and share_kilogam as value
     * 
     * @param Object $table; a table frm filtered out rows from meats depending on species
     * @return Collection $result; 'user_id' (int) => (Array) [share_kilogram (float), share_kilogram (float),...]
     */
    public function groupUserToMeat($table)
    {
        // Skapar grupper 
        // user_id => [share_kilogram, share_kilogram,...]
        $result = $table->mapToGroups(function ($item, $key) {
            return [$item['user_id'] => $item['share_kilogram']];
        });
        return $result;
    }

    /**
     * Filles up group object with hunters that are missing and 
     * therefore have 0 shared_kilogram for this species.
     * 
     * @param Collection $result; 'user_id' (int) => (Array) [share_kilogram (float), share_kilogram (float),...]
     * @return Collection $obj; 'user_id' (int) => (Array) [share_kilogram (float), share_kilogram (float),...]
     */
    public function fillOutGroups($obj) 
    {
        $hunters = User::where('occupation', 'hunter')->where('role','!=', 'guest')->get();
        foreach($hunters as $key => $hunter) {
            if (!$obj->has($hunter->id)){
                $obj[$hunter->id] = [0];
            }
        }
        // dd($obj);
        return $obj;
    }

    /**
     * Creates Object with user data combined with total summed up shared kilogram
     * for certain species.
     * 
     * @param Collection $user_group; user_id (int) => (Array) [shared_kilogram (float), shared_kilogram (float),...]
     * @return Object $uer_meat; key (int) => 'id': user_id (int), 'username' (String), 'firstname', (String), 'lastname' (String), kg (float)
     */

    public function sumUserMeat($user_group)
    {
        $user_meat = [];
        $index = 0;
        foreach($user_group as $id => $arr) {
            $user = User::find($id);
            
            if($user) {
                if($user->occupation == 'hunter' && $user->role != 'guest') {
                    $sum = 0;
                    foreach($arr as $element) {
                        $sum = $sum + $element;
                    }
                    $user_meat[$index] = [
                        'id'            => $id, 
                        'username'      => $user->username,
                        'firstname'     => $user->firstname,
                        'lastname'      => $user->lastname,
                        'kg'            => $sum
                    ];
                    $index += 1;
                }
            }
        }
        $sorted = asort($user_meat);
        return $user_meat;
    }

    /**
     * A wrapper for getting list of objects with 
     * users [id, username, firstname, lastname, kg] for a species ($species) amd season ($season)
     * If $season is set to 'total' all kg will be summed up from the begining to now.
     * Otherwhise $season can be set to ex '19/20' and only sum up kg for this species, this season.
     * 
     * @param String $species; 'Älg' or 'Kronvilt' or.....
     * @param String $season; 'total' or '19/20' or....
     */
    public function sumMeatWrapper($species, $season)
    {
        $sm_res     = $this->getSpeciesMeat($species, $season);
        $utm_res    = $this->groupUserToMeat($sm_res);
        $filled_res = $this->fillOutGroups($utm_res);
        return $this->sumUserMeat($utm_res);
    }
    

    /**
     * Get date and return the season for that date
     * 
     * @param String $date; format YYYY-mm-dd
     * @return Stirng $season; format YY/YY eg '19/20'
     */
    public function getSeason($date)
    {
        
        $year = substr($date, 0, 4);
        $yy = substr($year, 2, 2);
        $season_last_day = $year."-06-30";
        if(strtotime($date) > strtotime($season_last_day)) {
            $yy_other = intval($yy) + 1;
            $season = strval($yy).'/'.strval($yy_other);
        } else {
            $yy_other = intval($yy) - 1;
            $season = strval($yy_other).'/'.strval($yy);
        }

        return $season;
        
    }

    // Skapar grupper 
    // killreport_id => [user_id, user_id]
    // killreport_id => [user_id, user_id]
    // $moose = $meats->mapToGroups(function ($item, $key) {
    //     return [$item['killreport_id'] => $item['user_id']];
    // });
}
