<?php
namespace app\dao;
use app\model\TipoContrato;

class TipoContratoDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }
    public function selectTipoContrato() {
        try {
            $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_tipo_contrato_selecionar](:ativo)");
            $ativo = 1;
            $stmt->bindParam('ativo', $ativo);
            $stmt->execute();
            $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function insertTipoContrato(TipoContrato $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[tipo_contrato_inserir] 
                                        @tipo_Contrato = '{$model->getTipoContrato()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateTipoContrato(TipoContrato $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[tipo_contrato_alterar] 
                                        @id_tipo_Contrato = '{$model->getIdTipoContrato()}', 
                                        @tipo_Contrato = '{$model->getTipoContrato()}', 
                                        @ativo = '{$model->getAtivo()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteTipoContrato(TipoContrato $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[tipo_contrato_remover] 
                                        @id_tipo_Contrato = '{$model->getIdTipoContrato()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}