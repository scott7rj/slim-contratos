<?php
namespace app\DAO;
use app\model\DominioDocumento;

class DominioDocumentoDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }
    public function selectDominioDocumento() {
        try {
            $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_dominio_documento_selecionar]");
            $stmt->execute();
            $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function insertDominioDocumento(DominioDocumento $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[dominio_documento_inserir] 
                                        @dominio_documento = '{$model->getDominioDocumento()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateDominioDocumento(DominioDocumento $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[dominio_documento_alterar] 
                                        @id_dominio_documento = '{$model->getIdDominioDocumento()}', 
                                        @dominio_documento = '{$model->getDominioDocumento()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteDominioDocumento(DominioDocumento $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[dominio_documento_remover] 
                                        @id_dominio_documento = '{$model->getIdDominioDocumento()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}