<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\ContratoDAO;
use app\model\Contrato;
use app\controller\AppController;
use Exception;

final class ContratoController extends AppController {

    public function __construct() {
        parent::__construct();
    }

    public function selectContratoPorIdEmpresa(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getQueryParams();
            $idEmpresa = $data['idEmpresa'];
            $contratoDAO = new ContratoDAO();
            $result = $contratoDAO->selectContratoPorIdEmpresa($idEmpresa);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertContrato(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $contratoDAO = new ContratoDAO();
            $model = new Contrato();
            $model->setContrato($data['contrato']);
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setDataInicio($data['dataInicio']);
            $model->setDataFim($data['dataFim']);
            $model->setIdTipoContrato($data['idTipoContrato']);
            $model->setValorGlobalInicial($data['valorGlobalInicial']);
            $model->setObjetoContratual($data['objetoContratual']);
            $model->setCompromissoSiplo($data['compromissoSiplo']);
            $model->setNumeroProcesso($data['numeroProcesso']);
            $model->setDiaPagamento($data['diaPagamento']);
            $model->setQtdDiasAlertarPagamento($data['qtdDiasAlertarPagamento']);
            $model->setPrazoRecebimentoNotaFiscal($data['prazoRecebimentoNotaFiscal']);
            $model->setDiaAteste($data['diaAteste']);
            $model->setQtdDiasAlertarAteste($data['qtdDiasAlertarAteste']);
            $model->setOrdemServico($data['ordemServico']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $contratoDAO->insertContrato($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function updateContrato(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $contratoDAO = new ContratoDAO();
            $model = new Contrato();
            $model->setIdContrato($data['idContrato']);
            $model->setContrato($data['contrato']);
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setDataInicio($data['dataInicio']);
            $model->setDataFim($data['dataFim']);
            $model->setIdTipoContrato($data['idTipoContrato']);
            $model->setValorGlobalInicial($data['valorGlobalInicial']);
            $model->setObjetoContratual($data['objetoContratual']);
            $model->setCompromissoSiplo($data['compromissoSiplo']);
            $model->setNumeroProcesso($data['numeroProcesso']);
            $model->setDiaPagamento($data['diaPagamento']);
            $model->setQtdDiasAlertarPagamento($data['qtdDiasAlertarPagamento']);
            $model->setPrazoRecebimentoNotaFiscal($data['prazoRecebimentoNotaFiscal']);
            $model->setDiaAteste($data['diaAteste']);
            $model->setQtdDiasAlertarAteste($data['qtdDiasAlertarAteste']);
            $model->setOrdemServico($data['ordemServico']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $contratoDAO->insertContrato($model);
            $result = $contratoDAO->updateContrato($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function deleteContrato(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $contratoDAO = new ContratoDAO();
            $model = new Contrato();
            $model->setIdContrato($data['idContrato']);
            $result = $contratoDAO->deleteContrato($model);
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