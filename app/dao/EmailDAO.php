<?php
namespace app\dao;
use app\model\Email;

class EmailDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }
    public function selectEmailPorIdEmpresa($idEmpresa) {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_Email_selecionar_por_id_empresa](:id_empresa)");
        $stmt->bindParam('id_empresa', $idEmpresa);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }

    public function insertEmail(Email $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[Email_inserir] 
                                        @id_empresa = '{$model->getIdEmpresa()}', 
                                        @id_tipo_contato = '{$model->getIdTipoContato()}', 
                                        @Email = '{$model->getEmail()}', 
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
        $stmt = $this->pdo->prepare("EXEC [contratos].[Email_alterar] 
                                        @id_Email = '{$model->getIdEmail()}', 
                                        @id_empresa = '{$model->getIdEmpresa()}', 
                                        @id_tipo_contato = '{$model->getIdTipoContato()}', 
                                        @Email = '{$model->getEmail()}', 
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
            $stmt = $this->pdo->prepare("EXEC [contratos].[Email_remover] 
                                        @id_Email = '{$model->getIdEmail()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}