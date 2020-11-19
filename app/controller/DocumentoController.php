<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\DocumentoDAO;
use app\model\Documento;
use app\controller\AppController;
use Exception;

final class DocumentoController extends AppController {
    public function __construct() {
        parent::__construct();
    }

    public function insertDocumento(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new DocumentoDAO();
            $model = new Documento();
            $model->setIdTipoDocumento($data['idTipoDocumento']);
            $model->setNomeDocumento($data['nomeDocumento']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $dao->insertDocumento($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateDocumento(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new DocumentoDAO();
            $model = new Documento();
            $model->setIdDocumento($data['idDocumento']);
            $model->setIdTipoDocumento($data['idTipoDocumento']);
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setNomeDocumento($data['nomeDocumento']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $dao->updateDocumento($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteDocumento(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new DocumentoDAO();
            $model = new Documento();
            $model->setIdDocumento($data['idDocumento']);
            $result = $dao->deleteDocumento($model);
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