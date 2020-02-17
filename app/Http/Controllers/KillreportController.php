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

        // Summed and sorted list of users shared_kilograms; ['user_id'] => sum (float)
        $user_moose             = $this->sumMeatWrapper('Älg');
        $user_reddeer           = $this->sumMeatWrapper('Kronvilt');
        $user_fallowdeer        = $this->sumMeatWrapper('Dovvilt');
        $user_roedeer           = $this->sumMeatWrapper('Rådjur');
        $user_boar              = $this->sumMeatWrapper('Vildsvin');
        
        $data = [
            'hunters'           => User::where('occupation', 'hunter')->get(),
            'anonhunter'        => User::where('occupation', 'anonhunter')->limit(1)->get(),
            'areas'             => Area::all(),
            'meats'             => $meats,
            'meat_moose'        => $user_moose,
            'meat_reddeer'      => $user_reddeer,
            'meat_fallowdeer'   => $user_fallowdeer,
            'meat_roedeer'      => $user_roedeer,
            'meat_boar'         => $user_boar,
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
    public function getSpeciesMeat($specie)
    {
        $meats = Meat::all();
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
        $hunters = User::where('occupation', 'hunter')->get();
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
        $sorted = asort($user_meat);
        return $user_meat;
    }

    public function sumMeatWrapper($value)
    {
        $sm_res     = $this->getSpeciesMeat($value);
        $utm_res    = $this->groupUserToMeat($sm_res);
        $filled_res = $this->fillOutGroups($utm_res);
        return $this->sumUserMeat($utm_res);
    }
    

    // Skapar grupper 
    // killreport_id => [user_id, user_id]
    // killreport_id => [user_id, user_id]
    // $moose = $meats->mapToGroups(function ($item, $key) {
    //     return [$item['killreport_id'] => $item['user_id']];
    // });
}
