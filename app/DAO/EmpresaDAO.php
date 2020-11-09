<?php
namespace app\DAO;
use app\model\Empresa;

class EmpresaDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }
    public function selectEmpresa() {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_empresa_selecionar](:ativo)");
        $ativo = 1;
        $stmt->bindParam('ativo', $ativo);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }

    public function insertEmpresa(Empresa $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[empresa_inserir] 
                                        @empresa = '{$model->getEmpresa()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateEmpresa(Empresa $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[empresa_alterar] 
                                        @id_empresa = '{$model->getIdEmpresa()}', 
                                        @empresa = '{$model->getEmpresa()}', 
                                        @ativo = '{$model->getAtivo()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteEmpresa(Empresa $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[empresa_remover] 
                                        @id_empresa = '{$model->getIdEmpresa()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}