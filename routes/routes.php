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
$app->get('/twig', function($request, $response){
	return $this->view->render($response, 'twig.twig');
});

$app->get('/', InitController::class . ':init');
//==========
$app->post('/login', LoginController::class . ':autenticar');
//==========
$app->get('/uf', UfController::class . ':selectUf');
//==========
$app->get('/tipoContato', TipoContatoController::class . ':selectTipoContato');
$app->post('/tipoContato', TipoContatoController::class . ':insertTipoContato');
$app->put('/tipoContato', TipoContatoController::class . ':updateTipoContato');
$app->delete('/tipoContato', TipoContatoController::class . ':deleteTipoContato');
//==========
$app->get('/tipoPenalidade', TipoPenalidadeController::class . ':selectTipoPenalidade');
$app->post('/tipoPenalidade', TipoPenalidadeController::class . ':insertTipoPenalidade');
$app->put('/tipoPenalidade', TipoPenalidadeController::class . ':updateTipoPenalidade');
$app->delete('/tipoPenalidade', TipoPenalidadeController::class . ':deleteTipoPenalidade');
//==========
$app->get('/empresa', EmpresaController::class . ':selectEmpresa');
$app->get('/empresaPorId', EmpresaController::class . ':selectEmpresaPorId');
$app->get('/empresaTelefone', EmpresaController::class . ':selectEmpresaTelefone');
$app->get('/empresaEmail', EmpresaController::class . ':selectEmpresaEmail');
$app->get('/empresaDocumento', EmpresaController::class . ':selectEmpresaDocumento');
$app->post('/empresa', EmpresaController::class . ':insertEmpresa');
$app->put('/empresa', EmpresaController::class . ':updateEmpresa');
$app->delete('/empresa', EmpresaController::class . ':deleteEmpresa');
//==========
$app->post('/telefone', TelefoneController::class . ':insertTelefone');
$app->put('/telefone', TelefoneController::class . ':updateTelefone');
$app->delete('/telefone', TelefoneController::class . ':deleteTelefone');
//==========
$app->post('/email', EmailController::class . ':insertEmail');
$app->put('/email', EmailController::class . ':updateEmail');
$app->delete('/email', EmailController::class . ':deleteEmail');
//==========
$app->get('/dominioDocumento', DominioDocumentoController::class . ':selectDominioDocumento');
$app->post('/dominioDocumento', DominioDocumentoController::class . ':insertDominioDocumento');
$app->put('/dominioDocumento', DominioDocumentoController::class . ':updateDominioDocumento');
$app->delete('/dominioDocumento', DominioDocumentoController::class . ':deleteDominioDocumento');
//==========
$app->post('/documento', DocumentoController::class . ':insertDocumento');
$app->put('/documento', DocumentoController::class . ':updateDocumento');
$app->delete('/documento', DocumentoController::class . ':deleteDocumento');
$app->post('/documentoUpload', DocumentoController::class . ':upload');
//==========
$app->get('/tipoContrato', TipoContratoController::class . ':selectTipoContrato');
$app->post('/tipoContrato', TipoContratoController::class . ':insertTipoContrato');
$app->put('/tipoContrato', TipoContratoController::class . ':updateTipoContrato');
$app->delete('/tipoContrato', TipoContratoController::class . ':deleteTipoContrato');
//==========
$app->get('/contratoPorIdEmpresa', ContratoController::class . ':selectContratoPorIdEmpresa');
$app->get('/contratoCompromissoSiplo', ContratoController::class . ':selectContratoCompromissoSiplo');
$app->get('/contratoTipoPenalidade', ContratoController::class . ':selectContratoTipoPenalidade');

$app->post('/contrato', ContratoController::class . ':insertContrato');
$app->put('/contrato', ContratoController::class . ':updateContrato');
$app->delete('/contrato', ContratoController::class . ':deleteContrato');

$app->post('/contratoTipoPenalidade', ContratoController::class . ':insertContratoTipoPenalidade');
$app->delete('/contratoTipoPenalidade', ContratoController::class . ':deleteContratoTipoPenalidade');

$app->post('/contratoCompromissoSiplo', ContratoController::class . ':insertContratoCompromissoSiplo');
$app->delete('/contratoCompromissoSiplo', ContratoController::class . ':deleteContratoCompromissoSiplo');

//==========
$app->post('/compromissoSiplo', CompromissoSiploController::class . ':insertCompromissoSiplo');
$app->put('/compromissoSiplo', CompromissoSiploController::class . ':updateCompromissoSiplo');
$app->delete('/compromissoSiplo', CompromissoSiploController::class . ':deleteCompromissoSiplo');
//==========

