<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if ($pdo) {
        $sql = 'INSERT INTO "Users"."UserList" ("DisplayName", "Hash") VALUES (:user, :passhash)';
        $sth = $pdo->prepare($sql);
        $username = $_POST['username'];
        $passhash = $_POST['hash'];
        $sth->bindParam('user', $username);
        $sth->bindParam('passhash', $passhash);
        $sth->execute();
    }    
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}
?>