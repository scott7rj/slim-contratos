<?php
namespace app\dao;
use app\model\Contrato;
use app\model\CompromissoSiplo;
use app\model\ContratoTipoPenalidade;

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

    public function selectContratoTipoPenalidade($idContrato) {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_tipo_penalidade_selecionar_por_id_contrato](:id_contrato)");
        $stmt->bindParam('id_contrato', $idContrato);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }

    public function selectContratoCompromissoSiplo($idContrato) {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_compromisso_siplo_selecionar_por_id_contrato](:id_contrato)");
        $stmt->bindParam('id_contrato', $idContrato);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }

    public function insertContrato(Contrato $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[contrato_inserir] 
            							@id_empresa = '{$model->getIdEmpresa()}',
                                        @id_tipo_contrato = '{$model->getIdTipoContrato()}',
                                        @contrato = '{$model->getContrato()}',
                                        @numero_processo = '{$model->getNumeroProcesso()}',
                                        @numero_ordem_servico = '{$model->getNumeroOrdemServico()}',
                                        @data_assinatura = '{$model->getDataAssinatura()}',
                                        @data_inicio_vigencia = '{$model->getDataInicioVigencia()}',
                                        @data_fim_vigencia = '{$model->getDataFimVigencia()}',
                                        @valor_global_inicial = '{$model->getValorGlobalInicial()}',
                                        @valor_global_atualizado = '{$model->getValorGlobalAtualizado()}',
                                        @objeto_contratual = '{$model->getObjetoContratual()}',
                                        @dia_pagamento = '{$model->getDiaPagamento()}',
                                        @dia_pagamento_corridos = '{$model->getDiaPagamentoCorridos()}',
                                        @prazo_alerta_dias_pagamento = '{$model->getPrazoAlertaDiasPagamento()}',
                                        @prazo_alerta_dias_ateste = '{$model->getPrazoAlertaDiasAteste()}',
                                        @prazo_alerta_dias_nota_fiscal = '{$model->getPrazoAlertaDiasNotaFiscal()}',
                                        @prazo_alerta_meses_fim_vigencia = '{$model->getPrazoAlertaMesesFimVigencia()}',
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
    public function insertContratoCompromissoSiplo(CompromissoSiplo $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[compromisso_siplo_inserir] 
                                        @compromisso_siplo = '{$model->getCompromissoSiplo()}',
                                        @id_contrato = '{$model->getIdContrato()}',
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
    public function insertContratoTipoPenalidade(ContratoTipoPenalidade $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[contrato_tipo_penalidade_inserir] 
                                        @id_contrato = '{$model->getIdContrato()}',
                                        @id_tipo_penalidade = '{$model->getIdTipoPenalidade()}'");
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
                                        @id_empresa = '{$model->getIdEmpresa()}',
                                        @id_tipo_contrato = '{$model->getIdTipoContrato()}',
                                        @contrato = '{$model->getContrato()}',
                                        @numero_processo = '{$model->getNumeroProcesso()}',
                                        @numero_ordem_servico = '{$model->getNumeroOrdemServico()}',
                                        @data_assinatura = '{$model->getDataAssinatura()}',
                                        @data_inicio_vigencia = '{$model->getDataInicioVigencia()}',
                                        @data_fim_vigencia = '{$model->getDataFimVigencia()}',
                                        @valor_global_inicial = '{$model->getValorGlobalInicial()}',
                                        @valor_global_atualizado = '{$model->getValorGlobalAtualizado()}',
                                        @objeto_contratual = '{$model->getObjetoContratual()}',
                                        @dia_pagamento = '{$model->getDiaPagamento()}',
                                        @dia_pagamento_corridos = '{$model->getDiaPagamentoCorridos()}',
                                        @prazo_alerta_dias_pagamento = '{$model->getPrazoAlertaDiasPagamento()}',
                                        @prazo_alerta_dias_ateste = '{$model->getPrazoAlertaDiasAteste()}',
                                        @prazo_alerta_dias_nota_fiscal = '{$model->getPrazoAlertaDiasNotaFiscal()}',
                                        @prazo_alerta_meses_fim_vigencia = '{$model->getPrazoAlertaMesesFimVigencia()}',
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
    public function deleteContratoCompromissoSiplo(CompromissoSiplo $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[compromisso_siplo_remover] 
                                        @id_contrato = '{$model->getIdCompromissoSiplo()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
    public function deleteContratoTipoPenalidade(ContratoTipoPenalidade $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[contrato_tipo_penalidade_remover] 
                                        @id_contrato = '{$model->getIdContrato()}',
                                        @id_tipo_penalidade = '{$model->getIdTipoPenalidade()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}