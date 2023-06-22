<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if ($pdo) {
        $sql = 'SELECT * FROM "Users"."Sessions" where "User" = :user and "SessionKey" = :sessiontoken';
        $sth = $pdo->prepare($sql);
        $username = $_POST['username'];
        $session = $_POST['session-token'];
        $sth->bindParam('user', $username);
        $sth->bindParam('sessiontoken', $session);
        if ($sth->execute()) {
            $result = $sth->fetch(PDO::FETCH_OBJ);
            if (!$result) {
                print '{"status": 200, "message": "User '.$userid.' session key invalid." }';
            }
            else {
                print '{"status": 100, "message": "Validated"}';
            }
        }
        else {
            print 'Problem executing query with user id '.$user;
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