<?php

class DatabaseService
{

    public function __construct($table)
    {
        $this->table = $table;
    }

    private static $connection = null;
    private function connect(){
        if (self::$connection == null) {
            //Connexion à la DB
            $db_config = $_ENV['config']->db;
            $host = $db_config->host;
            $port = $db_config->port;
            $dbName = $db_config->dbName;
            $dsn = "mysql:host=$host;port=$port;dbname=$dbName";
            $user = $db_config->user;
            $pass = $db_config->pass;
            try {
                $db_connection = new PDO(
                    $dsn,
                    $user,
                    $pass,
                    array(
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
                    )
                );
            } catch (PDOException $e) {
                die("Erreur de connexion à la base de données : $e->getMessage()");
            }
            self::$connection = $db_connection;
        }
        return self::$connection;
    }

    public function query($sql, $params){
        $statment = $this->connect()->prepare($sql);
        $result = $statment->execute($params);
        return (object)['result' => $result, 'statement' => $statment];
    }

    public function selectAll(){
        $sql = "SELECT * FROM $this->table WHERE is_deleted = ?";
        $resp = $this->query($sql, [0]);
        $rows = $resp->statement->fetchAll(PDO::FETCH_CLASS);
        return $rows;
    }

    public function selectOne($id){
        $sql = "SELECT * FROM $this->table WHERE is_deleted = ? AND Id_$this->table = ?";
        $resp = $this->query($sql, [0, $id]);
        $rows = $resp->statement->fetchAll(PDO::FETCH_CLASS);
        $row = $resp->result && count($rows) == 1 ? $rows[0] : null;
        return $row;
    }
    public function selectWhere($where = null)
    {
        $sql = "SELECT * FROM $this->table" . (isset($where) ?? " WHERE $where") . " ;";
        $resp = $this->query($sql, [0]);
        $rows = $resp->statement->fetchAll(PDO::FETCH_CLASS);
        return $rows;
    }

    function insertOne($body = []){ //TODO insertMany
        $columns = "";
        $values = "";
        if(isset($fields["Id_$this->table"])){
            unset($fields["Id_$this->table"]);
        }
        $valuesToBind = array();
        foreach ($body as $k => $v) {
            $columns .= $k . ",";
            $values .= "?,";
            array_push($valuesToBind, $v);
        }
        $columns = trim($columns, ',');
        $values = trim($values, ',');
        $sql = "INSERT INTO $this->table ($columns) VALUES ($values)";
        $resp = $this->query($sql, $valuesToBind);
        if($resp->result && $resp->statment->rowCount() == 1){
            $insertedId = self::$connection->lastInsertId();
            $row = $this->selectOne($insertedId);
            return $row;
        }
        return false;
    }
}