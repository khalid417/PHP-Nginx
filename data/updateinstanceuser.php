<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if (isset($_GET['instance']) && isset($_GET['status']) && isset($_GET['user'])) {
        if ($pdo) {
            $username = $_GET['user'];
            $state = $_GET['status'];
            $instanceName = $_GET['instance'];
            $sqlUser = 'SELECT "Id" FROM "Users"."UserList" WHERE "DisplayName" = :username';
            $sthUser = $pdo->prepare($sqlUser);
            $sthUser->bindParam('username', $username);
            if ($sthUser->execute()) {
                $userId = $sthUser->fetchColumn();
                if ($userId) {
                    $sql = 'SELECT * FROM "Games"."Instances" WHERE "InstanceName" = :instance';
                    $sth = $pdo->prepare($sql);
                    $sth->bindParam('instance', $instanceName);
                    if ($sth->execute()) {
                        $result = $sth->fetch(PDO::FETCH_OBJ);
                        if (!$result) {
                            $sql = 'INSERT INTO "Games"."Instances" ("InstanceName", "InstanceState", "Player1") VALUES (:instance, :state, :player)
                            ON CONFLICT ("InstanceName") DO UPDATE SET "InstanceState" = :state, "Player1" = :player';
                            $sth = $pdo->prepare($sql);
                            $sth->bindParam('instance', $instanceName);
                            $sth->bindParam('state', $state);
                            $sth->bindParam('player', $userId);
                            $sth->execute();
                        }
                        else {
                            if ($state == "Half") {
                                $sql2 = 'INSERT INTO "Games"."Instances" ("InstanceName", "InstanceState", "Player1") VALUES (:instance, :state, :player)
                                ON CONFLICT ("InstanceName") DO UPDATE SET "InstanceState" = :state, "Player1" = :player, "Player2" = NULL'; 
                            }
                            else {
                                if ($result->Player1) {
                                    $sql2 = 'INSERT INTO "Games"."Instances" ("InstanceName", "InstanceState", "Player2") VALUES (:instance, :state, :player)
                                    ON CONFLICT ("InstanceName") DO UPDATE SET "InstanceState" = :state, "Player2" = :player'; 
                                }
                                else {
                                    $sql2 = 'INSERT INTO "Games"."Instances" ("InstanceName", "InstanceState", "Player1") VALUES (:instance, :state, :player)
                                    ON CONFLICT ("InstanceName") DO UPDATE SET "InstanceState" = :state, "Player1" = :player';
                                }
                            }
                            $sth2 = $pdo->prepare($sql2);
                            $sth2->bindParam('instance', $instanceName);
                            $sth2->bindParam('state', $state);
                            $sth2->bindParam('player', $userId);
                            $sth2->execute();
                        }
                    }
                }
            }
        }
        else {
            print 'Problem executing query with instance name '.$instanceName;
        }
    }
    else {
        print 'Missing parameters.';
    }
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}
?>