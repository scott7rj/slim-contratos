<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\ContratoDAO;
use app\model\Contrato;
use app\model\CompromissoSiplo;
use app\model\ContratoTipoPenalidade;
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
            $dao = new ContratoDAO();
            $result = $dao->selectContratoPorIdEmpresa($idEmpresa);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function selectContratoCompromissoSiplo(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getQueryParams();
            $idContrato = $data['idContrato'];
            $dao = new ContratoDAO();
            $result = $dao->selectContratoCompromissoSiplo($idContrato);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function selectContratoTipoPenalidade(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getQueryParams();
            $idContrato = $data['idContrato'];
            $ativo = $data['ativo'];
            $dao = new ContratoDAO();
            $model = new Contrato();
            $model->setIdContrato($idContrato);
            $model->setAtivo($ativo);
            $result = $dao->selectContratoTipoPenalidade($model);
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
            $dao = new ContratoDAO();
            $model = new Contrato();
            $model->setIdEmpresa($data['idEmpresa']);
            $model->setIdTipoContrato($data['idTipoContrato']);
            $model->setNumeroProcesso($data['numeroProcesso']);
            $model->setNumeroOrdemServico($data['numeroOrdemServico']);
            $model->setDataAssinatura(trim($data['dataAssinatura']));
            $model->setDataInicioVigencia(trim($data['dataInicioVigencia']));
            $model->setDataFimVigencia(trim($data['dataFimVigencia']));
            $model->setValorGlobalInicial($data['valorGlobalInicial']);
            $model->setValorGlobalAtualizado($data['valorGlobalAtualizado']);
            $model->setObjetoContratual($data['objetoContratual']);
            $model->setDiaPagamento($data['diaPagamento']);
            $model->setDiaPagamentoCorridos($data['diaPagamentoCorridos']);
            $model->setPrazoAlertaDiasPagamento($data['prazoAlertaDiasPagamento']);
            $model->setPrazoAlertaDiasAteste($data['prazoAlertaDiasAteste']);
            $model->setPrazoAlertaDiasNotaFiscal($data['prazoAlertaDiasNotaFiscal']);
            $model->setPrazoAlertaMesesFimVigencia($data['prazoAlertaMesesFimVigencia']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $dao->insertContrato($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertContratoCompromissoSiplo(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new ContratoDAO();
            $model = new CompromissoSiplo();
            $model->setCompromissoSiplo($data['compromissoSiplo']);
            $model->setIdContrato($data['idContrato']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $dao->insertContratoCompromissoSiplo($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
    public function insertContratoTipoPenalidade(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new ContratoDAO();
            $model = new ContratoTipoPenalidade();
            $model->setIdContrato($data['idContrato']);
            $model->setIdTipoPenalidade($data['idTipoPenalidade']);
            $result = $dao->insertContratoTipoPenalidade($model);
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
            $dao = new ContratoDAO();
            $model = new Contrato();
            $model->setIdContrato($data['idContrato']);
            $model->setNumeroProcesso($data['numeroProcesso']);
            $model->setNumeroOrdemServico($data['numeroOrdemServico']);
            $model->setDataAssinatura(trim($data['dataAssinatura']));
            $model->setDataInicioVigencia(trim($data['dataInicioVigencia']));
            $model->setDataFimVigencia(trim($data['dataFimVigencia']));
            $model->setValorGlobalInicial($data['valorGlobalInicial']);
            $model->setValorGlobalAtualizado($data['valorGlobalAtualizado']);
            $model->setObjetoContratual($data['objetoContratual']);
            $model->setDiaPagamento($data['diaPagamento']);
            $model->setDiaPagamentoCorridos($data['diaPagamentoCorridos']);
            $model->setPrazoAlertaDiasPagamento($data['prazoAlertaDiasPagamento']);
            $model->setPrazoAlertaDiasAteste($data['prazoAlertaDiasAteste']);
            $model->setPrazoAlertaDiasNotaFiscal($data['prazoAlertaDiasNotaFiscal']);
            $model->setPrazoAlertaMesesFimVigencia($data['prazoAlertaMesesFimVigencia']);
            $model->setUsuarioAlteracao($data['usuarioAlteracao']);
            $result = $dao->updateContrato($model);
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
            $dao = new ContratoDAO();
            $model = new Contrato();
            $model->setIdContrato($data['idContrato']);
            $result = $dao->deleteContrato($model);
            $response = $response->withJson([
                'message' => $result
            ]);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }

    public function deleteContratoTipoPenalidade(Request $request, Response $response, array $args): Response {
        try {
            $data = $request->getParsedBody();
            $dao = new ContratoDAO();
            $model = new ContratoTipoPenalidade();
            $model->setIdContrato($data['idContrato']);
            $model->setIdTipoPenalidade($data['idTipoPenalidade']);
            $result = $dao->deleteContratoTipoPenalidade($model);
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