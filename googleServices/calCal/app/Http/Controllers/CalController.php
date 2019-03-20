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
        $returnArray = array(
            "code" => "1",
            "msg" => "",
            "cal" => ""
        );
        if(empty($request->input("code"))){
            $returnArray["msg"] = "<code> is empty";
            return $returnArray;
        }
        if(empty($request->input("unit"))){
            $returnArray["msg"] = "<unit> is empty";
            return $returnArray;
        }
        $code = $request->input("code");
        $unit = $request->input("unit");
        $cal = strrev($code) * $unit;
        $returnArray["code"] = "0";
        $returnArray["cal"] = $cal;
        return $returnArray;
    }
}
