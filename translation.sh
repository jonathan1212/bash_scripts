#!/bin/bash
while IFS=, read col1 col2 col3
do
    cat <<EOF
    <trans-unit id="$col3" resname="$col1">
        <source>$col1</source>
        <target>$col2</target>
    </trans-unit>
EOF
    #echo $DATA >> translation.txt 

done < translation.csv

