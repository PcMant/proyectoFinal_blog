<?php
require_once "models/connection.php";
require_once "controllers/get.controller.php";

//Obteniendo las rutas y guardarlas en un array separados los directorios
$routesArray = explode('/', $_SERVER['REQUEST_URI']);
$routesArray = array_filter($routesArray);

/*===========================================
Cuando no se hace ninguna petición a la API
============================================*/
// echo json_encode(getallheaders(), http_response_code(200)); return;

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

if(count($routesArray) > 2 && isset($_SERVER["REQUEST_METHOD"])){

    $table = explode('?',$routesArray[3])[0];

	/*=============================================
	Validar llave secreta
	=============================================*/

	if(!isset(getallheaders()["Authorization"]) || getallheaders()["Authorization"] != Connection::apikey()){

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
