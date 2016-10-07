#!/usr/bin/php
<?php

//how to use
//php deactive_script.sh sku='Yellow-2016'



$file = fopen("todaysdeal.csv","r");


$counter = 0;

while(! feof($file))
{
    $datas = array();
    $products = fgetcsv($file);

    $datas[$counter] = getData($products[1]);
    $datas[$counter] =  getData($products[2]);
    $datas[$counter] =  getData($products[3]);
    $datas[$counter] = getData($products[4]);
    $datas[$counter] = getData($products[5]);

    echo $products[0], ',' . getData($products[1]) . ',' . getData($products[2]) . ',' . getData($products[3]). ',' . getData($products[4]) . ',' . getData($products[5]) . "\n";
    $counter++;

    print_r($datas);
}


fclose($file);



function getData($slug)
{
    $user= 'root';
    $pass= '';
    $host= 'localhost';
    $db= 'yilinker_online_v4';
    $dbh = new PDO("mysql:host=$host;dbname=$db", $user, $pass);


    $productId = 0;
        try {


            foreach($dbh->query("SELECT p.product_id, pu.sku, p.status, p.name FROM Product p WHERE p.slug = '$slug'") as $row) {

                $productId = $row['product_id'];

            }

            $dbh = null;
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }

    return $productId;
}


?>

