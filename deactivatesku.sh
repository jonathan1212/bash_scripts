while IFS=, read col1
do
    sudo php /media/ebs1/sites/PRODUCTION/www.yilinker.com/app/frontend/console yilinker:product:deactivate-sku --sku=$col1

done < deactivatesku.csv