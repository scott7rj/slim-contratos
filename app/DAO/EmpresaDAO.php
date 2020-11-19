<?php
namespace app\dao;
use app\model\Empresa;
use app\dao\DbUtil;

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

    public function selectEmpresaPorId(Empresa $model) {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_empresa_selecionar_por_id](:id_empresa)");
        $ativo = 1;
        $idEmpresa = $model->getIdEmpresa();
        $stmt->bindParam('id_empresa', $idEmpresa);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }
    public function selectEmpresaTelefone($idEmpresa) {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_telefone_selecionar_por_id_empresa](:id_empresa)");
        $stmt->bindParam('id_empresa', $idEmpresa);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }
    public function selectEmpresaEmail($idEmpresa) {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_Email_selecionar_por_id_empresa](:id_empresa)");
        $stmt->bindParam('id_empresa', $idEmpresa);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }
    public function selectEmpresaDocumento($idEmpresa) {
        $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_Documento_selecionar_por_id_empresa](:id_empresa)");
        $stmt->bindParam('id_empresa', $idEmpresa);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }

    public function insertEmpresa(Empresa $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[empresa_inserir] 
                                        @empresa = '{$model->getEmpresa()}', 
                                        @cnpj = '{$model->getCnpj()}',
                                        @endereco= '{$model->getEndereco()}',
                                        @cidade= '{$model->getCidade()}',
                                        @uf= '{$model->getUf()}',
                                        @cep= '{$model->getCep()}',
                                        @observacao= '{$model->getObservacao()}',
                                        @ativo= '{$model->getAtivo()}',
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
                                        @cnpj = '{$model->getCnpj()}',
                                        @endereco= '{$model->getEndereco()}',
                                        @cidade= '{$model->getCidade()}',
                                        @uf= '{$model->getUf()}',
                                        @cep= '{$model->getCep()}',
                                        @observacao= '{$model->getObservacao()}',
                                        @ativo= '{$model->getAtivo()}',
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