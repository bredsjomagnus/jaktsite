<?php

namespace App\Traits;

use App\User;
use App\Meat;

trait MeatSum
{
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
     * @return Array $uer_meat; key (int) => 'id': user_id (int), 'username' (String), 'firstname', (String), 'lastname' (String), kg (float)
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
        // $sorted = asort($user_meat);
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

    /**
     * Bubbelsorterar köttarrayerna efter den som har fått minst kött av ett visst
     * djurslag upp till den som fått mest kött.
     * 
     * @param Array associativ array [0: ['id' => 1, 'username' => 'johan', 'firstname' => 'johan', 'lastname' => 'Eriksson', 'kg' => 34], ...]
     * 
     * @return Array associativ array som är sorterad
     */
     public function bubble($unsorted)
    {

        // sorterar en köttarray
        $bubbling = true;
        $notswapped = true;
        $obj = $unsorted;
        $n = count($unsorted) - 1;
        while ($bubbling) {
            $notswapped = true;
            for ($k=0; $k < $n; $k++) {
                if ($obj[$k]['kg'] > $obj[$k+1]["kg"]) {
                    $temp = $obj[$k];
                    $obj[$k] = $obj[$k+1];
                    $obj[$k+1] = $temp;
                    $notswapped = false;
                }
            }
            if ($notswapped) {
                $bubbling = false;
            }
        }
        return $obj;

    }

}