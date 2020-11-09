<?php
namespace app\DAO;

use Exception;
use PDOException;

abstract class Conexao {
    protected $pdo;
    //protected $conn;
    //protected $result;
    public function __construct() {
        try {
            $host = getenv('DB_HOST');
            $database = getenv('DB_DATABASE');
            $user = getenv('DB_USER');
            $password = getenv('DB_PASSWORD');
            $dsn = "sqlsrv:Server={$host};Database={$database}";
            $this->pdo = new \PDO($dsn, $user, $password);
            $this->pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            //$this->conn = odbc_connect(getenv('DB_ODBC_DSN'), $user, $password) or die('Falha na conexao: '.odbc_error());
        } catch (PDOException $e) {
            throw new Exception($e->getMessage());
        }
    }
    /*
    public function exec($sql) {
        $this->result = odbc_exec($this->con, $sql) or die($sql.": ".odbc_error());
    }
    */
}