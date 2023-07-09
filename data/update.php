<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if (isset($_GET['instance']) && isset($_GET['status'])) {
        if ($pdo) {
            $instance = $_GET['instance'];
            $state = $_GET['status'];
            $sql = 'INSERT INTO "Games"."Instances" ("InstanceName", "InstanceState") VALUES (:instance, :state)
                    ON CONFLICT ("InstanceName") DO UPDATE SET "InstanceState" = :state, "Player1" = NULL, "Player2" = NULL';
            $sth = $pdo->prepare($sql);
            $sth->bindParam('instance', $instance);
            $sth->bindParam('state', $state);
            $sth->execute();
        }
        else {
            print 'Problem executing query with instance name '.$instance;
        }
    }
    else {
        print 'Missing instance Parameter.';
    }
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}
?>