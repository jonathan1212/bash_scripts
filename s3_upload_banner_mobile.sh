
#!/bin/bash

if [ -z "$1" ]
  then
    echo "Locate Filename"
   exit 1
fi

#cp $1 ~/Documents/
aws s3 cp $1 s3://yilinker-online/assets/images/uploads/cms/
