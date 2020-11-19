<?php
namespace app\dao;
use app\model\CompromissoSiplo;
use Exception;

class CompromissoSiploDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }
	public function insertCompromissoSiplo(CompromissoSiplo $model) {
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

    public function updateCompromissoSiplo(CompromissoSiplo $model) {
        try {
        $stmt = $this->pdo->prepare("EXEC [contratos].[compromisso_siplo_alterar] 
                                        @id_compromisso_siplo = '{$model->getIdCompromissoSiplo()}', 
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

    public function deleteCompromissoSiplo(CompromissoSiplo $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[compromisso_siplo_remover] 
                                        @id_compromisso_siplo = '{$model->getIdCompromissoSiplo()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}