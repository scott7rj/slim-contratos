<?php
namespace app\dao;
use app\model\TipoPenalidade;
use Exception;

class TipoPenalidadeDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }
    public function selectTipoPenalidade() {
        try {
            $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_tipo_penalidade_selecionar](:ativo)");
            $ativo = 1;
            $stmt->bindParam('ativo', $ativo);
            $stmt->execute();
            $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function insertTipoPenalidade(TipoPenalidade $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[tipo_penalidade_inserir] 
                                        @tipo_penalidade = '{$model->getTipoPenalidade()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateTipoPenalidade(TipoPenalidade $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[tipo_penalidade_alterar] 
                                        @id_tipo_penalidade = '{$model->getIdTipoPenalidade()}', 
                                        @tipo_penalidade = '{$model->getTipoPenalidade()}', 
                                        @ativo = '{$model->getAtivo()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteTipoPenalidade(TipoPenalidade $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[tipo_penalidade_remover] 
                                        @id_tipo_penalidade = '{$model->getIdTipoPenalidade()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}