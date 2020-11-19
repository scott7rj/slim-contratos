<?php
namespace app\dao;
use app\model\Email;

class EmailDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }

    public function insertEmail(Email $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[email_inserir] 
                                        @id_empresa = '{$model->getIdEmpresa()}', 
                                        @id_tipo_contato = '{$model->getIdTipoContato()}', 
                                        @email = '{$model->getEmail()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateEmail(Email $model) {
        try {
        $stmt = $this->pdo->prepare("EXEC [contratos].[email_alterar] 
                                        @id_Email = '{$model->getIdEmail()}', 
                                        @id_empresa = '{$model->getIdEmpresa()}', 
                                        @id_tipo_contato = '{$model->getIdTipoContato()}', 
                                        @email = '{$model->getEmail()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteEmail(Email $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[email_remover] 
                                        @id_email = '{$model->getIdEmail()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}