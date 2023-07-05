<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if (isset($_GET['id'])) {
        if ($pdo) {
            $sql = 'DELETE FROM "Decks"."DeckLists" Where "Id" = :id';
            $id = $_GET['id'];
            $sth = $pdo->prepare($sql);
            $sth->bindParam('id', $id);
            if($sth->execute()) {
                print '{"status": 1, "message": "Delete successful"}';
            } 
        }
    }
    else {
        print 'Missing parameters';
    }
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}

?>