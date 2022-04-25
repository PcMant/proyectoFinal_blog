<?php

require_once 'controllers/get.controller.php';

$table = $routesArray[3];

$response = GetController::getData($table);
echo '<pre>'; print_r($response); '</pre>';

return;

$json = array(
    'status' => 200,
    'result' => 'Solicitud GET'
);

echo json_encode($json, http_response_code($json['status']));