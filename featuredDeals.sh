#!/bin/bash

# trim whitespace wih xargs
# avaliable = fashion, electronic, musthave,household,motherhood,personal

if [ -z "$1" ]
  then
    echo "add parameter"
   exit 1
fi

ROW=0
while IFS=, read col1 col2 col3 col4 col5 col6 col7 col8
do
    ROW=$[$ROW+1]
    DATE=$(date +"%m/%d/%Y")
    DATE2=$(date +"%m%d%M")

        #cp /home/jonathan/LOCALDEVDISK/script/web.xml /home/jonathan/LOCALDEVDISK/script/web.xml.bk.$DATE2
        
        if [[ "$1" != "home" ]] && [[ "$1" != "automotive" ]] && [[ "$1" != "arrival" ]] && [[ "$1" != "fashion" ]] && [[ "$1" != "electronic" ]] && [[ "$1" != "musthave" ]] && [[ "$1" != "household" ]] && [[ "$1" != "motherhood" ]] && [[ "$1" != "personal" ]];
        then
           echo "check your arguments"
           exit 1 
        fi


        if [[ "$ROW" == 1 ]]
        then
            echo "rows $ROW"
            echo $1


             sed -i "s/slug.*<!--$11-->/slug><![CDATA[$col1]]><\/slug><!--$11-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
             sed -i "s/slug.*<!--$12-->/slug><![CDATA[$col2]]><\/slug><!--$12-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
             sed -i "s/slug.*<!--$13-->/slug><![CDATA[$col3]]><\/slug><!--$13-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
             sed -i "s/slug.*<!--$14-->/slug><![CDATA[$col4]]><\/slug><!--$14-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
             sed -i "s/slug.*<!--$15-->/slug><![CDATA[$col5]]><\/slug><!--$15-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
             sed -i "s/slug.*<!--$16-->/slug><![CDATA[$col6]]><\/slug><!--$16-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
             sed -i "s/slug.*<!--$17-->/slug><![CDATA[$col7]]><\/slug><!--$17-->/" /home/jonathan/LOCALDEVDISK/script/web.xml
             sed -i "s/slug.*<!--$18-->/slug><![CDATA[$col8]]><\/slug><!--$18-->/" /home/jonathan/LOCALDEVDISK/script/web.xml

         elif [ "$ROW" == 2 ]
            then
                echo "rows $ROW"
                echo $1

                sed -i "s/product.*<\/product><!--$11-->/product>$col1<\/product><!--$11-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
                sed -i "s/product.*<\/product><!--$12-->/product>$col2<\/product><!--$12-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
                sed -i "s/product.*<\/product><!--$13-->/product>$col3<\/product><!--$13-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
                sed -i "s/product.*<\/product><!--$14-->/product>$col4<\/product><!--$14-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
                #
                sed -i "s/productId.*]]><\/targetUrl><!--$11-->/productId=$col1]]><\/targetUrl><!--$11-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
                sed -i "s/productId.*]]><\/targetUrl><!--$12-->/productId=$col2]]><\/targetUrl><!--$12-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
                sed -i "s/productId.*]]><\/targetUrl><!--$13-->/productId=$col3]]><\/targetUrl><!--$13-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml
                sed -i "s/productId.*]]><\/targetUrl><!--$14-->/productId=$col4]]><\/targetUrl><!--$14-->/" /home/jonathan/LOCALDEVDISK/script/mobile.xml

         fi

done < /home/jonathan/LOCALDEVDISK/script/featuredDeal.csv

echo "redis flush"
redis-cli flushdb



# sed -i -e 's/abc/XYZ/g' /tmp/file.txt
# sed -i 's/WORD1.*WORD3/WORD1 foo WORD3/g' file.txt
# 
# http://stackoverflow.com/questions/10613643/replace-a-unknown-string-between-two-known-strings-with-sed
# 
# sed -i -e 's/[.*]]></slug><!--t1-->/WORD1 foo WORD3/g' web.xml