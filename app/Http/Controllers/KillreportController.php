<?php

namespace App\Http\Controllers;

use App\Killreport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Traits\MeatSum;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

use App\User;
use App\Area;
use App\Meat;

class KillreportController extends Controller
{
    use MeatSum;

    protected $redirectTo = '/welcome';

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {  
        // get requests
        $season_search = htmlspecialchars(request()->input('season'));
        $species_search = htmlspecialchars(request()->input('species'));
        $users_search = htmlspecialchars(request()->input('users'));
        $areas_search = htmlspecialchars(request()->input('areas'));
        $status_search = htmlspecialchars(request()->input('status'));
        $meat_search = htmlspecialchars(request()->input('meat'));
        $kind_search = htmlspecialchars(request()->input('kind'));
        $locked_search = htmlspecialchars(request()->input('locked'));

       
        // Tar fram killreports beroende på säsong
        $killreports = Killreport::where('deleted_at', null)
                                    ->where('season', 'like', '%' .$season_search. '%')
                                    ->orderBy('killdate', 'desc')
                                    ->orderBy('id', 'desc')->get();
    
        // filtreras sökningen?
        $filtering = false;

        if( !empty($season_search) ) {
            $filtering = true;
        }

        // Filtrerar ut djurslag
        if( !empty($species_search) ) {
            $killreports = $killreports->filter(function ($value, $key) use ($species_search) {
                return $value->animal()->species == $species_search;
            });
            $filtering = true;
        }
        
        // Filterar ut jägare
        $shooter = '';
        if( !empty($users_search) ) {
             $killreports = $killreports->filter(function ($value, $key) use ($users_search) {
                return $value->shooter->id == $users_search;
            });

            $filtering = true;

            $user_shooter = User::find($users_search);
            $shooter = $user_shooter->firstname ." ". $user_shooter->lastname;
        }

        // Filtrear ut område
        $searched_area_name = '';
        if( !empty($areas_search) ) {
            $killreports = $killreports->filter(function ($value, $key) use ($areas_search) {
                return $value->area()->id == $areas_search;
            });

            $filtering = true;

            $searched_area = Area::find($areas_search);
            $searched_area_name = $searched_area->area_name;
        }


        // Filtrear ut status
        if( !empty($status_search) ) {
            $killreports = $killreports->filter(function ($value, $key) use ($status_search) {
                return $value->report_status == $status_search;
            });

            $filtering = true;
        }


        // Filtrear ut köttilldelning
        $meat_to = '';
        if( !empty($meat_search) ) {
            $killreports = $killreports->filter(function ($value, $key) use ($meat_search) {
                $found = false;
                foreach($value->meat as $meat) {
                    if($meat->user_id == $meat_search) {
                        $found = true;
                    }
                }
                return $found;
                
            });

            $filtering = true;

            $user_meat = User::find($meat_search);
            $meat_to = $user_meat->firstname ." ". $user_meat->lastname;
        }

        


        // Filtrear ut sorts jakt
        if( !empty($kind_search) ) {
            $killreports = $killreports->filter(function ($value, $key) use ($kind_search) {
                return $value->kindofhunt == $kind_search;
            });

            $filtering = true;
        }

        // Filtrear ut sorts jakt
        if( !empty($locked_search) ) {
            $killreports = $killreports->filter(function ($value, $key) use ($locked_search) {
                return $value->locked == $locked_search;
            });

            $filtering = true;
        }
        
        $data = [
            'killreports'           => $killreports,
            'users'                 => User::where('occupation', '=', 'hunter')->get(),
            'hunters'               => User::where('role', '!=', 'guest')->where('occupation', '=', 'hunter')->get(),
            'anonhunter'            => User::where('occupation', '=', 'anonhunter')->get()->first(),
            'areas'                 => Area::all(),
            'shooter'               => $shooter,
            'meat_to'               => $meat_to,
            'searched_area_name'    => $searched_area_name,
            'filtering'             => $filtering
        ];
        
        

        return view('killreports.index', $data);
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
        // dd($this_season);

        // The over all seasons total summed and sorted list of users shared_kilograms; ['user_id'] => sum (float)
        // $user_boar_total              = $this->sumMeatWrapper('Vildsvin', 'total');
        // $user_moose_total             = $this->sumMeatWrapper('Älg', 'total');
        // $user_reddeer_total           = $this->sumMeatWrapper('Kronvilt', 'total');
        // $user_fallowdeer_total        = $this->sumMeatWrapper('Dovvilt', 'total');
        // $user_roedeer_total           = $this->sumMeatWrapper('Rådjur', 'total');

        // The over all seasons average sorted list of users shared_kilograms; ['user_id'] => sum (float)
        $year_back = 7; // antalet år bakåt medelvärdet skall räknas på.
        $user_boar_average              = $this->sumMeatWrapper('Vildsvin', 'average', $year_back);
        $user_moose_average             = $this->sumMeatWrapper('Älg', 'average', $year_back);
        $user_reddeer_average           = $this->sumMeatWrapper('Kronvilt', 'average', $year_back);
        $user_fallowdeer_average        = $this->sumMeatWrapper('Dovvilt', 'average', $year_back);
        $user_roedeer_average           = $this->sumMeatWrapper('Rådjur', 'average', $year_back);

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
            'meat_moose_average'            => $user_moose_average,
            'meat_reddeer_average'          => $user_reddeer_average,
            'meat_fallowdeer_average'       => $user_fallowdeer_average,
            'meat_roedeer_average'          => $user_roedeer_average,
            'meat_boar_average'             => $user_boar_average,
            'meat_moose_this_season'        => $user_moose_this_season,
            'meat_reddeer_this_season'      => $user_reddeer_this_season,
            'meat_fallowdeer_this_season'   => $user_fallowdeer_this_season,
            'meat_roedeer_this_season'      => $user_roedeer_this_season,
            'meat_boar_this_season'         => $user_boar_this_season,
            'this_season'                   => $this_season
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

        // if(count($killreport->meat) == 0) {
        //         $newmeat = new Meat();
        //         $newmeat->create(['killreport_id' => $killreport->id]);
        // }

        // $killreports = Killreport::where('deleted_at', null)->orderBy('killdate', 'desc')->get();
        // $emails = ['magnusandersson076@gmail.com', 'glotterback@gmail.com'];
        
        Mail::send('email.killreport.created', ['user' => Auth::user(), 'killreport' => $killreport], function ($message) {
            // $emails = ['magnusandersson076@gmail.com', 'glotterback@gmail.com'];
            $emails = ['magnusandersson076@gmail.com'];
            $message->from('smarisjaktlag@gmail.com', 'Småris');
            $message->subject('[AUTO] Ny rapport skapad');
            $message->to($emails);
        });
        
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

        $this_season                        = $this->getSeason(date('Y-m-d'));

        // The over all seasons average sorted list of users shared_kilograms; ['user_id'] => sum (float)
        $year_back = 7; // antalet år bakåt medelvärdet skall räknas på.
        $user_boar_average                  = $this->sumMeatWrapper('Vildsvin', 'average', $year_back);
        $user_moose_average                 = $this->sumMeatWrapper('Älg', 'average', $year_back);
        $user_reddeer_average               = $this->sumMeatWrapper('Kronvilt', 'average', $year_back);
        $user_fallowdeer_average            = $this->sumMeatWrapper('Dovvilt', 'average', $year_back);
        $user_roedeer_average               = $this->sumMeatWrapper('Rådjur', 'average', $year_back);

        // This seasons summed and sorted lists of users shared_kilograms; ['user_id'] => sum (float)
        $user_boar_this_season              = $this->sumMeatWrapper('Vildsvin', $this_season);
        $user_moose_this_season             = $this->sumMeatWrapper('Älg', $this_season);
        $user_reddeer_this_season           = $this->sumMeatWrapper('Kronvilt', $this_season);
        $user_fallowdeer_this_season        = $this->sumMeatWrapper('Dovvilt', $this_season);
        $user_roedeer_this_season           = $this->sumMeatWrapper('Rådjur', $this_season);


        if(count($killreport->meat) == 0) {
                $newmeat = new Meat();
                $newmeat->create(['killreport_id' => $killreport->id]);
        }


        // dd($killreport->shooter['username']);
        $data = [
            'killreport'                    => $killreport,
            'anonhunter'                    => User::where('occupation', 'anonhunter')->limit(1)->get(),
            'hunters'                       => User::where('occupation', 'hunter')->get(),
            'areas'                         => Area::all(),
            'meat_moose_average'            => $user_moose_average,
            'meat_reddeer_average'          => $user_reddeer_average,
            'meat_fallowdeer_average'       => $user_fallowdeer_average,
            'meat_roedeer_average'          => $user_roedeer_average,
            'meat_boar_average'             => $user_boar_average,
            'meat_moose_this_season'        => $user_moose_this_season,
            'meat_reddeer_this_season'      => $user_reddeer_this_season,
            'meat_fallowdeer_this_season'   => $user_fallowdeer_this_season,
            'meat_roedeer_this_season'      => $user_roedeer_this_season,
            'meat_boar_this_season'         => $user_boar_this_season,
            'this_season'                   => $this_season
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
        // dd(request()->all());
        // Log::info("REQUEST");
        // Log::info(request()->all());
        // Log::info("KILLREPORT");
        // Log::info($killreport['kindofhunt']);
        // Hängslen och livrem. Ser även till här att enbart admin kan uppdatera låsta rapporter
        if(Auth::user()->role == 'admin' || $killreport->locked == 'no') {
            $old = [];
            $new = [];
            foreach(request()->all() as $key => $value) {
                $old_value = "";
                $new_value = "";
                // Log::info("key: ". $key);
                if($killreport[$key] != $value) {
                    $translate = "";
                    if($key == 'reporter_id') {
                        # Översättning
                        $translate = "Rapportör";

                        # Användarena
                        $old_user = User::find($killreport[$key]);
                        $new_user = User::find($value);
                        
                        # Gamla och nya värdet
                        $old_value = $old_user->firstname ." ". $old_user->lastname;
                        $new_value = $new_user->firstname ." ". $new_user->lastname;
                    } else if($key == 'shooter_id') {
                        # Översättning
                        $translate = "Skytt";

                        # Användarena
                        $old_user = User::find($killreport[$key]);
                        $new_user = User::find($value);
                        
                        # Gamla och nya värdet
                        $old_value = $old_user->firstname ." ". $old_user->lastname;
                        $new_value = $new_user->firstname ." ". $new_user->lastname;
                    } else if($key == 'kindofhunt') {
                        # Översättning
                        $translate = "Sorts jakt";

                        # Gamla och nya värdet
                        $old_value = $killreport[$key];
                        $new_value = $value;
                    } else if($key == 'killdate') {
                        $translate = "Datum";

                        # Gamla och nya värdet
                        $old_value = $killreport[$key];
                        $new_value = $value;
                    } else if($key == 'season') {
                        $translate = "Säsong";

                        # Gamla och nya värdet
                        $old_value = $killreport[$key];
                        $new_value = $value;
                    } else if($key == 'area_id') {
                        # Översättning
                        $translate = "Område";

                        # Användarena
                        $old_area = Area::find($killreport[$key]);
                        $new_area = Area::find($value);
                        
                        # Gamla och nya värdet
                        $old_value = $old_area->area_name;
                        $new_value = $new_area->area_name;
                    } else if($key == 'place') {
                        # Översättning
                        $translate = "Plats";

                        # Gamla och nya värdet
                        $old_value = $killreport[$key];
                        $new_value = $value;
                    } else if($key == 'report_status') {
                        # Översättning
                        $translate = "Rapportstatus";

                        # Gamla och nya värdet
                        $old_value = $killreport[$key];
                        $new_value = $value;
                    } else if($key == 'locked') {
                        # Översättning
                        $translate = "Låst";

                        # Gamla och nya värdet
                        $old_value = $killreport[$key];
                        $new_value = $value;
                    }

                    # De nya och gamla värdena med översätting som nyckel.
                    if($translate != "") {
                        $old[$translate] = $old_value;
                        $new[$translate] = $new_value;
                    }

                    Log::info("old");
                    Log::info($old);
                    
                }
            }


            $killreport->update(request()->all());

            Mail::send('email.killreport.edited', ['user' => Auth::user(), 'killreport' => $killreport, 'old' => $old, 'new' => $new], function ($message) {
                // $emails = ['magnusandersson076@gmail.com', 'glotterback@gmail.com'];
                $emails = ['magnusandersson076@gmail.com'];
                $message->from('smarisjaktlag@gmail.com', 'Småris');
                $message->subject('[AUTO] Rapport redigerad');
                $message->to($emails);
            });
        }

         

        return ['redirect' => url('killreports'), 'killreport' => $killreport];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\KillReport  $killReport
     * @return \Illuminate\Http\Response
     */
    public function destroy(KillReport $killreport)
    {
        $killreport->delete();
        return redirect('/killreports');
    }

}
