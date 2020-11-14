<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\EmpresaDAO;
use app\model\Empresa;
use app\controller\AppController;
use Exception;

final class EmpresaController extends AppController {

    public function __construct() {
        parent::__construct();
    }

    public function selectEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $empresaDAO = new EmpresaDAO();
            $result = $empresaDAO->selectEmpresa();
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }

    public function selectEmpresaPorId(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getQueryParams();
            $empresaDAO = new EmpresaDAO();
            $model = new Empresa();
            $model->setIdEmpresa($data['idEmpresa']);
            $result = $empresaDAO->selectEmpresaPorId($model);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }

    public function selectEmpresaPorNomeOuCnpj(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getQueryParams();
            $empresaDAO = new EmpresaDAO();
            $model = new Empresa();
            $model->setEmpresa($data['empresa']);
            $model->setCnpj($data['cnpj']);
            $result = $empresaDAO->selectEmpresaPorNomeOuCnpj($model);
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
            $empresaDAO = new EmpresaDAO();
            $model = new Empresa();
            $model->setEmpresa($data['empresa']);
            $model->setCnpj($data['cnpj']);
            $model->setEndereco($data['endereco']);
            $model->setCidade($data['cidade']);
            $model->setUf($data['uf']);
            $model->setCep($data['cep']);
            $model->setObservacao($data['observacao']);
            $model->setAtivo($data['ativo']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $empresaDAO->insertEmpresa($model);
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
            $empresaDAO = new EmpresaDAO();
            $model = new Empresa();
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setEmpresa($data['empresa']);
            $model->setCnpj($data['cnpj']);
            $model->setEndereco($data['endereco']);
            $model->setCidade($data['cidade']);
            $model->setUf($data['uf']);
            $model->setCep($data['cep']);
            $model->setObservacao($data['observacao']);
            $model->setAtivo($data['ativo']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $empresaDAO->updateEmpresa($model);
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
            $empresaDAO = new EmpresaDAO();
            $model = new Empresa();
            $model->setIdEmpresa($data['idEmpresa']);
            $result = $empresaDAO->deleteEmpresa($model);
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