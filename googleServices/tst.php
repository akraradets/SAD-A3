<?php

function callAPI($method, $url, $data = false){
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

        $input = "FuturePark";
        $url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json";
        $inputArray = array(
            "input"=>$input,
            "inputtype"=>"textquery",
            "fields"=>"id,formatted_address,name",
            "key"=>"AIzaSyDzFp4-2Tooi0kXbG2ap0UnkELyRK2DeoQ"
        );
// echo sprintf("%s?%s", $url, http_build_query($data));
$result = callAPI("GET",$url,$inputArray);
$result = json_decode($result,true);
$candidate = $result["candidates"][0];
print_r($candidate["id"]);
// ?input=Future%20Park&inputtype=textquery&&



?>
