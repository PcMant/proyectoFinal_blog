<?php
require_once "models/connection.php";
require_once "controllers/get.controller.php";


//Obteniendo las rutas y guardarlas en un array separados los directorios
$routesArray = explode('/', $_SERVER['REQUEST_URI']);
$routesArray = array_filter($routesArray);

$arrayHeaders = getallheaders();
if(!empty($_POST)) {
    $array_POST = $_POST;
}
if (((isset($_GET['framejs']) && $_SERVER['REQUEST_METHOD'] == 'PUT') || $_SERVER['REQUEST_METHOD'] == 'POST') && empty($_POST)){ 
    $arrayPOST = json_decode(file_get_contents('php://input'), true);

    foreach($arrayPOST['params']['updates'] as $key => $value){
        $array_POST[$value['param']] = $value['value'];
    }

    if($_SERVER['REQUEST_METHOD'] == 'PUT') $data = $array_POST;

    foreach ($arrayPOST['headers']['lazyUpdate'] as $key => $value) {
        $arrayHeaders[$value['name']] = $value['value'];
    }
}

// $test;

// $data = array();
// 	parse_str(file_get_contents('php://input'), $data);

// if(!isset($_GET['framejs'])){
//     $test = $data;
// }else{
//     $test = $array_POST;
// }

// echo json_encode($_GET, http_response_code(200)); return;

/*===========================================
Cuando no se hace ninguna petición a la API
============================================*/

/*Aquí se indica a partir de que endpoint detectar parámetros, siendo 0 la raiz
Este es la respuesta que se recibe si se envia una petición sin parámetros, un 404
*/
if(count($routesArray) == 2){

    $json = array(
        'status' => 404,
        'result' => 'Not found'
    );

    echo json_encode($json, http_response_code($json['status']));

    return;
}

/*========================================
Cuando si se tiene una petición a la API
========================================*/
/*
Aquí se determina a partir de que enpoint de la url se aceptan peticiones.
Siendo el valor 0 la raiz
 */
if(count($routesArray) > 2 && isset($_SERVER["REQUEST_METHOD"])){

    // Se determina que endpoint se considera la tabla a consultar, siendo 1 desde después de la raiz
    $table = explode('?',$routesArray[3])[0];

	/*=============================================
	Validar llave secreta
	=============================================*/

	if(!isset($arrayHeaders["Authorization"]) || $arrayHeaders["Authorization"] != Connection::apikey()){

		if(in_array($table, Connection::publicAccess()) == 0){
	
			$json = array(
		
				'status' => 400,
				"result" => "You are not authorized to make this request"
			);

			echo json_encode($json, http_response_code($json["status"]));

			return;

		}else{

			/*=============================================
			Acceso público
			=============================================*/
			$response = new GetController();
			$response -> getData($table, "*",null,null,null,null);

			return;
		}
	
	}

    /*=================================
    Peticiones GET
    =================================*/
    
    if($_SERVER['REQUEST_METHOD'] == 'GET'){
        include 'services/get.php';

        return;
    }

    /*=================================
    Peticiones POST
    =================================*/
    
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        include 'services/post.php';
    
        return;
    }


    /*=================================
    Peticiones PUT
    =================================*/
    
    if($_SERVER['REQUEST_METHOD'] == 'PUT'){
        include 'services/put.php';
    
        return;
    }
     
    /*=================================
    Peticiones DELETE
    =================================*/
    
    if($_SERVER['REQUEST_METHOD'] == 'DELETE'){
        include 'services/delete.php';
    
        return;
    }

}
