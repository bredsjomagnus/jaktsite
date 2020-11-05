<?php

namespace App\Http\Controllers;

use App\Animal;
use Illuminate\Http\Request;

class AnimalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function index()
    // {
    //     //
    // }

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
     * @return Illuminate\Http\JsonResponse 
     */
    public function store()
    {
        $animal = new Animal;
        $animal = $animal->create(request()->all());
    
        return response()->json(['animal' => $animal]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Animal  $animal
     * @return \Illuminate\Http\Response
     */
    // public function show(Animal $animal)
    // {
    //     //
    // }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Animal  $animal
     * @return \Illuminate\Http\Response
     */
    // public function edit(Animal $animal)
    // {
    //     //
    // }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Animal  $animal
     * @return Array <string, string>
     */
    public function update(Request $request, Animal $animal)
    {   
        $animal->update(request()->all());

        return ['animalresponse' => 'update ok'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Animal  $animal
     * @return \Illuminate\Http\Response
     */
    // public function destroy(Animal $animal)
    // {
    //     //
    // }
}
