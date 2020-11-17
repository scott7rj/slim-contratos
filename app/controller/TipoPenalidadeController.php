<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\TipoPenalidadeDAO;
use app\model\TipoPenalidade;
use app\controller\AppController;
use Exception;

final class TipoPenalidadeController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function selectTipoPenalidade(Request $request, Response $response, array $args): Response {
        try {
            $tipoPenalidadeDAO = new TipoPenalidadeDAO();
            $result = $tipoPenalidadeDAO->selectTipoPenalidade();
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertTipoPenalidade(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $tipoPenalidadeDAO = new TipoPenalidadeDAO();
            $model = new TipoPenalidade();
            $model->setTipoPenalidade($data['tipoPenalidade']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $tipoPenalidadeDAO->insertTipoPenalidade($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateTipoPenalidade(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $tipoPenalidadeDAO = new TipoPenalidadeDAO();
            $model = new TipoPenalidade();
            $model->setIdTipoPenalidade($data['idTipoPenalidade']);
            $model->setTipoPenalidade($data['tipoPenalidade']);
            $model->setAtivo($data['ativo']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $tipoPenalidadeDAO->updateTipoPenalidade($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteTipoPenalidade(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $tipoPenalidadeDAO = new TipoPenalidadeDAO();
            $model = new TipoPenalidade();
            $model->setIdTipoPenalidade($data['idTipoPenalidade']);
            $result = $tipoPenalidadeDAO->deleteTipoPenalidade($model);
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