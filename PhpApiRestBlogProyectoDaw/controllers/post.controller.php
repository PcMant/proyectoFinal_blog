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
    Paticion POST para registrar usuarios
    ==================================================*/
    static public function postRegister($table, $data, $suffix){

        if(isset($data['password_'.$suffix]) && !empty($data['password_'.$suffix])){

            /*=========================================
            Encriptamos la contraseña
            =========================================*/
            $crypt = crypt($data['password_'.$suffix], '$2a$07$azybxcags23425sdg23sdfhsd$');

            $data['password_'.$suffix] = $crypt;

            $response = PostModel::postData($table, $data);
            $return->fncResponse($response);
        }else{
            //
        }

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