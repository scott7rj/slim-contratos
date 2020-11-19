<?php
namespace app\dao;
use app\model\Documento;

class DocumentoDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }

    public function insertDocumento(Documento $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[Documento_inserir] 
                                        @id_tipo_documento = '{$model->getIdTipoDocumento()}',
                                        @id_dominio = '{$model->getIdDo}',
                                        @data_validade = '{$model->getDataValidade()}',
                                        @nome_documento = '{$model->getNomeDocumento()}',
                                        @observacao = '{$model->getObservacao()}',
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateDocumento(Documento $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[Documento_alterar] 
                                        @id_Documento = '{$model->getIdDocumento()}', 
                                        @id_empresa = '{$model->getIdEmpresa()}', 
                                        @id_tipo_contato = '{$model->getIdTipoContato()}', 
                                        @Documento = '{$model->getDocumento()}', 
                                        @usuario_alteracao = '{$model->getUsuarioAlteracao()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteDocumento(Documento $model) {
        try {
            $stmt = $this->pdo->prepare("EXEC [contratos].[Documento_remover] 
                                        @id_Documento = '{$model->getIdDocumento()}'");
            $stmt->execute();
            $result = $stmt->fetch(\PDO::FETCH_COLUMN);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function upload() {

    }
}