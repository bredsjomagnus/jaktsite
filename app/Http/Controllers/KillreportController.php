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
        $meats              = Meat::all();
        $meat_moose         = $this->getSpeciesMeat('Älg');
        $meat_reddeer       = $this->getSpeciesMeat('Kronvilt');
        $meat_fallowdeer    = $this->getSpeciesMeat('Dovvilt');
        $meat_roedeer       = $this->getSpeciesMeat('Rådjur');
        $meat_boar          = $this->getSpeciesMeat('Vildsvin');

        // Skapar grupper 
        // killreport_id => [user_id, user_id]
        // killreport_id => [user_id, user_id]
        $user_group = $meat_reddeer->mapToGroups(function ($item, $key) {
            return [$item['user_id'] => $item['share_kilogram']];
        });

        // dd($user_group);

        $user_meat = [];
        foreach($user_group as $id => $arr) {
            $user = User::find($id);
            if($user) {
                $sum = 0;
                foreach($arr as $element) {
                    $sum = $sum + $element;
                }
                $user_meat[$id] = [$sum];
            }   
        }
        $sorted = asort($user_meat);
        dd($user_meat);
        
        // dd(gettype($meats)." ".gettype((object)$meat_moose)." ".gettype($meat_reddeer)." ".gettype($meat_fallowdeer)." ".gettype($meat_roedeer)." ".gettype($meat_boar));
        $data = [
            'hunters'           => User::where('occupation', 'hunter')->get(),
            'anonhunter'        => User::where('occupation', 'anonhunter')->limit(1)->get(),
            'areas'             => Area::all(),
            'meats'             => $meats,
            'meat_moose'        => $meat_moose,
            'meat_reddeer'      => $meat_reddeer,
            'meat_fallowdeer'   => $meat_fallowdeer,
            'meat_roedeer'      => $meat_roedeer,
            'meat_boar'         => $meat_boar,
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
        // dd($specie);
        $meats = Meat::all();
        $result = $meats->filter(function ($row) use ($specie)  {
            return $row->isSpecies($specie);
        });

        return $result;
    }

    // Skapar grupper 
    // killreport_id => [user_id, user_id]
    // killreport_id => [user_id, user_id]
    // $moose = $meats->mapToGroups(function ($item, $key) {
    //     return [$item['killreport_id'] => $item['user_id']];
    // });
}
