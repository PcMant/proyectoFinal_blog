<?php

require_once "vendor/autoload.php";
use Firebase\JWT\JWT;
class Connection
{
    
    /*==================================
    Información de la bse de datos
    ===================================*/

    public static function infoDatabase()
    {
        $infoDB = array(

            'host'      =>  'localhost',
            'port'      =>  '3306',
            'database'  =>  'blog',
            'user'      =>  'root',
            'pass'      =>  ''
        );

        return $infoDB;
    }

    /*========================================
    Conexión a la base de datos
    ========================================*/
    public static function connect()
    {
        try {
            $link = new PDO(
                'mysql:host='.Connection::infoDatabase()['host'].';'.
                'port='.Connection::infoDatabase()['port'].';'.
                'dbname='.Connection::infoDatabase()['database'].';charset=utf8',
                Connection::infoDatabase()['user'],
                Connection::infoDatabase()['pass']
            );
        } catch (PDOException $e) {
            die('Error: '.$e->getMessage());
        }

        return $link;
    }

    /*=============================================
    Validar existencia de una tabla en la bd
    =============================================*/

    public static function getColumnsData($table, $columns)
    {

        /*=============================================
        Traer el nombre de la base de datos
        =============================================*/

        $database = Connection::infoDatabase()["database"];

        /*=============================================
        Traer todas las columnas de una tabla
        =============================================*/

        $validate = Connection::connect()
        ->query("SELECT COLUMN_NAME AS item FROM information_schema.columns WHERE table_schema = '$database' AND table_name = '$table'")
        ->fetchAll(PDO::FETCH_OBJ);

        /*=============================================
        Validamos existencia de la tabla
        =============================================*/

        if (empty($validate)) {
            return null;
        } else {

            /*=============================================
            Ajuste de selección de columnas globales
            =============================================*/

            if ($columns[0] == "*") {
                array_shift($columns);
            }

            /*=============================================
            Validamos existencia de columnas
            =============================================*/

            $sum = 0;
                
            foreach ($validate as $key => $value) {
                $sum += in_array($value->item, $columns);
            }



            return $sum == count($columns) ? $validate : null;
        }
    }

    /*=============================================
    Generar token de Autenticación
    =============================================*/

    static public function jwt($id,$email){
        
        $time = time();

        $token = array(

            "iat" => $time,// Tiempo en en que inicia el token
            "exp" => $time + (60*60*24), // Tiempo en que expirará el token (duración 1d),
            "data" => [
                "id" => $id,
                "email" => $email
            ]
        );

        return $token;

    }
}
