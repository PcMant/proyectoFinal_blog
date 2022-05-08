<?php

require_once "models/connection.php";
require_once "controllers/post.controller.php";

if(isset($_POST)){

	/*=============================================
	Separar propiedades en un arreglo
	=============================================*/

	$columns = array();
	
	foreach (array_keys($_POST) as $key => $value) {

		array_push($columns, $value);
			
	}

	/*=============================================
	Validar la tabla y las columnas
	=============================================*/

	if(empty(Connection::getColumnsData($table, $columns))){

		$json = array(
		 	'status' => 400,
		 	'results' => "Error: Fields in the form do not match the database"
		);

		echo json_encode($json, http_response_code($json["status"]));

		return;

	}

	$response = new PostController();

	/*=============================================
	Peticion POST para registrar usuario
	=============================================*/

	if(isset($_GET["register"]) && $_GET["register"] == true){

		$suffix = $_GET["suffix"] ?? "usuario";

		$response -> postRegister($table,$_POST,$suffix);

	/*=============================================
	Peticion POST para login de usuario
	=============================================*/

	}else if(isset($_GET["login"]) && $_GET["login"] == true){

		$suffix = $_GET["suffix"] ?? "usuario";

		$response -> postLogin($table,$_POST,$suffix);

	}else{
		/*=================================
    	Peticiones POST para usuarios autorizados
    	=================================*/
		if($_GET['token']){

			$table = $_GET['table'] ?? 'users';
			$suffix = $_GET['suffix'] ?? 'user';

			$validate = Connection::tokenValidate($_GET['token'],$table,$suffix);

		}

		/*=================================
    	Solicitamos respuesta del controlador para crear datos en cualquier tabla
    	=================================*/
    	$response->postData($table,$_POST);
	}
}