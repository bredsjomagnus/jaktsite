<?php

namespace App\Traits;

use App\Killreport;

trait KillreportSum
{
    /**
     * Get all animals of a certain species
     * 
     * @param String $kind; ex 'Ensamjakt'
     * 
     * @return Collection Animals
     */
    public function getKindOfHunt($kind)
    {
        $killreports = Killreport::where('kindofhunt', '=', $kind)->get();

        foreach($killreports as $killreport) {
            $killreport['area'] = $killreport->area()->area_name;
        }

        return $killreports;
    }
} 