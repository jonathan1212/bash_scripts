#!/bin/bash

# trim whitespace wih xargs
while IFS=, read col1 col2 col3 col4 col5 col6
do
    
    DATE=$(date +"%m/%d/%Y")
    DATE2=$(date +"%m%d%M")

    if [ "$DATE" == "$col1" ]
    then

        cp /home/jonathan/LOCALDEVDISK/script/web.xml /home/jonathan/LOCALDEVDISK/script/web.xml.bk.$DATE2
        
        echo "$col1"
        echo "$col2"
        echo "$col3"
        echo "$col4"
        echo "$col5"
        echo "$col6"
        echo "=================================="

        sed -i "s/slug.*<!--t1-->/slug><![CDATA[$col2]]><\/slug><!--t1-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
        sed -i "s/slug.*<!--t2-->/slug><![CDATA[$col3]]><\/slug><!--t2-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
        sed -i "s/slug.*<!--t3-->/slug><![CDATA[$col4]]><\/slug><!--t3-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
        sed -i "s/slug.*<!--t4-->/slug><![CDATA[$col5]]><\/slug><!--t4-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
        sed -i "s/slug.*<!--t5-->/slug><![CDATA[$col6]]><\/slug><!--t5-->/" /home/jonathan/LOCALDEVDISK/script/web.xml

        echo "redis flush"
        redis-cli flushdb
        exit 1
    else
        echo "Todays Deal - No Data Available For $DATE"
    fi

done < /home/jonathan/LOCALDEVDISK/script/todaysdeal.csv


# sed -i -e 's/abc/XYZ/g' /tmp/file.txt
# sed -i 's/WORD1.*WORD3/WORD1 foo WORD3/g' file.txt
# 
# http://stackoverflow.com/questions/10613643/replace-a-unknown-string-between-two-known-strings-with-sed
# 
# sed -i -e 's/[.*]]></slug><!--t1-->/WORD1 foo WORD3/g' web.xml