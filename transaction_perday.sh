#!/usr/bin/php
<?php

$user= 'jonathan';
$pass= 'xY4daEMwq2PFEw9m';
$host= 'localhost';
$db= 'yilinker_online_v4';

$to="jonathan.antivo@yilinker.ph";
$cc="jonathan.antivo@yilinker.ph";
$from="noreply@yiliker.ph";
$subject="Daily_Transaction_Report";
$body=<<<EOF
Daily Transaction Report
EOF;
$filepath="/home/jonathan/LOCALDEVDISK/script/";

try {
    $dbh = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    
    $sql2 = "
        SELECT * from `symfony`.`Product` LIMIT 1;
    ";    
    $stmt = $dbh->prepare($sql2);
    $stmt->execute();
    
    $prevDate = date('Y-m-d', strtotime(' -1 day'));
    $fromdate = $prevDate. ' 00:00:00';
    $todate = $prevDate. ' 23:59:59';
    
    $title = time();
    $filename = "transactionDetails_{$title}.csv";
    $attachment = $filepath.$filename;

    //$fp = fopen('php://output', 'w');
    $fp = fopen($attachment, 'w');

    header('Content-Type: text/csv');

    fputcsv($fp, array('productId','SKU', 'STATUS', 'Name'));   
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        fputcsv($fp, array_values($row));
    }

    fclose($fp);
    $subject.= "-{$prevDate}";

    $exec = "sudo /var/www/html/yilinker-online/app/frontend/console yilinker:email:send --from=$from --to=$to --subject={$subject} --cc=$cc --attachment=$attachment --body='{$body}'";
    $h = shell_exec($exec);
    echo $h;

    if (file_exists($attachment)) {
        unlink($attachment);
    }

    $dbh = null;
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>

