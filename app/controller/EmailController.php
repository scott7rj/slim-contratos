<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\EmailDAO;
use app\model\Email;
use app\controller\AppController;
use Exception;

final class EmailController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function selectEmailPorIdEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $idEmpresa = $data['idEmpresa'];
            $emailDAO = new EmailDAO();
            $result = $emailDAO->selectEmailPorIdEmpresa($idEmpresa);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertEmail(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $emailDAO = new EmailDAO();
            $model = new Email();
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setIdTipoContato($data['idTipoContato']);
            $model->setEmail($data['email']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $emailDAO->insertEmail($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateEmail(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $emailDAO = new EmailDAO();
            $model = new Email();
            $model->setIdEmail($data['idEmail']);
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setIdTipoContato($data['idTipoContato']);
            $model->setEmail($data['email']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $emailDAO->updateEmail($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteEmail(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $emailDAO = new EmailDAO();
            $model = new Email();
            $model->setIdEmail($data['idEmail']);
            $result = $emailDAO->deleteEmail($model);
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