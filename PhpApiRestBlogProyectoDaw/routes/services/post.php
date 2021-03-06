<?php

require_once "models/connection.php";
require_once "controllers/post.controller.php";

if(!empty($array_POST)){

	/*=============================================
	Separar propiedades en un arreglo
	=============================================*/

	$columns = array();
	
	foreach (array_keys($array_POST) as $key => $value) {

		array_push($columns, $value);
			
	}

	/*=============================================
	Validar la tabla y las columnas
	=============================================*/

	if(empty(Connection::getColumnsData($table, $columns))){

		$json = array(
		 	'status' => 400,
		 	'result' => "Error: Fields in the form do not match the database"
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

		$response -> postRegister($table,$array_POST,$suffix);

	/*=============================================
	Peticion POST para login de usuario
	=============================================*/

	}else if(isset($_GET["login"]) && $_GET["login"] == true){

		$suffix = $_GET["suffix"] ?? "usuario";

		$response -> postLogin($table,$array_POST,$suffix);

	}else{

		if(isset($_GET["token"])){

			/*=============================================
			Peticion POST para usuarios no autorizados
			=============================================*/

			if($_GET["token"] == ");-Mr4TLR;&wbN.cw7qMW}QfRi[9b6q)BT+yymkPt.8a/NA!(k" && isset($_GET["except"])){

				/*=============================================
				Validar la tabla y las columnas
				=============================================*/

				$columns = array($_GET["except"]);

				if(empty(Connection::getColumnsData($table, $columns))){

					$json = array(
					 	'status' => 400,
					 	'result' => "Error: Fields in the form do not match the database"
					);

					echo json_encode($json, http_response_code($json["status"]));

					return;

				}

				/*=============================================
				Solicitamos respuesta del controlador para crear datos en cualquier tabla
				=============================================*/		

				$response -> postData($table,$array_POST);

			/*=============================================
			Peticion POST para usuarios autorizados
			=============================================*/

			}else{

				$tableToken = $_GET["table"] ?? "users";
				$suffix = $_GET["suffix"] ?? "user";

				$validate = Connection::tokenValidate($_GET["token"],$tableToken,$suffix);

				/*=============================================
				Solicitamos respuesta del controlador para crear datos en cualquier tabla
				=============================================*/		

				if($validate == "ok"){
		
					$response -> postData($table,$array_POST);

				}

				/*=============================================
				Error cuando el token ha expirado
				=============================================*/	

				if($validate == "expired"){

					$json = array(
					 	'status' => 303,
					 	'result' => "Error: The token has expired"
					);

					echo json_encode($json, http_response_code($json["status"]));

					return;

				}

				/*=============================================
				Error cuando el token no coincide en BD
				=============================================*/	

				if($validate == "no-auth"){

					$json = array(
					 	'status' => 400,
					 	'result' => "Error: The user is not authorized"
					);

					echo json_encode($json, http_response_code($json["status"]));

					return;

				}

			}

		/*=============================================
		Error cuando no env??a token
		=============================================*/	

		}else{

			$json = array(
			 	'status' => 400,
			 	'result' => "Error: Authorization required"
			);

			echo json_encode($json, http_response_code($json["status"]));

			return;	

		}	

	}
}