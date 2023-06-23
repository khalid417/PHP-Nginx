<?php
$host = 'postgres';
$db = getenv("POSTGRES_DB");
$user = getenv("POSTGRES_USER");
$password = getenv("POSTGRES_PASSWORD");
try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if ($pdo) {
        $sql = 'SELECT * FROM "Games"."Instances" where "InstanceState" = \'Half\'';
        $sth = $pdo->prepare($sql);
        if ($sth->execute()) {
            $result = $sth->fetch(PDO::FETCH_OBJ);
            if (!$result) {
                $sql2 = 'SELECT * FROM "Games"."Instances" where "InstanceState" = \'Empty\'';
                $sth2 = $pdo->prepare($sql2);
                if ($sth2->execute()) {
                    $result = $sth2->fetch(PDO::FETCH_OBJ);
                    if (!$result) {
                        $sql3 = 'SELECT * FROM "Games"."Instances" where "InstanceState" = \'Down\'';
                        $sth3 = $pdo->prepare($sql3);
                        if ($sth3->execute()) {
                            $result = $sth3->fetch(PDO::FETCH_OBJ);
                            if (!$result) {
                                $status = 2;
                                $port = 0;
                                print '{"status": '.$status.', "port":'.$port.'}';
                            }
                            else {
                                shell_exec('docker start '.$result->InstanceName);
                                $status = 1;
                                $port = shell_exec('docker ps --format "{{.Names}}-{{.Ports}}" | grep -o "'.$result->InstanceName.'.*[[:digit:]]\{5\}->7777" | cut -d - -f 5 | cut -d : -f 2');
                                print '{"status": '.$status.', "port":'.$port.'}';
                            }
                        }
                        else {
                            $status = 2;
                            $port = 0;
                            print '{"status": '.$status.', "port":'.$port.'}';
                        }
                    }
                    else {
                        $status = 1;
                        $port = shell_exec('docker ps --format "{{.Names}}-{{.Ports}}" | grep -o "'.$result->InstanceName.'.*[[:digit:]]\{5\}->7777" | cut -d - -f 5 | cut -d : -f 2');
                        print '{"status": '.$status.', "port":'.$port.'}';
                    }
                }
                else {
                    $status = 2;
                    $port = 0;
                    print '{"status": '.$status.', "port":'.$port.'}';
                }
            }
            else {
                $status = 1;
                $port = shell_exec('docker ps --format "{{.Names}}-{{.Ports}}" | grep -o "'.$result->InstanceName.'.*[[:digit:]]\{5\}->7777" | cut -d - -f 5 | cut -d : -f 2');
                print '{"status": '.$status.', "port":'.$port.'}';
            }
        }
        else {
            $status = 2;
            $port = 0;
            print '{"status": '.$status.', "port":'.$port.'}';
        }
    }
    else {
        $status = 2;
        $port = 0;
        print '{"status": '.$status.', "port":'.$port.'}';
    }
} catch (PDOException $ex) {
    die($ex->getMessage());
} finally {
    if ($pdo) {
        $pdo = null;
    }
}
?>