<?php

require_once 'models/post.model.php';

class PostController{

    /*==================================================
    Paticion POST para crear datos
    ==================================================*/
    static public function postData($table, $data){

        $response = PostModel::postData($table,$data);

        $return = new PostController();
        $return->fncResponse($response);

    }

    /*==================================================
    Respuestas del controlador
    ==================================================*/

    public function fncResponse($response){

        if(!empty($response)){

            $json = array(
                'status'    =>  200,
                'method'    =>  'POST',
                'results'      =>  $response
            );

        }else{

            $json = array(
                'status' => 404,
                'result' => 'Not Found'
            );
        }

        echo json_encode($json, http_response_code($json['status']));
    }
}