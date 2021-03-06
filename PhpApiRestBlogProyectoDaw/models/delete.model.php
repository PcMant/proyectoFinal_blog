<?php 

require_once "connection.php";
require_once "get.model.php";

class DeleteModel{

	/*=============================================
	Peticion DELETE para eliminar datos de forma dinámica
	=============================================*/

	static public function deleteData($table, $id, $nameId){

		/*=============================================
		Validar el ID
		=============================================*/

		$response = GetModel::getDataFilter($table, $nameId, $nameId, $id, null,null,null,null);
		
		if(empty($response)){

			return null;

		}

		/*=============================================
		Eliminamos el registro
		=============================================*/

		$sql = "DELETE FROM $table WHERE $nameId = :$nameId";

		$link = Connection::connect();
		$stmt = $link->prepare($sql);

		$stmt->bindParam(":".$nameId, $id, PDO::PARAM_STR);

		if($stmt -> execute()){

			$response = array(

				"comment" => "The process was successful"
			);

			return $response;
		
		}else{

			return $link->errorInfo();

		}

	}

}