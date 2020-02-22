<?php

namespace App\Http\Controllers;

use App\Meat;
use App\Killreport;
use Illuminate\Http\Request;

class MeatController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        foreach(request()->all() as $row) {
            $meat = new Meat();
            $meat = $meat->create($row);
        }
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Meat  $meat
     * @return \Illuminate\Http\Response
     */
    public function show(Meat $meat)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Killreport  $killreport
     * @return \Illuminate\Http\Response
     */
    public function edit(Killreport $killreport)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Meat  $meat
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Meat $meat)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Meat  $meat
     * @return \Illuminate\Http\Response
     */
    public function destroy(Meat $meat)
    {
        //
    }
}
