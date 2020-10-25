<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class FileController extends Controller
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
        // begränsning för när bilden komprimeras
        $limit = 2000000;

        // filen
        $file = $request->file('file');

        // bilden som GD från image intervention
        $img = Image::make($request->file('file'));

        // bildstorlek
        $size = $img->filesize();

        // filename
        $filename = $request->file('file')->getClientOriginalName();

        // splitar upp namnet så att jag kan komma åt formatet
        $filearray = explode('.', $filename);

        // filformat
        $format = $filearray[1];

        
        // om bilden är valid och storleken är mindre än ovan satta limit
        if( $request->file('file')->isValid() && $size < $limit) {

            // spara bilden i images/killreports
            $path = $request->file('file')->storeAs('images/killreports', $filename, 'public');
        } else {

            // om bildstorleken är större än ovan satta limit
            if($size > $limit) {

                // kvalitén som skall sättas beror på förhållandet limit och bildstorlek
                $quality = floor(($limit/$size)*100);
 
                // komprimera med ovan beräknade kvalitétsfaktor
                $newimg = Image::make($file->getRealPath())->encode(strtolower($format), $quality);

                // spara bilden i images/killreports
                Storage::disk('local')->put('public/images/killreports/'.$filename, $newimg);
            }
        }

        
        // kontroll om bilden nu finns i images/killreports
        if( Storage::disk('public')->exists('images/killreports/'.$filename) ) {
            return response()->json( ['message' => 'success'] );
        } else {
            return response()->json( ['message' => 'failure'] );
        }
      
        
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
