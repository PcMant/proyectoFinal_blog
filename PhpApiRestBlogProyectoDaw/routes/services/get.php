<?php

require_once 'controllers/get.controller.php';

$table = explode('?',$routesArray[3])[0];

$select = $_GET['select'] ?? '*';

if(isset($_GET['linkTo']) && isset($_GET['equalTo']))

$response = new GetController();
$response->getData($table, $select);