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

use app\controller\TwigController;
$app->get('/twig', TwigController::class . ':twig');

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
$app->get('/penalidade', PenalidadeController::class . ':selectPenalidadeo');
$app->post('/penalidade', PenalidadeController::class . ':insertPenalidade');
$app->put('/penalidade', PenalidadeController::class . ':updatePenalidade');
$app->delete('/penalidade', PenalidadeController::class . ':deletePenalidade');
//==========
$app->get('/empresa', EmpresaController::class . ':selectEmpresa');
$app->get('/empresaPorId', EmpresaController::class . ':selectEmpresaPorId');
$app->get('/empresaPorNomeOuCnpj', EmpresaController::class . ':selectEmpresaPorNomeOuCnpj');
$app->post('/empresa', EmpresaController::class . ':insertEmpresa');
$app->put('/empresa', EmpresaController::class . ':updateEmpresa');
$app->delete('/empresa', EmpresaController::class . ':deleteEmpresa');
//==========
$app->get('/telefonePorIdEmpresa', TelefoneController::class . ':selectTelefonePorIdEmpresa');
$app->post('/telefone', TelefoneController::class . ':insertTelefone');
$app->put('/telefone', TelefoneController::class . ':updateTelefone');
$app->delete('/telefone', TelefoneController::class . ':deleteTelefone');
//==========
$app->get('/emailPorIdEmpresa', EmailController::class . ':selectEmailPorIdEmpresa');
$app->post('/email', EmailController::class . ':insertEmail');
$app->put('/email', EmailController::class . ':updateEmail');
$app->delete('/email', EmailController::class . ':deleteEmail');
//==========
$app->get('/dominioDocumento', DominioDocumentoController::class . ':selectDominioDocumento');
$app->post('/dominioDocumento', DominioDocumentoController::class . ':insertDominioDocumento');
$app->put('/dominioDocumento', DominioDocumentoController::class . ':updateDominioDocumento');
$app->delete('/dominioDocumento', DominioDocumentoController::class . ':deleteDominioDocumento');
//==========
$app->get('/documento', DocumentoController::class . ':selectDocumentoPorIdEmpresa');
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
$app->post('/contrato', ContratoController::class . ':insertContrato');
$app->put('/contrato', ContratoController::class . ':updateContrato');
$app->delete('/contrato', ContratoController::class . ':deleteContrato');
//==========


