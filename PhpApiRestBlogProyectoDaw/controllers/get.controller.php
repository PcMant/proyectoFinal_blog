<?php

require_once 'models/get.model.php';

class GetController{

    static public function getData($table){

        $response = GetModel::getData($table);

        return $response;
    }
}