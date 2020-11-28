<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

use App\Avatar;

class AvatarFileController extends Controller
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

        Log::info("STORE:");
        Log::info("file: ".$file->getClientOriginalName());

        // bilden som GD från image intervention
        $img = Image::make($file->getRealPath());
    
        Log::info("img");
        Log::info($img);

        // bildstorlek
        $size = $img->filesize();

        
        

        // filename
        $filename = $request->file('file')->getClientOriginalName();

        // exploderar filnamnet; ['i23', 'u4', 'namnet']
        $filename_array = explode('_', $filename);

        // tar ut andra delen med image id, ex 'i23' och där tas allt med utom första i:et
        $avatar_id = intval(substr($filename_array[1], 1));

        Log::info('filename: '.$filename);
        Log::info($filename_array);
        Log::info($filename_array[1]);
        Log::info('avatar_id: '.$avatar_id);

        // splitar upp namnet så att jag kan komma åt formatet
        $filearray = explode('.', $filename);

        // filformat
        $format = $filearray[1];

        


        // om bilden är valid och storleken är mindre än ovan satta limit
        if( $request->file('file')->isValid() && $size < $limit) {
            // $size_readable = $this->human_filesize($size, 2);
            // DB::select('UPDATE avatars SET filesize = ?, filesize_readable = ? WHERE id = ?', [$size, $size_readable, $avatar_id]);
            
            $newimg = $img->fit(500)->save($file->getRealPath());

            $newfilesize = $newimg->filesize();
            $newsize_readable = $this->human_filesize($newfilesize, 2);
            DB::select('UPDATE avatars SET filesize = ?, filesize_readable = ? WHERE id = ?', [$newfilesize, $newsize_readable, $avatar_id]);

            // Log::info($cropimg);

            // spara bilden i images/killreports
            // $path = $request->file('file')->storeAs('public/images/avatars', $filename, 'local');
            Storage::disk('local')->put('public/images/avatars/'.$filename, $newimg);
        } else {

            // om bildstorleken är större än ovan satta limit
            if($size > $limit) {

                // kvalitén som skall sättas beror på förhållandet limit och bildstorlek
                $quality = floor(($limit/$size)*100);
                Log::info('quality: '.$quality);

                // komprimera med ovan beräknade kvalitétsfaktor
                $newimg = Image::make($file->getRealPath())->encode(strtolower($format), $quality)->fit(500)->save($file->getRealPath());
              
                $newfilesize = $newimg->filesize();
                $newsize_readable = $this->human_filesize($newfilesize, 2);
                DB::select('UPDATE avatars SET filesize = ?, filesize_readable = ? WHERE id = ?', [$newfilesize, $newsize_readable, $avatar_id]);
                
                



                // spara bilden i images/avatars
                Storage::disk('local')->put('public/images/avatars/'.$filename, $newimg);

                // uppdatera databasen med human filesize på avataren
                $newfilesize = Storage::disk('local')->size('public/images/avatars/'.$filename);
                $newsize_readable = $this->human_filesize($newfilesize, 2);
                DB::select('UPDATE images SET filesize = ?, filesize_readable = ? WHERE id = ?', [$newfilesize, $newsize_readable, $avatar_id]);
            }
        }

        
        // kontroll om bilden nu finns i images/avatars och skickar response därefter
        if( Storage::disk('public')->exists('images/avatars/'.$filename) ) {
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return Illuminate\Http\JsonResponse
     */
    public function update_rotate(Request $request, Avatar $avatar)
    {
        // $image_res = DB::select('select * from images where id = ?', [$id]);
        $name = 'i'.$avatar->id.'_u'.$avatar->user_id.'_'.$avatar->name;
        $avatar_path = Storage::disk('local')->path('public/images/avatars/'.$name);

        $avatar_gd = Image::make($avatar_path)->rotate(-90)->save();

        return response()->json(['message' => 'success']);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Avatar $avatar)
    {
        // säkerhetskoll för att se till att det bara är admin eller själva ägaren till bilden som kan ta bort filen.
        if( (Auth::user()->id == $avatar->user_id) || (Auth::user()->role == 'admin') ) {
            $name = 'i'.$avatar->id.'_u'.$avatar->user_id.'_'.$avatar->name;
            Storage::disk('local')->delete('public/images/avatars/'.$name);
            return response()->json(['message' => 'success']);

        // är det inte ägaren till bilden eller admin så misslyckas försöket att radera filen
        } else {
            return response()->json(['message' => 'failure']);
        }    
    }

    public function human_filesize($size, $precision = 2) {
        for($i = 0; ($size / 1024) > 0.9; $i++, $size /= 1024) {}
        return round($size, $precision).['B','kB','MB','GB','TB','PB','EB','ZB','YB'][$i];
    }
}
