<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\DAO\EmpresaDAO;
use app\model\Empresa;
use app\controller\AppController;
use Exception;

final class EmpresaController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function selectEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $EmpresaDAO = new EmpresaDAO();
            $result = $EmpresaDAO->selectEmpresa();
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $EmpresaDAO = new EmpresaDAO();
            $model = new Empresa();
            $model->setEmpresa($data['empresa']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $EmpresaDAO->insertEmpresa($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $EmpresaDAO = new EmpresaDAO();
            $model = new Empresa();
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setEmpresa($data['empresa']);
            $model->setAtivo($data['ativo']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $EmpresaDAO->updateEmpresa($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $EmpresaDAO = new EmpresaDAO();
            $model = new Empresa();
            $model->setIdEmpresa($data['idEmpresa']);
            $result = $EmpresaDAO->deleteEmpresa($model);
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