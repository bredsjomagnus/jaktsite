<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


class KillreportFileController extends Controller
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
     * @return Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        // begränsning för när bilden komprimeras
        $limit = 2000000;

        // filen
        $file = $request->file('file');

        Log::info("file: ".$file->getClientOriginalName());

        // bilden som GD från image intervention
        $img = Image::make($request->file('file'));

        // bildstorlek
        $size = $img->filesize();

        
        

        // filename
        $filename = $request->file('file')->getClientOriginalName();

        // exploderar filnamnet; ['k98', 'i23', 'u4', 'namnet']
        $filename_array = explode('_', $filename);

        // tar ut andra delen med image id, ex 'i23' och där tas allt med utom första i:et
        $image_id = intval(substr($filename_array[1], 1));

        Log::info('filename: '.$filename);
        Log::info($filename_array);
        Log::info($filename_array[1]);
        Log::info('image_id: '.$image_id);

        // splitar upp namnet så att jag kan komma åt formatet
        $filearray = explode('.', $filename);

        // filformat
        $format = $filearray[1];


        // om bilden är valid och storleken är mindre än ovan satta limit
        if( $request->file('file')->isValid() && $size < $limit) {
            $size_readable = $this->human_filesize($size, 2);
            DB::select('UPDATE images SET filesize = ?, filesize_readable = ? WHERE id = ?', [$size, $size_readable, $image_id]);
            

            // spara bilden i images/killreports
            // $path = $request->file('file')->storeAs('images/killreports', $filename, 'public');
            $path = $request->file('file')->storeAs('public/images/killreports', $filename, 'local');
        } else {

            // om bildstorleken är större än ovan satta limit
            if($size > $limit) {

                // kvalitén som skall sättas beror på förhållandet limit och bildstorlek
                $quality = floor(($limit/$size)*100);
                Log::info('quality: '.$quality);
                // komprimera med ovan beräknade kvalitétsfaktor

                $newimg = Image::make($file->getRealPath())->encode(strtolower($format), $quality);

                // $newimg = Image::make($request->file('file'))->encode(strtolower($format), $quality);
                // $newimg = $img->encode(strtolower($format), $quality);
                // $newimg = Image::make($file->getRealPath())->encode('jpeg', $quality);

                
                $newfilesize = $newimg->filesize();
                $newsize_readable = $this->human_filesize($newfilesize, 2);
                DB::select('UPDATE images SET filesize = ?, filesize_readable = ? WHERE id = ?', [$newfilesize, $newsize_readable, $image_id]);
                
                



                // spara bilden i images/killreports
                Storage::disk('local')->put('public/images/killreports/'.$filename, $newimg);
                
                // Storage::disk('local')->put('public/images/killreports/'.$filename, $img);

                $newfilesize = Storage::disk('local')->size('public/images/killreports/'.$filename);
                $newsize_readable = $this->human_filesize($newfilesize, 2);
                DB::select('UPDATE images SET filesize = ?, filesize_readable = ? WHERE id = ?', [$newfilesize, $newsize_readable, $image_id]);
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
     * @return Illuminate\Http\JsonResponse
     */
    public function update_rotate(Request $request, $id)
    {
        $image_res = DB::select('select * from images where id = ?', [$id]);

        if( $image_res ) {
            $image = $image_res[0];
            $name = 'k'.$image->killreport_id.'_i'.$image->id.'_u'.$image->user_id.'_'.$image->name;
            $image_path = Storage::disk('local')->path('public/images/killreports/'.$name);

            $img_gd = Image::make($image_path)->rotate(-90)->save();

            return response()->json(['message' => 'success']);
        } else {
            return response()->json(['message' => 'failure']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        // Ta fram bilden som skall tas bort ur databasen (bilden tas bort ur databasen i steg två efter att filen tagits bort)
        $image_res = DB::select('select * from images where id = ?', [$id]);

        // Om det finns en sådan bild i databasen som eftersökts
        if( count($image_res) == 1) {

            // $image_res är en array med resultat från queryn så man måste ta fram första elementet för att nå sjäva bilden
            $image = $image_res[0];

            // säkerhetskoll för att se till att det bara är admin eller själva ägaren till bilden som kan ta bort filen.
            if( (Auth::user()->id == $image->user_id) || (Auth::user()->role == 'admin') ) {
                $name = 'k'.$image->killreport_id.'_i'.$image->id.'_u'.$image->user_id.'_'.$image->name;
                Storage::disk('local')->delete('public/images/killreports/'.$name);
                return response()->json(['message' => 'success']);

            // är det inte ägaren till bilden eller admin så misslyckas försöket att radera filen
            } else {
                return response()->json(['message' => 'failure']);
            }

        // Finns det ingen sådan bild i databasen misslyckas man med att ta bort filen
        } else {
            return response()->json(['message' => 'failure']);
        }        
    }

    public function human_filesize($size, $precision = 2) {
        for($i = 0; ($size / 1024) > 0.9; $i++, $size /= 1024) {}
        return round($size, $precision).['B','kB','MB','GB','TB','PB','EB','ZB','YB'][$i];
    }
}
