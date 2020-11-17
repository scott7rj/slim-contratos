<?php
namespace app\controller;

abstract class AppController {
	protected $view;
    public function __construct() {
    }

    public function getErroJson(string $mensagem) {
        $array = array("erro" => $mensagem);
        return $array;
    }
}