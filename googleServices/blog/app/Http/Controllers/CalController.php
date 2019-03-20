<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CalController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Update the specified user.
     *
     * @param  Request  $request
     * @param  string  $id
     * @return Response
     */
    public function cal(Request $request)
    {
        return $request->input("code");
        return $request->all();
    }
}
