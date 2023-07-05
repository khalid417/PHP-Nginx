<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if (isset($_GET['user'])) {
        if ($pdo) {
            $sql = 'SELECT "DeckLists"."Id", "Name" FROM "Decks"."DeckLists" join "Users"."UserList" on "DeckLists"."Creator" = "UserList"."Id" WHERE "DisplayName" = :user';
            $user = $_GET['user'];
            $sth = $pdo->prepare($sql);
            $sth->bindParam('user', $user);
            if($sth->execute()) {
                print_r(json_encode($sth->fetchAll(PDO::FETCH_OBJ)));
            } 
        }
    }
    else {
        $sql = 'SELECT "Id", "Name" FROM "Decks"."DeckLists"';
        $sth = $pdo->prepare($sql);
        if($sth->execute()) {
            print_r(json_encode($sth->fetchAll(PDO::FETCH_OBJ)));
        } 
    }
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}

?>