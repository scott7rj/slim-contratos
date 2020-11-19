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
            $dao = new EmpresaDAO();
            $result = $dao->selectEmpresa();
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
            $dao = new EmpresaDAO();
            $model = new Empresa();
            $model->setIdEmpresa($data['idEmpresa']);
            $result = $dao->selectEmpresaPorId($model);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function selectEmpresaTelefone(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getQueryParams();
            $idEmpresa = $data['idEmpresa'];
            $dao = new EmpresaDAO();
            $result = $dao->selectEmpresaTelefone($idEmpresa);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function selectEmpresaEmail(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getQueryParams();
            $idEmpresa = $data['idEmpresa'];
            $dao = new EmpresaDAO();
            $result = $dao->selectEmpresaEmail($idEmpresa);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function selectEmpresaDocumento(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getQueryParams();
            $idEmpresa = $data['idEmpresa'];
            $dao = new EmpresaDAO();
            $result = $dao->selectEmpresaDocumento($idEmpresa);
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
            $dao = new EmpresaDAO();
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
            $result = $dao->insertEmpresa($model);
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
            $dao = new EmpresaDAO();
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
            $result = $dao->updateEmpresa($model);
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
            $dao = new EmpresaDAO();
            $model = new Empresa();
            $model->setIdEmpresa($data['idEmpresa']);
            $result = $dao->deleteEmpresa($model);
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