<?php

/*==============================================
Mostrar errores
===============================================*/

ini_set('display_errors', 1);/* Mostrar errores desde el navegador */
ini_set('display_errors', 1);/* Errores por log */
ini_set('error_log', './php_error_log'); /* La ruta del fichero de log de erores */


/*==============================================
CORS
===============================================*/
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('content-type: application/json; charset=utf-8');


/*==============================================
Requerimientos
===============================================*/
require_once "models/connection.php";

require_once "controllers/routes.controller.php";

$index = new RoutesController;
$index->index();