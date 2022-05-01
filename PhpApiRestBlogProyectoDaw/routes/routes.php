<?php
//Obteniendo las rutas y guardarlas en un array separados los directorios
$routesArray = explode('/', $_SERVER['REQUEST_URI']);
$routesArray = array_filter($routesArray);

/*===========================================
Cuando no se hace ninguna petición a la API
============================================*/

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
