<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if (isset($_GET['id']) && isset($_GET['name'])) {
        if ($pdo) {
            $sql = 'UPDATE "Decks"."DeckLists" SET "Name" = :name WHERE "Id" = :id';
            $id = $_GET['id'];
            $name = $_GET['name'];
            $sth = $pdo->prepare($sql);
            $sth->bindParam('id', $id);
            $sth->bindParam('name', $name);
            if($sth->execute()) {
                print '{"status": 1, "message": "Rename successful"}';
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