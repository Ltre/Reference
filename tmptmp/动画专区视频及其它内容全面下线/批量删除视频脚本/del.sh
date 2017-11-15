#!/bin/bash
declare -i i=1
while (($i< 1000))
do
    mysql -uxxxxxxxxxx -h000.000.000.000 -P6666 -pXXXXXXXXXXX yyyyyy -e "update upload_list set can_play = -9, status = -9 where channel = 'vhuyadm' and (status <> -9 or can_play <> -9) limit 15"
    echo "History deleted vid sum count:"
    mysql -uxxxxxxxxxx -h000.000.000.000 -P6666 -pXXXXXXXXXXX yyyyyy -e "select count(1) from upload_list where channel = 'vhuyadm' and status = -9 and can_play = -9"
    let ++i
    sleep 1.5
done