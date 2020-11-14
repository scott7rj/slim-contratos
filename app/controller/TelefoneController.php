<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\TelefoneDAO;
use app\model\Telefone;
use app\controller\AppController;
use Exception;

final class TelefoneController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function selectTelefonePorIdEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getQueryParams();
            $idEmpresa = $data['idEmpresa'];
            $telefoneDAO = new TelefoneDAO();
            $result = $telefoneDAO->selectTelefonePorIdEmpresa($idEmpresa);
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
            $telefoneDAO = new TelefoneDAO();
            $model = new Telefone();
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setIdTipoContato($data['idTipoContato']);
            $model->setTelefone($data['telefone']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $telefoneDAO->insertTelefone($model);
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
            $telefoneDAO = new TelefoneDAO();
            $model = new Telefone();
            $model->setIdTelefone($data['idTelefone']);
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setIdTipoContato($data['idTipoContato']);
            $model->setTelefone($data['telefone']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $telefoneDAO->updateTelefone($model);
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
            $telefoneDAO = new TelefoneDAO();
            $model = new Telefone();
            $model->setIdTelefone($data['idTelefone']);
            $result = $telefoneDAO->deleteTelefone($model);
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