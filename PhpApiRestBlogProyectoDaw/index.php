<?php

/*==============================================
Mostrar errores
===============================================*/

ini_set('display_errors', 1);/* Mostrar errores desde el navegador */
ini_set('display_errors', 1);/* Errores por log */
ini_set('error_log', './php_error_log'); /* La ruta del fichero de log de erores */

/*==============================================
Requerimientos
===============================================*/
require_once "controllers/routes.controller.php";

$index = new RoutesController;
$index->index();