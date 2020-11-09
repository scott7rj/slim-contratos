<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\DAO\TelefoneDAO;
use app\model\Telefone;
use AppController;
use Exception;

final class TelefoneController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function selectTelefonePorIdEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $idEmpresa = $data['idEmpresa'];
            $TelefoneDAO = new TelefoneDAO();
            $result = $TelefoneDAO->selectTelefonePorIdEmpresa($idEmpresa);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertTelefone(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $TelefoneDAO = new TelefoneDAO();
            $model = new Telefone();
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setIdTipoContato($data['idTipoContato']);
            $model->setTelefone($data['telefone']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $TelefoneDAO->insertTelefone($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateTelefone(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $TelefoneDAO = new TelefoneDAO();
            $model = new Telefone();
            $model->setIdTelefone($data['idTelefone']);
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setIdTipoContato($data['idTipoContato']);
            $model->setTelefone($data['telefone']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $TelefoneDAO->updateTelefone($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteTelefone(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $TelefoneDAO = new TelefoneDAO();
            $model = new Telefone();
            $model->setIdTelefone($data['idTelefone']);
            $result = $TelefoneDAO->deleteTelefone($model);
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