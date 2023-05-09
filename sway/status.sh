#!/bin/bash

echo '{ "version": 1 }'
echo '['
echo '[]'
while :;
do
    media=$(playerctl metadata title | jq -R .)
    ip_addr=$(hostname -I | xargs | jq -R .)
    date_formatted=$(date +'%Y-%m-%d %H:%M:%S')
    echo ",[
        {
            \"full_text\": $media,
            \"color\": \"#97a891\",
            \"separator_block_width\": 20
        },
        {
            \"full_text\": $ip_addr,
            \"color\": \"#91a4a8\",
            \"separator_block_width\": 20
        },
        {
            \"full_text\": \"$date_formatted\",
            \"separator_block_width\": 20
        }
    ]"
    sleep 1
done
