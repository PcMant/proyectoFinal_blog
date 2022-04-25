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

    /*=================================
    Peticiones GET
    =================================*/
    
    if($_SERVER['REQUEST_METHOD'] == 'GET'){
        include 'services/get.php';

        return;
    }

    /*=================================
    Peticiones GET
    =================================*/
    
    if($_SERVER['REQUEST_METHOD'] == 'PUT'){
        $json = array(
            'status' => 200,
            'result' => 'Solicitud PUT'
        );
    
        echo json_encode($json, http_response_code($json['status']));
    
        return;
    }

    /*=================================
    Peticiones GET
    =================================*/
    
    if($_SERVER['REQUEST_METHOD'] == 'DELETE'){
        $json = array(
            'status' => 200,
            'result' => 'Solicitud DELETE'
        );
    
        echo json_encode($json, http_response_code($json['status']));
    
        return;
    }

}
