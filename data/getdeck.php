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
            $sql = 'SELECT "SetId", "FrontAsset" FROM "Decks"."CardEntries" join "Cards"."CardData" on
             "CardEntries"."CardId" = "CardData"."Id" WHERE "DeckId" = :id';
            $id = $_GET['id'];
            $sth = $pdo->prepare($sql);
            $sth->bindParam('id', $id);
            if($sth->execute()) {
                print_r(json_encode($sth->fetchAll(PDO::FETCH_OBJ)));
            } 
        }
    }
    else {
        print 'Missing parameter id';
    }
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}

?>