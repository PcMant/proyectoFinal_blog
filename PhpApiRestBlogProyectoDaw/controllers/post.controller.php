<?php

require_once 'models/post.model.php';
require_once 'models/get.model.php';
require_once 'models/connection.php';

require_once "vendor/autoload.php";
use Firebase\JWT\JWT;

require_once 'models/put.model.php';
class PostController{

    /*==================================================
    Paticion POST para crear datos
    ==================================================*/
    static public function postData($table, $data){

        $response = PostModel::postData($table,$data);

        $return = new PostController();
        $return->fncResponse($response,null,null);

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

            $return = new PostController();
            $return->fncResponse($response,null,$suffix);
        }else{

            /*=========================================
            Registro de usuarios desde APP externas
            =========================================*/

            $response = PostModel::postData($table, $data);

            if(isset($response['comment']) && $response['comment'] == 'The process was successful'){

                /*=================================================
                Validar que el usuario exista en BD
                ==================================================*/
                $response = GetModel::getDataFilter($table, "*", "email_".$suffix, $data["email_".$suffix], null,null,null,null);

                if (!empty($response)) {
                    $token = Connection::jwt($response[0]->{'id_'.$suffix}, $response[0]->{'email_'.$suffix});

                    $jwt = JWT::encode($token, 'fsdfasfsdfzcc1cszdssf', 'HS256');
                    
                    /*=========================================
                    Actualizar la base de datos con el token
                    =========================================*/

                    $data = array(
                        "token_".$suffix => $jwt,
                        'token_exp_'.$suffix => $token['exp']
                    );

                    $update = PutModel::putData($table, $data, $response[0]->{'email_'.$suffix}, 'email_'.$suffix);

                    if (isset($update['comment']) && $update['comment'] == 'The process was successful') {
                        $response[0]->{'token_'.$suffix} = $jwt;
                        $response[0]->{'token_exp_'.$suffix} = $token['exp'];

                        $return = new PostController();
                        $return->fncResponse($response, null, $suffix);
                    }
                }

            }

        }
    }

    /*==================================================
    Paticion POST para login de usuario
    ==================================================*/
    static public function postLogin($table, $data, $suffix){

        /*=================================================
        Validar que el usuario exista en BD
        ==================================================*/
        $response = GetModel::getDataFilter($table, "*", "email_".$suffix, $data["email_".$suffix], null,null,null,null);

        if(!empty($response)){
            
            if($response[0]->{'password_'.$suffix} != null){

                /*=========================================
                Encriptamos la contraseña
                =========================================*/
                $crypt = crypt($data['password_'.$suffix], '$2a$07$azybxcags23425sdg23sdfhsd$');

                if ($response[0]->{'password_'.$suffix} == $crypt) {
                    $token = Connection::jwt($response[0]->{'id_'.$suffix}, $response[0]->{'email_'.$suffix});

                    $jwt = JWT::encode($token, 'fsdfasfsdfzcc1cszdssf', 'HS256');
                    
                    /*=========================================
                    Actualizar la base de datos con el token del usuario
                    =========================================*/

                    $data = array(
                        "token_".$suffix => $jwt,
                        'token_exp_'.$suffix => $token['exp']
                    );

                    $update = PutModel::putData($table, $data, $response[0]->{'email_'.$suffix}, 'email_'.$suffix);


                    if (isset($update['comment']) && $update['comment'] == 'The process was successful') {
                        $response[0]->{'token_'.$suffix} = $jwt;
                        $response[0]->{'token_exp_'.$suffix} = $token['exp'];

                        $return = new PostController();
                        $return->fncResponse($response, null, $suffix);
                    }

                }else{

                    $response = null;
                    $return = new PostController();
                    $return->fncResponse($response, "Wrong password",$suffix);  

                }

            }else{

                    /*=========================================
                    Actualizamos el token para usuarios logueados desde app externas
                    =========================================*/

                    $token = Connection::jwt($response[0]->{'id_'.$suffix}, $response[0]->{'email_'.$suffix});

                    $jwt = JWT::encode($token, 'fsdfasfsdfzcc1cszdssf', 'HS256');

                    $data = array(
                        "token_".$suffix => $jwt,
                        'token_exp_'.$suffix => $token['exp']
                    );

                    $update = PutModel::putData($table, $data, $response[0]->{'email_'.$suffix}, 'email_'.$suffix);

                    //echo '<pre>'; print_r($update); echo '</pre>'; return;

                    if (isset($update['comment']) && $update['comment'] == 'The process was successful') {
                        $response[0]->{'token_'.$suffix} = $jwt;
                        $response[0]->{'token_exp_'.$suffix} = $token['exp'];

                        $return = new PostController();
                        $return->fncResponse($response, null, $suffix);
                    }

            }
            
        }
    }

    /*==================================================
    Respuestas del controlador
    ==================================================*/

    public function fncResponse($response,$error,$suffix){

        if(!empty($response)){

        /*==================================================
        Quitamos la contraseña de la respuesta
        ==================================================*/
        if(isset($response[0]->{'password_'.$suffix})){
            unset($response[0]->{'password_'.$suffix});
        }

            $json = array(
                'status'    =>  200,
                'method'    =>  'POST',
                'results'      =>  $response
            );

        }else{

            if($error != null){

                $json = array(
                    'status' => 404,
                    'result' => $error
                );

            }else{

                $json = array(
                    'status' => 404,
                    'result' => 'Not Found'
                );
            }
        }

        echo json_encode($json, http_response_code($json['status']));
    }
}