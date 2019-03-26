<?php
$request = array(
    array("code"=>"001","unit"=>"3"),
    array("code"=>"002","unit"=>"3")
);
echo json_encode($request);

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

?>