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
        $this_season            = $this->getSeason(date('Y-m-d'));

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
        // dd($killreport->shooter['username']);
        $data = [
            'killreport'    => $killreport,
            'anonhunter'    => User::where('occupation', 'anonhunter')->limit(1)->get(),
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
     * @param String $season; is either 'total' for getting all kgs, 'average' for average over $year_back years or ex '18/19' for only sum of that season
     * @return Object $result; rows from meats of selected species
     */
    public function getSpeciesMeat($specie, $season, $year_back)
    {
        // Detta gäller när $season är 'total' men kommer ändras om $season är något annat nedan.
        $meats = Meat::all();


        if($season != 'total' && $season != 'average') {
            // men är det en säsong man är ute efter är $meats istället
            // dessa säsonger utfiltrearade
            $meats = $meats->filter(function($row) use ($season) {
                return $row->season() == $season;
            });
        }

        if($season == 'average' && $year_back) {
            // Skall man ha ett medelvärde beräknat på ett visst antal år bakåt tar man dagens säsong minus
            // antalet år bakåt ($year_back)
            $season = $this->getSeason(date('Y-m-d'));
            $from_year = intval(substr($season, 0, 2)) - $year_back + 1;
            $from_date = "20".strval($from_year)."-07-01";
            $meats = Meat::where('created_at', '>=', $from_date)->get();
        }
        
        // Hur nu än $meats beräknats ovan så skall tabellen nu filtreras utefter djurslag
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
        $hunters = User::where('occupation', 'hunter')->where('role','!=', 'guest')->get();
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

    public function sumUserMeat($user_group, $average, $year_back=false)
    {
        $user_meat = [];
        $index = 0;
        foreach($user_group as $id => $arr) {
            $user = User::find($id);
            
            if($user) {
                if($user->occupation == 'hunter' && $user->role != 'guest') {
                    $res_kg = 0;
                    foreach($arr as $element) {
                        $res_kg = $res_kg + $element;
                    }
                    
                    if ($average && !$year_back) {
                        // Om man vill beräkna medelvärdet från att användaren blev medlem har man inget värde på $year_back
                        // och man kommer in hit. Då slås användarens totala köttmängd för djurslaget ut på antalet år hen
                        // varit medlem.
                        $start_season = $this->getSeason($user->member_since);
                        $this_season = $this->getSeason(date('Y-m-d'));
                        $diff = floatval(intval(substr($this_season, 0, 2)) - intval(substr($start_season, 0, 2)) + 1);
                        $avg = round($res_kg/$diff, 1);
                        $res_kg = $avg;
                    } else if($average && $year_back) {
                        // Om man vill beräkna medelvärdet baserat på ett visst antal år bakåt är det antalet år satt till $year_back
                        // och användarens summerade köttmängd för djuret delar på detta antalet år. Summan som beräknats tidigare är
                        // också baserat på antalet år bakåt och enbart köttmängder från det antalet år bak fram till idag finns med 
                        // i summan.
                        $start_season = $this->getSeason($user->member_since);
                        $this_season = $this->getSeason(date('Y-m-d'));
                        $diff = intval(intval(substr($this_season, 0, 2)) - intval(substr($start_season, 0, 2)) + 1);
                        $n = ($diff > $year_back) ? $year_back : $diff;
                        // dd("start_season: ".$start_season.", this_season: ".$this_season.", diff: ".$diff.", year_back: ".$year_back.", n: ".$n);
                        $avg = round($res_kg/$n, 1);
                        $res_kg = $avg;
                    }
                   

                    $user_meat[$index] = [
                        'id'            => $id, 
                        'username'      => $user->username,
                        'firstname'     => $user->firstname,
                        'lastname'      => $user->lastname,
                        'kg'            => $res_kg
                    ];
                    $index += 1;
                }
            }
        }
        $sorted = asort($user_meat);
        return $user_meat;
    }

    /**
     * A wrapper for getting list of objects with 
     * users [id, username, firstname, lastname, kg] for a species ($species) amd season ($season)
     * If $season is set to 'total' all kg will be summed up from the begining to now.
     * If $season is set to 'average' all kg will be the sum/number of seasons that hunter has been a member.
     * Otherwhise $season can be set to ex '19/20' and only sum up kg for this species and season.
     * 
     * @param String $species; 'Älg' or 'Kronvilt' or.....
     * @param String $season; 'total' or 'average or a season ex. '19/20'
     */
    public function sumMeatWrapper($species, $season, $year_back=false)
    {
        $average = $season == 'average';
        $sm_res     = $this->getSpeciesMeat($species, $season, $year_back);
        $utm_res    = $this->groupUserToMeat($sm_res);
        $filled_res = $this->fillOutGroups($utm_res);
        return $this->sumUserMeat($utm_res, $average, $year_back);
    }
    

    /**
     * Get date and return the season for that date
     * 
     * @param String $date; format YYYY-mm-dd
     * @return Stirng $season; format YY/YY eg '19/20'
     */
    public function getSeason($date)
    {
        
        $year = substr($date, 0, 4);
        $yy = substr($year, 2, 2);
        $season_last_day = $year."-06-30";
        if(strtotime($date) > strtotime($season_last_day)) {
            $yy_other = intval($yy) + 1;
            $season = strval($yy).'/'.strval($yy_other);
        } else {
            $yy_other = intval($yy) - 1;
            $season = strval($yy_other).'/'.strval($yy);
        }

        return $season;
        
    }

    // Skapar grupper 
    // killreport_id => [user_id, user_id]
    // killreport_id => [user_id, user_id]
    // $moose = $meats->mapToGroups(function ($item, $key) {
    //     return [$item['killreport_id'] => $item['user_id']];
    // });
}
