<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if ($pdo) {
        $sql = 'SELECT "Name", "Cost", "Inkwell", "Ink", "CardType", "Classifications", "SetId", "FrontAsset" from "Cards"."CardData" 
        left join "Cards"."CharacterData" on "CardData"."Id" = "CharacterData"."CardId" 
        left join "Cards"."ActionData" on "CardData"."Id" = "ActionData"."CardId"
        left join "Cards"."AbilityAsset" on "CardData"."Id" = "AbilityAsset"."CardId"';
        $searchParams = array();
        if (isset($_GET['name'])) {
            array_push($searchParams, '%'.$_GET['name'].'%');
            $sql .= ' where "Name" ilike ?';
        }
        if (isset($_GET['cost'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['cost']);
            if (isset($_GET['cost_compare'])) {
                switch ($_GET['cost_compare']) {
                    case '=':
                        $sql .= '"Cost" = ?';
                        break;
                    case '>':
                        $sql .= '"Cost" > ?';
                        break;
                    case '<':
                        $sql .= '"Cost" < ?';
                        break;
                    default:
                        $sql .= '"Cost" = ?';
                }
            }
            else {
                $sql .= '"Cost" = ?';
            }
        }
        if (isset($_GET['strength'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['strength']);
            if (isset($_GET['strength_compare'])) {
                switch ($_GET['strength_compare']) {
                    case '=':
                        $sql .= '"Strength" = ?';
                        break;
                    case '>':
                        $sql .= '"Strength" > ?';
                        break;
                    case '<':
                        $sql .= '"Strength" < ?';
                        break;
                    default:
                        $sql .= '"Strength" = ?';
                }
            }
            else {
                $sql .= '"Strength" = ?';
            }
        }
        if (isset($_GET['willpower'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['willpower']);
            if (isset($_GET['willpower_compare'])) {
                switch ($_GET['willpower_compare']) {
                    case '=':
                        $sql .= '"Willpower" = ?';
                        break;
                    case '>':
                        $sql .= '"Willpower" > ?';
                        break;
                    case '<':
                        $sql .= '"Willpower" < ?';
                        break;
                    default:
                        $sql .= '"Willpower" = ?';
                }
            }
            else {
                $sql .= '"Willpower" = ?';
            }
        }
        if (isset($_GET['lore'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['lore']);
            if (isset($_GET['lore_compare'])) {
                switch ($_GET['lore_compare']) {
                    case '=':
                        $sql .= '"Lore" = ?';
                        break;
                    case '>':
                        $sql .= '"Lore" > ?';
                        break;
                    case '<':
                        $sql .= '"Lore" < ?';
                        break;
                    default:
                        $sql .= '"Lore" = ?';
                }
            }
            else {
                $sql .= '"Lore" = ?';
            }
        }
        if (isset($_GET['inkwell'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['inkwell']);
            $sql .= '"Inkwell" = ?';     
        }
        if (isset($_GET['cardtype'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['cardtype']);
            $sql .= '"CardType" = ?';     
        }
        if (isset($_GET['ink'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['ink']);
            $sql .= '"Ink" = ?';     
        }
        if (isset($_GET['classification'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['classification']);
            $sql .= '? = any("Classifications")';     
        }
        if (isset($_GET['song'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['song']);
            $sql .= '"Song" = ?';      
        }
        if (isset($_GET['shift'])) {
            if ($_GET['shift'] == 'true') {
                if (count($searchParams) < 1) {
                    $sql .= ' where ';
                }
                else {
                    $sql .= ' and ';
                }
                $sql .= '"Shift" > 0'; 
            }    
        }
        if (isset($_GET['text'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['text']);
            $sql .= 'to_tsvector("Text") @@ to_tsquery(?)';     
        }
        if (isset($_GET['epithet'])) {
            if (count($searchParams) < 1) {
                $sql .= ' where ';
            }
            else {
                $sql .= ' and ';
            }
            array_push($searchParams, $_GET['epithet']);
            $sql .= 'to_tsvector("Epithet") @@ to_tsquery(?)';     
        }
        $cardQuery = $pdo->prepare($sql);
		$jsonArray = json_decode("[]",true);
        $cardQuery->execute($searchParams);
		while($card = $cardQuery->fetch(PDO::FETCH_ASSOC)){
            array_push($jsonArray,$card);
        }
		print_r(json_encode($jsonArray));
    }
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}

?>