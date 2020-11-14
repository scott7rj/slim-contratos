<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\TipoContratoDAO;
use app\model\TipoContrato;
use app\controller\AppController;
use Exception;

final class TipoContratoController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function selectTipoContrato(Request $request, Response $response, array $args): Response {
        try {
            $tipoContratoDAO = new TipoContratoDAO();
            $result = $tipoContratoDAO->selectTipoContrato();
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertTipoContrato(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $tipoContratoDAO = new TipoContratoDAO();
            $model = new TipoContrato();
            $model->setTipoContrato($data['tipoContrato']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $tipoContratoDAO->insertTipoContrato($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateTipoContrato(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $tipoContratoDAO = new TipoContratoDAO();
            $model = new TipoContrato();
            $model->setIdTipoContrato($data['idTipoContrato']);
            $model->setTipoContrato($data['tipoContrato']);
            $model->setAtivo($data['ativo']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $tipoContratoDAO->updateTipoContrato($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteTipoContrato(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $tipoContratoDAO = new TipoContratoDAO();
            $model = new TipoContrato();
            $model->setIdTipoContrato($data['idTipoContrato']);
            $result = $tipoContratoDAO->deleteTipoContrato($model);
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