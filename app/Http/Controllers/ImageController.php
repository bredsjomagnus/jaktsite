<?php

namespace App\Http\Controllers;

use App\Image;
use App\Killreport;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class ImageController extends Controller
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
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Killreport $killreport)
    {

        // Log::info($request->file);

        $image = new Image();
        $image = $image->create(request()->all());

        return response()->json(['worked' => true, 'image_id' => $image->id]);

        

        // dd($res);
        
        // $data = [
        //     'killreport_id' => $res[0]['killreport_id'],
        //     'user_id'       => $res[0]['user_id'],
        //     'name'          => $res[0]['name'],
        //     'path'          => $res[0]['path'],
        //     'created_at'    => $res[0]['created_at'],
        //     'updated_at'    => $res[0]['updated_at']

        // ];

        // dd($data);

        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function show(Image $image)
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
        // dd($killreport);
        $data = [
            'killreport'    => $killreport,
            'images'        => $killreport->images,
            'users'         => User::where('role', 'user')->orWhere('role', 'admin')->get()
        ];
        return view('image.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Image $image)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function destroy(Image $image)
    {
        if( (Auth::user()->id == $image->user_id) || (Auth::user()->role == 'admin') ) {
            $image->delete();

            return response()->json(['message' => $image->id." ".$image->name." deleted"]);
        }

        return response()->json(['message' => $image->id." ".$image->name." NOT deleted"]);
    }
}
