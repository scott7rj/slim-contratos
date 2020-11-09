<?php
namespace app\DAO;
use app\model\TipoContato;
use Exception;

class TipoContatoDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }
    public function selectTipoContato() {
        try {
            $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_tipo_contato_selecionar](:ativo)");
            $ativo = 1;
            $stmt->bindParam('ativo', $ativo);
            $stmt->execute();
            $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function insertTipoContato(TipoContato $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[tipo_contato_inserir] 
                                        @tipo_contato = '{$model->getTipoContato()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateTipoContato(TipoContato $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[tipo_contato_alterar] 
                                        @id_tipo_contato = '{$model->getIdTipoContato()}', 
                                        @tipo_contato = '{$model->getTipoContato()}', 
                                        @ativo = '{$model->getAtivo()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteTipoContato(TipoContato $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[tipo_contato_remover] 
                                        @id_tipo_contato = '{$model->getIdTipoContato()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}