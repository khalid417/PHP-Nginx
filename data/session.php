<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if (isset($_GET['userid'])) {
        if ($pdo) {
            $sql = 'SELECT * from "Users"."UserList" where "DisplayName" = :userid';
                $userid = $_GET['userid'];
                $sth = $pdo->prepare($sql);
                $sth->bindParam('userid', $userid);
                if($sth->execute()) {
                    $result = $sth->fetch(PDO::FETCH_OBJ);
                    if (!$result) {
                        print '{"status": 2, "message": "User '.$userid.' not found" }';
                    }
                    else {
                        $hash = $result->Hash;
                        $packed = pack('H*', $hash);
                        $id = $result->Id;
                        $log = random_int(0, 8);
                        $session_token = 'unity-token-'.random_int(10000000, 99999999).'--'.random_int(pow(10, $log), pow(10, $log + 1) - 1);
                        $pad = 32 - (strlen($session_token) % 32);
                        $padded = $session_token.str_repeat(chr($pad), $pad);
                        $encrypted = $padded ^ $packed;
                        print '{"status": 1, "message": "Validate", "encrypted_session_token": "'.base64_encode($encrypted).'"}';
                        $sql2 = 'INSERT INTO "Users"."Sessions" ("User", "SessionKey") VALUES (\''.$id.'\', \''.$session_token.'\')
                        ON CONFLICT ("User") DO UPDATE SET "SessionKey" = \''.$session_token.'\'';
                        $sth2 = $pdo->prepare($sql2);
                        $sth2->execute();
                    }
                }
                else {
                    print 'Problem executing query with user id '.$userid;
                }
            }
    }
    else {
        print 'Missing User ID Parameter.';
    }
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}

?>