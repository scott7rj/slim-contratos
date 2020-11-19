<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\TipoContatoDAO;
use app\model\TipoContato;
use app\controller\AppController;
use Exception;

final class TipoContatoController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function selectTipoContato(Request $request, Response $response, array $args): Response {
        try {
            $dao = new TipoContatoDAO();
            $result = $dao->selectTipoContato();
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertTipoContato(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new TipoContatoDAO();
            $model = new TipoContato();
            $model->setTipoContato($data['tipoContato']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $dao->insertTipoContato($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateTipoContato(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new TipoContatoDAO();
            $model = new TipoContato();
            $model->setIdTipoContato($data['idTipoContato']);
            $model->setTipoContato($data['tipoContato']);
            $model->setAtivo($data['ativo']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $dao->updateTipoContato($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteTipoContato(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new TipoContatoDAO();
            $model = new TipoContato();
            $model->setIdTipoContato($data['idTipoContato']);
            $result = $dao->deleteTipoContato($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
}