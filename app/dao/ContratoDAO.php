<?php
namespace app\dao;
use app\model\Contrato;

class ContratoDAO extends Conexao {
    
    public function __construct() {
        parent::__construct();
    }

    public function selectContratoPorIdEmpresa($idEmpresa) {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_contrato_selecionar_por_id_empresa](:id_empresa)");
        $stmt->bindParam('id_empresa', $idEmpresa);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }

    public function insertContrato(Contrato $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[contrato_inserir] 
            							@contrato = '{$model->getContrato()}',
										@id_empresa = '{$model->getIdEmpresa()}',
										@data_inicio = '{$model->getDataInicio()}',
										@data_fim = '{$model->getDataFim()}',
										@id_tipo_contrato = '{$model->getIdTipoContrato()}',
										@valor_global_incial = '{$model->getValorGlobalInicial()}',
										@objeto_contratual = '{$model->getObjetoContratual()}',
										@compromisso_siplo = '{$model->getCompromissoSiplo()}',
										@numero_processo = '{$model->getNumeroProcesso()}',
										@dia_pagamento = '{$model->getDiaPagamento()}',
										@qtd_dias_alertar_pagamento =  '{$model->getQtdDiasAlertarPagamento()}',
										@prazo_recebimento_nota_fiscal = '{$model->getPrazoRecebimentoNotaFiscal()}',
										@dia_ateste = '{$model->getDiaAteste()}',
										@qtd_dias_alertar_ateste = '{$model->getQtdDiasAlertarAteste()}',
										@ordem_servico = '{$model->getOrdemServico()}',
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateContrato(Contrato $model) {
        try {
        $stmt = $this->pdo->prepare("EXEC [contratos].[contrato_alterar] 
                                        @id_contrato = '{$model->getIdContrato()}', 
                                        @contrato = '{$model->getContrato()}',
										@id_empresa = '{$model->getIdEmpresa()}',
										@data_inicio = '{$model->getDataInicio()}',
										@data_fim = '{$model->getDataFim()}',
										@id_tipo_contrato = '{$model->getIdTipoContrato()}',
										@valor_global_incial = '{$model->getValorGlobalInicial()}',
										@objeto_contratual = '{$model->getObjetoContratual()}',
										@compromisso_siplo = '{$model->getCompromissoSiplo()}',
										@numero_processo = '{$model->getNumeroProcesso()}',
										@dia_pagamento = '{$model->getDiaPagamento()}',
										@qtd_dias_alertar_pagamento =  '{$model->getQtdDiasAlertarPagamento()}',
										@prazo_recebimento_nota_fiscal = '{$model->getPrazoRecebimentoNotaFiscal()}',
										@dia_ateste = '{$model->getDiaAteste()}',
										@qtd_dias_alertar_ateste = '{$model->getQtdDiasAlertarAteste()}',
										@ordem_servico = '{$model->getOrdemServico()}',
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteContrato(Contrato $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[contrato_remover] 
                                        @id_contrato = '{$model->getIdContrato()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}