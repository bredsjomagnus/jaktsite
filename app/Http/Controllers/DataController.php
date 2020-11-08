<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\MeatSum;

use App\User;

class DataController extends Controller
{
    use MeatSum;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // The over all seasons total summed and sorted list of users shared_kilograms; ['user_id'] => sum (float)
        $user_boar_total                = $this->sumMeatWrapper('Vildsvin', 'total');
        $user_moose_total               = $this->sumMeatWrapper('Älg', 'total');
        $user_reddeer_total             = $this->sumMeatWrapper('Kronvilt', 'total');
        $user_fallowdeer_total          = $this->sumMeatWrapper('Dovvilt', 'total');
        $user_roedeer_total             = $this->sumMeatWrapper('Rådjur', 'total');

        // The over all seasons average sorted list of users shared_kilograms; ['user_id'] => sum (float)
        $year_back = 7; // antalet år bakåt medelvärdet skall räknas på.
        $user_boar_average              = $this->sumMeatWrapper('Vildsvin', 'average', $year_back);
        $user_moose_average             = $this->sumMeatWrapper('Älg', 'average', $year_back);
        $user_reddeer_average           = $this->sumMeatWrapper('Kronvilt', 'average', $year_back);
        $user_fallowdeer_average        = $this->sumMeatWrapper('Dovvilt', 'average', $year_back);
        $user_roedeer_average           = $this->sumMeatWrapper('Rådjur', 'average', $year_back);

        $data = [
            'hunters'                       => User::where('occupation', 'hunter')->where('role', '!=', 'guest')->get(),
            'anonhunter'                    => User::where('occupation', 'anonhunter')->limit(1)->get(),
            'meat_moose_average'            => $user_moose_average,
            'meat_reddeer_average'          => $user_reddeer_average,
            'meat_fallowdeer_average'       => $user_fallowdeer_average,
            'meat_roedeer_average'          => $user_roedeer_average,
            'meat_boar_average'             => $user_boar_average,
            'meat_moose_total'              => $user_moose_total,
            'meat_reddeer_total'            => $user_reddeer_total,
            'meat_fallowdeer_total'         => $user_fallowdeer_total,
            'meat_roedeer_total'            => $user_roedeer_total,
            'meat_boar_total'               => $user_boar_total,
        ];

        return view('data.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function create()
    // {
    //     //
    // }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    // public function store(Request $request)
    // {
    //     //
    // }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function show($id)
    // {
    //     //
    // }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function edit($id)
    // {
    //     //
    // }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function update(Request $request, $id)
    // {
    //     //
    // }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function destroy($id)
    // {
    //     //
    // }
}
