<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\DominioDocumentoDAO;
use app\model\DominioDocumento;
use app\controller\AppController;
use Exception;

final class DominioDocumentoController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function selectDominioDocumento(Request $request, Response $response, array $args): Response {
        try {
            $dao = new DominioDocumentoDAO();
            $result = $dao->selectDominioDocumento();
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertDominioDocumento(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new DominioDocumentoDAO();
            $model = new DominioDocumento();
            $model->setDominioDocumento($data['dominioDocumento']);
            $result = $dao->insertDominioDocumento($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateDominioDocumento(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new DominioDocumentoDAO();
            $model = new DominioDocumento();
            $model->setIdDominioDocumento($data['idDominioDocumento']);
            $model->setDominioDocumento($data['dominioDocumento']);
            $result = $dao->updateDominioDocumento($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteDominioDocumento(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new DominioDocumentoDAO();
            $model = new DominioDocumento();
            $model->setIdDominioDocumento($data['idDominioDocumento']);
            $result = $dao->deleteDominioDocumento($model);
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