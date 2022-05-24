<?php

/*==============================================
Mostrar errores
===============================================*/

ini_set('display_errors', 1);/* Mostrar errores desde el navegador */
ini_set('display_errors', 1);/* Errores por log */
ini_set('error_log', './php_error_log'); /* La ruta del fichero de log de erores */

/*================================================
SOLUCIÓN AL BODY PARA ANGULAR Y FRAMEWORKS CON PROBELAS SIMILARES
=================================================*/
// if ($_SERVER['REQUEST_METHOD'] == 'POST' && empty($_POST)) 
//    $_POST = json_decode(file_get_contents('php://input'), true);


/*==============================================
CORS
===============================================*/
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");
$method = $_SERVER['REQUEST_METHOD'];
if($method == "OPTIONS") {
    die();
}


/*==============================================
Requerimientos
===============================================*/
require_once "models/connection.php";

require_once "controllers/routes.controller.php";

$index = new RoutesController;
$index->index();