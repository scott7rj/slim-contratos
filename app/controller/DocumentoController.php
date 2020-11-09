<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\DAO\DocumentoDAO;
use app\model\Documento;
use app\controller\AppController;
use Exception;

final class DocumentoController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function selectDocumentoPorIdEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $idEmpresa = $data['idEmpresa'];
            $DocumentoDAO = new DocumentoDAO();
            $result = $DocumentoDAO->selectDocumentoPorIdEmpresa($idEmpresa);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertDocumento(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $DocumentoDAO = new DocumentoDAO();
            $model = new Documento();
            $model->setIdTipoDocumento($data['idTipoDocumento']);
            $model->setNomeDocumento($data['nomeDocumento']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $DocumentoDAO->insertDocumento($model);
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
            $DocumentoDAO = new DocumentoDAO();
            $model = new Documento();
            $model->setIdDocumento($data['idDocumento']);
            $model->setIdTipoDocumento($data['idTipoDocumento']);
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setNomeDocumento($data['nomeDocumento']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $DocumentoDAO->updateDocumento($model);
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
            $DocumentoDAO = new DocumentoDAO();
            $model = new Documento();
            $model->setIdDocumento($data['idDocumento']);
            $result = $DocumentoDAO->deleteDocumento($model);
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