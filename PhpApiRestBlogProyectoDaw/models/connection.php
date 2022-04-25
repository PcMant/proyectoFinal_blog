<?php

class Connection{
    
    /*==================================
    Información de la bse de datos
    ===================================*/

    static public function infoDatabase(){
        
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
    static public function connect(){

        try{

            $link = new PDO(
                'mysql:host='.Connection::infoDatabase()['host'].';'.
                'port='.Connection::infoDatabase()['port'].';'.
                'dbname='.Connection::infoDatabase()['database'].';charset=utf8', 
                Connection::infoDatabase()['user'], 
                Connection::infoDatabase()['pass']
            );

        }catch(PDOException $e){
            die('Error: '.$e->getMessage());
        }

        return $link;
    }
}