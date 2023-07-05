<?php
function addEntries($conn, $deckId, $deck) {
    $ids = explode('&', $deck);
    $cardIdSql = 'SELECT "Id" FROM "Cards"."CardData" where "SetId" = :setid';
    $insertSql = 'INSERT INTO "Decks"."CardEntries" ("DeckId", "CardId") values (:deckid, :cardid)';
    $sth = $conn->prepare($cardIdSql);
    $sth2 = $conn->prepare($insertSql);
    $sth2->bindParam('deckid', $deckId);
    foreach ($ids as $id) {
        $sth->bindParam('setid', $id);
        if ($sth->execute()) {
            $cardId = $sth->fetchColumn();
            if ($cardId) {
                $sth2->bindParam('cardid', $cardId);
                $sth2->execute();
            }
        }
    }
    print '{"status":1, message:"Deck created successfully!"}';
}
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if ($pdo) {
        $username = $_POST['user'];
        $deckname = $_POST['deckname'];
        $decklist = $_POST['decklist'];
        $userRetrieveSql = 'SELECT "Id" FROM "Users"."UserList" WHERE "DisplayName" = :user';
        $sth = $pdo->prepare($userRetrieveSql);
        $sth->bindParam('user', $username);
        if($sth->execute()) {
            $id = $sth->fetchColumn();
            $checkExistingSql = 'SELECT "Id" FROM "Decks"."DeckLists" WHERE "Creator" = :user and "Name" = :deckname';
            $sth2 = $pdo->prepare($checkExistingSql);
            $sth2->bindParam('user', $id);
            $sth2->bindParam('deckname', $deckname);
            if ($sth2->execute()) {
                $entry = $sth2->fetchColumn();
                if (!$entry) {
                    // create new decklist
                    $createSql = 'INSERT INTO "Decks"."DeckLists" ("Name", "Creator") values (:deckname, :user)';
                    $sth4 = $pdo->prepare($createSql);
                    $sth4->bindParam('deckname', $deckname);
                    $sth4->bindParam('user', $id);
                    if ($sth4->execute()) {
                        if ($sth2->execute()) {
                            $entry = $sth2->fetchColumn();
                            addEntries($pdo, $entry, $decklist);
                        }
                    }
                }
                else {
                    if (isset($_GET['force'])) {
                        // remove entries from card entries
                        $deleteSql = 'DELETE FROM "Decks"."CardEntries" Where "DeckId" = :deckid';
                        $sth3 = $pdo->prepare($deleteSql);
                        $sth3->bindParam('deckid', $entry);
                        if ($sth3->execute()) {
                            addEntries($pdo, $entry, $decklist);
                        }
                    }
                    else {
                        print '{"status":2, message:"Name '.$deckname.' already exists."}';
                    }
                }
            }
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