<?php
use app\controller\TipoContatoController;
use app\controller\TelefoneController;
use app\controller\EmailController;
use app\controller\EmpresaController;
use app\controller\LoginController;

$app->get('/', function(){});

//==========
$app->get('/tipoContato', TipoContatoController::class . ':selectTipoContato');
$app->post('/tipoContato', TipoContatoController::class . ':insertTipoContato');
$app->put('/tipoContato', TipoContatoController::class . ':updateTipoContato');
$app->delete('/tipoContato', TipoContatoController::class . ':deleteTipoContato');
//==========
$app->get('/empresa', EmpresaController::class . ':selectEmpresa');
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
$app->get('/documento', DocumentoController::class . ':selectDocumento');
$app->post('/documento', DocumentoController::class . ':insertDocumento');
$app->put('/documento', DocumentoController::class . ':updateDocumento');
$app->delete('/documento', DocumentoController::class . ':deleteDocumento');
$app->post('/documentoUpload', DocumentoController::class . ':upload');
//==========
$app->post('/login', LoginController::class . ':autenticar');
//==========

