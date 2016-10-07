#!/bin/bash

while IFS=, read col1
do
    
    DATA="aws s3 sync web/assets/images/uploads/products/$col1/. s3://yilinker-online/assets/images/uploads/products/$col1 --cache-control max-age=86400"
    
    echo $DATA >> aws.txt 

done < aws.csv