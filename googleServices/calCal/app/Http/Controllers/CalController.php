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

    public function getPlace(Request $request){
        
        $returnArray = array(
            "code" => "1",
            "msg" => "",
            "data" => array()
        );

        $data = array(
            "id" => "",
            "name" => "",
            "address" => "",
            "url" => "",
            "phoneNo" => ""
        );
//  "candidates" :
//   [ { "formatted_address" : "ศูนย์บริการลูกค้า ทีโอที สาขาฟิวเจอร์พาร์ค รังสิต ailand", 
//     "id" : "4f98f75695043422a2b2813869c423ac494b4f74", 
//     "name" : "ฟิวเจอร์พาร์ครังสิต" } ]
//     , "status" : "OK" }
        $input = $request->input("input");
        $url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json";
        $inputArray = array(
            "input"=>$input,
            "inputtype"=>"textquery",
            "fields"=>"place_id,formatted_address,name",
            "key"=>"AIzaSyDzFp4-2Tooi0kXbG2ap0UnkELyRK2DeoQ"
        );
        $result = json_decode($this->callAPI("GET",$url,$inputArray),true);
        if($result["status"] == "ZERO_RESULTS" ||  count($result["candidates"]) == 0 ){
            $returnArray["msg"] = "Place not found";
            return $returnArray;
        }
        $candidate = $result["candidates"][0];
        $data["id"] = $candidate["place_id"];
        $data["name"] = $candidate["name"];
        $data["address"] = $candidate["formatted_address"];

        
        $url = "https://maps.googleapis.com/maps/api/place/details/json";
        $inputArray = array(
            "placeid" => $data["id"],
            "fields"=>"url,formatted_phone_number",
            "key"=>"AIzaSyDzFp4-2Tooi0kXbG2ap0UnkELyRK2DeoQ"
        );
        $result = json_decode($this->callAPI("GET",$url,$inputArray),true);
        // {"html_attributions":[],"result":{"formatted_phone_number":"092 740 8452","url":"https:\/\/maps.google.com\/?cid=446827957718979011"},"status":"OK"}
        if($result["status"] == "OK"){
            $data["url"] = $result["result"]["url"];
            $data["phoneNo"] = $result["result"]["formatted_phone_number"];
        }
        $returnArray["code"] = 0;
        $returnArray["data"] = $data;
        return $returnArray;
    }
    
    private function callAPI($method, $url, $data = false){
        $curl = curl_init();

        switch ($method)
        {
            case "POST":
                curl_setopt($curl, CURLOPT_POST, 1);

                if ($data)
                    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                break;
            case "PUT":
                curl_setopt($curl, CURLOPT_PUT, 1);
                break;
            default:
                if ($data)
                    $url = sprintf("%s?%s", $url, http_build_query($data));
        }

        // Optional Authentication:
        curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
        // curl_setopt($curl, CURLOPT_USERPWD, "username:password");

        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

        $result = curl_exec($curl);

        curl_close($curl);

        return $result;
    }

    private function isJson($string) {
        json_decode($string);
        return (json_last_error() == JSON_ERROR_NONE);
    }
}
