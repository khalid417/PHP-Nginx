<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if (isset($_GET['setid'])) {
        if ($pdo) {
            $sql1 = 'SELECT "CardType" from "Cards"."CardData" where "SetId" = :setid';
            $setid = $_GET['setid'];
            $sth = $pdo->prepare($sql1);
            $sth->bindParam('setid', $setid);
            if($sth->execute()) {
                $cardtype = $sth->fetchColumn();
                $sql2 = 'SELECT * from "Cards"."CardData" ';
                if ($cardtype == 'Character') {
                    $sql2 .= 'join "Cards"."CharacterData" on "CardData"."Id" = "CharacterData"."CardId"';
                }
                else if ($cardtype == 'Action') {
                    $sql2 .= 'join "Cards"."ActionData" on "CardData"."Id" = "ActionData"."CardId"';
                }
                $sql2 .= 'left join "Cards"."AbilityAsset" on "CardData"."Id" = "AbilityAsset"."CardId" where "SetId" = :setid';
                $sth = $pdo->prepare($sql2);
                $sth->bindParam('setid', $setid);
                if($sth->execute()) {
                    print_r(json_encode($sth->fetch(PDO::FETCH_OBJ)));
                }
            }
            else {
                print 'Problem executing query with set id '.$setid;
            }
        }
    }
    else {
        print 'Missing SetId Parameter.';
    }
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}

?>