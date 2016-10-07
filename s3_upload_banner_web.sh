#!/bin/bash

#uploads
# ./s3_upload_banner_web.sh -f=~/Documents/ -p=fc ---upload to cms/featured-category
# ./s3_upload_banner_web.sh -f=~/Documents/ -p=product ---upload to cms/home-web
 
# view
# ./s3_upload_banner_web.sh -f=/home/jonathan/Pictures/homedata/motherhood.jpg -p=fc -v=true

if [ -z "$1" ]
  then
    echo "Locate Filename"
   exit 1
fi


for i in "$@"
do
case $i in
    -p=*|--page=*)
    PAGE="${i#*=}"

    shift # past argument=value
    ;;

    -v=*|--view=*)
    VIEW="${i#*=}"

    shift # past argument=value
    ;;

    -f=*|--file=*)
    FILE="${i#*=}"

    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES

    echo "default"
    exit 1
    shift # past argument with no value
    ;;
    *)
            # unknown option
    ;;
esac
done

if [[ "${FILE}" == "" ]] || [[ "${PAGE}" == "" ]]
then
   echo "check your arguments"
   exit 1 
fi


# view s3 list
if [[ "${PAGE}" == "fc" ]] && [[ "${VIEW}" == "true" ]]
then
   aws s3 ls s3://yilinker-online/assets/images/uploads/cms/featured-category/
   exit 1 
fi

if [[ "${PAGE}" == "product" ]] && [[ "${VIEW}" == "true" ]]
then
   aws s3 ls s3://yilinker-online/assets/images/uploads/cms/home-web/
   exit 1 
fi


### uploads to s3
if [[ "${PAGE}" == "fc" ]] 
then
   aws s3 cp ${FILE} s3://yilinker-online/assets/images/uploads/cms/featured-category/
   exit 1 
elif [ "${PAGE}" == "product" ]
    then
        aws s3 cp ${FILE} s3://yilinker-online/assets/images/uploads/cms/home-web/
        exit 1
else
  echo "no match"
  exit 1
fi

