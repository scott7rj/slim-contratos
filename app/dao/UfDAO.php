<?php
namespace app\dao;
use app\model\Uf;
use Exception;

class UfDAO extends Conexao {
    public function __construct() {
        parent::__construct();
    }
    public function selectUf() {
        try {
            $stmt = $this->pdo->prepare("SELECT * FROM [contratos].[fn_uf_selecionar]()");
            $stmt->execute();
            $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}