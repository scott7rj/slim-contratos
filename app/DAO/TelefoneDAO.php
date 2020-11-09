<?php
namespace app\DAO;
use app\model\Telefone;

class TelefoneDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }
    public function selectTelefonePorIdEmpresa($idEmpresa) {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_telefone_selecionar_por_id_empresa](:id_empresa)");
        $stmt->bindParam('id_empresa', $idEmpresa);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }

    public function insertTelefone(Telefone $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[telefone_inserir] 
                                        @id_empresa = '{$model->getIdEmpresa()}', 
                                        @id_tipo_contato = '{$model->getIdTipoContato()}', 
                                        @telefone = '{$model->getTelefone()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateTelefone(Telefone $model) {
        try {
        $stmt = $this->pdo->prepare("EXEC [contratos].[telefone_alterar] 
                                        @id_telefone = '{$model->getIdTelefone()}', 
                                        @id_empresa = '{$model->getIdEmpresa()}', 
                                        @id_tipo_contato = '{$model->getIdTipoContato()}', 
                                        @telefone = '{$model->getTelefone()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteTelefone(Telefone $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[telefone_remover] 
                                        @id_telefone = '{$model->getIdTelefone()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}