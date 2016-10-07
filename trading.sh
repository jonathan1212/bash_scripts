#!/bin/bash

# trim whitespace wih xargs
while IFS=, read col1
do
    
    data="$(echo -e "${col1}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')" # trim whitespace

    echo "$data"
    echo "=================================="
    sudo php /var/www/sites/PRODUCTION/www.yilinker.com/app/frontend/console yilinker:synchronize:trading-data --table=manufacturerProduct --ignoreLast=true --searchField="$data"  --env=prod
done < trading.csv

exit 1

# end

if [ -z "$1" ]
  then
    echo "No arguments supplied"
   exit 1
fi

sudo php /var/www/sites/PRODUCTION/www.yilinker.com/app/frontend/console yilinker:synchronize:trading-data --table=manufacturerProduct --ignoreLast=true --searchField="$1" --env=prod
