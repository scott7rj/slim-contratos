<?php
class Conexao {
    private static $connection;
    private function __construct(){

    }

    public static function getConnection() {
        $pdoConfig = "sqlsrv:Server=DF7436SR327;Database=DB7289_CONTRATOS_DES";

        try {
            if (!isset($connection)) {
                $connection = new PDO($pdoConfig, "s728901", "P@55_01#");
                $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            }
            return $connection;
        } catch (PDOException $e) {
            throw new Exception($e->getMessage());
        }
    }
}