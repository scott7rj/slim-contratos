<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\CompromissoSiploDAO;
use app\model\CompromissoSiplo;
use app\controller\AppController;
use Exception;

final class CompromissoSiploController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function insertCompromissoSiplo(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new CompromissoSiploDAO();
            $model = new CompromissoSiplo();
            $model->setCompromissoSiplo($data['compromissoSiplo']);
            $model->setIdContrato($data['idContrato']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $dao->insertCompromissoSiplo($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateCompromissoSiplo(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new CompromissoSiploDAO();
            $model = new CompromissoSiplo();
            $model->setIdCompromissoSiplo($data['idCompromissoSiplo']);
            $model->setCompromissoSiplo($data['compromissoSiplo']);
            $model->setIdContrato($data['idContrato']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $dao->updateCompromissoSiplo($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteCompromissoSiplo(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new CompromissoSiploDAO();
            $model = new CompromissoSiplo();
            $model->setIdCompromissoSiplo($data['idCompromissoSiplo']);
            $result = $dao->deleteCompromissoSiplo($model);
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