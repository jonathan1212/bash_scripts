#!/bin/bash

# trim whitespace wih xargs
while IFS=, read col1 col2 col3 col4 col5
do
    
    DATE=$(date +"%m/%d/%Y")
    DATE2=$(date +"%m%d%M")

    if [ "$DATE" == "$col1" ]
    then

        #cp /home/jonathan/LOCALDEVDISK/script/web.xml /home/jonathan/LOCALDEVDISK/script/web.xml.bk.$DATE2


        sed -i "s/product.*<\/product><!--t1-->/product>$col2<\/product><!--t1-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
        sed -i "s/product.*<\/product><!--t2-->/product>$col3<\/product><!--t2-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
        sed -i "s/product.*<\/product><!--t3-->/product>$col4<\/product><!--t3-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
        sed -i "s/product.*<\/product><!--t4-->/product>$col5<\/product><!--t4-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml

        sed -i "s/productId.*]]><\/targetUrl><!--t1-->/productId=$col2]]><\/targetUrl><!--t1-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
        sed -i "s/productId.*]]><\/targetUrl><!--t2-->/productId=$col3]]><\/targetUrl><!--t2-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
        sed -i "s/productId.*]]><\/targetUrl><!--t3-->/productId=$col4]]><\/targetUrl><!--t3-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
        sed -i "s/productId.*]]><\/targetUrl><!--t4-->/productId=$col5]]><\/targetUrl><!--t4-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
        
        echo "redis flush"
        redis-cli flushdb
        exit 1

    
    else
        echo "Todays Deal - No Data Available For $DATE"
    fi

done < /home/jonathan/LOCALDEVDISK/script/mobiletodaysdeal.csv


# sed -i -e 's/abc/XYZ/g' /tmp/file.txt
# sed -i 's/WORD1.*WORD3/WORD1 foo WORD3/g' file.txt
# 
# http://stackoverflow.com/questions/10613643/replace-a-unknown-string-between-two-known-strings-with-sed
# 
# sed -i -e 's/[.*]]></slug><!--t1-->/WORD1 foo WORD3/g' web.xml