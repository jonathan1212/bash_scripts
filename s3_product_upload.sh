#!/bin/bash

if [ -z "$1" ]
  then
    echo "Locate Filename"
   exit 1
fi

#-action=list|upload -id=123 --size=''


for i in "$@"
do
case $i in
    -a=*|--action=*)
    ACTION="${i#*=}"

    echo "trayayo = ${ACTION} " 
    shift # past argument=value
    ;;
    -id=*|--productid=*)
    PRODUCTID="${i#*=}"

    echo "search"
    shift # past argument=value
    ;;
    -l=*|--lib=*)
    LIBPATH="${i#*=}"

    echo "library"
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES

    echo "default"
    shift # past argument with no value
    ;;
    *)
            # unknown option
    ;;
esac
done

echo "${PRODUCTID} haha"

if [[ "${ACTION}" == "" ]] || [[ "${PRODUCTID}" == "" ]]
then
   echo "empty"
   exit 1 
fi


if [ "${ACTION}" == "list" ]
    then
      echo "show list"
      exit 1
elif [ "${ACTION}" == "upload" ]
    then
        echo "show upload"
else
  echo "Count is less than 100"
fi



exit 1

echo "FILE EXTENSION  = ${EXTENSION}"
echo "SEARCH PATH     = ${SEARCHPATH}"
echo "LIBRARY PATH    = ${LIBPATH}"
exit 1



name=$1

if [[ -n "$name" ]]; then

    echo $name
    echo 'jonathan'
else
    echo "argument error"
fi

exit 1

if [ "$1" == "list" ]
    then
      echo "great"
      exit 1
fi

echo $2
echo $1



count=99

if [ $count -eq 100 ]
then
  echo "Count is 100"
elif [ $count -gt 100 ]
then
  echo "Count is greater than 100"
else
  echo "Count is less than 100"
fi

#aws s3 ls s3://yilinker-online/assets/images/uploads/products/