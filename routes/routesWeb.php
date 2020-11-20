<?php
use app\controller\InitController;
use app\controller\LoginController;
use app\controller\UfController;
use app\controller\TipoContatoController;
use app\controller\TelefoneController;
use app\controller\EmailController;
use app\controller\DominioDocumentoController;
use app\controller\DocumentoController;
use app\controller\EmpresaController;
use app\controller\TipoContratoController;
use app\controller\ContratoController;
use app\controller\TipoPenalidadeController;
use app\controller\CompromissoSiploController;

use app\controller\TwigController;
$app->get('/twig', function($request, $response) {
	return $this->view->render($response, 'twig.twig');
});
