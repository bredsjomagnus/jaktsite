<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;

use App\Traits\MeatSum;

class MailController extends Controller
{
    use MeatSum;

    protected $redirectTo = '/welcome';

    public function meat_changed(Request $request)
    {
        $year_back = 7; // antalet år bakåt medelvärdet skall räknas på.
        $user_boar_average              = $this->sumMeatWrapper('Vildsvin', 'average', $year_back);
        $user_moose_average             = $this->sumMeatWrapper('Älg', 'average', $year_back);
        $user_reddeer_average           = $this->sumMeatWrapper('Kronvilt', 'average', $year_back);
        $user_fallowdeer_average        = $this->sumMeatWrapper('Dovvilt', 'average', $year_back);
        $user_roedeer_average           = $this->sumMeatWrapper('Rådjur', 'average', $year_back);


        // dd($user_fallowdeer_average);

        $data = [
            'user'                          => Auth::user(),
            'meat_moose_average'            => $this->bubble($user_moose_average),
            'meat_reddeer_average'          => $this->bubble($user_reddeer_average),
            'meat_fallowdeer_average'       => $this->bubble($user_fallowdeer_average),
            'meat_roedeer_average'          => $this->bubble($user_roedeer_average),
            'meat_boar_average'             => $this->bubble($user_boar_average),
        ];

         Mail::send('email.meat.changed', $data, function ($message) {
            $emails = ['magnusandersson076@gmail.com', 'glotterback@gmail.com'];
            // $emails = ['magnusandersson076@gmail.com'];
            $message->from('smarisjaktlag@gmail.com', 'Småris');
            $message->subject('[AUTO] Nya köttabeller');
            $message->to($emails);
        });
    }

   
}
