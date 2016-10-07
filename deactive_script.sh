#!/usr/bin/php
<?php

//how to use
//php deactive_script.sh sku='Yellow-2016'


$user= 'root';
$pass= '';
$host= 'localhost';
$db= 'yilinker_online_v4';

if (!isset($argv[1])) { exit("plase supplied sku.... \n"); }


$sku = $argv[1];
parse_str($sku, $output);

if (!isset($output['sku'])) { exit("plase supplied sku .... \n"); }

try {
    $dbh = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    foreach($dbh->query("SELECT p.product_id, pu.sku, p.status, p.name FROM Product p JOIN ProductUnit pu ON pu.product_id = p.product_id WHERE pu.sku = '{$output['sku']}'") as $row) {
        print_r(array_values($row));

        //product country
        $statement = $dbh->prepare("UPDATE ProductCountry SET status = :status WHERE product_id = :product_id AND country_id = :country_id");
        $count = $statement->execute(array(
            "status"     => "6",
            "country_id" => "164",
            "product_id" => $row['product_id'],
        ));

        echo $count . " = rows affected in product country \n";

        //product status
        $productstmt = $dbh->prepare("UPDATE Product SET status = :status WHERE product_id = :product_id");
        $productcount = $productstmt->execute(array(
            "status"     => "6",
            "product_id" => $row['product_id'],
        ));

        echo $productcount . " = rows affected in product status \n";
    }

    $dbh = null;
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>

