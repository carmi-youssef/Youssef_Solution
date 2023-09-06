#!/bin/bash
#add fix to exercise6-fix here

if [ "$#" -lt 2 ]; then
    echo "You need to insert more than 2 Param, one from the local and the other to the destination"
    exit 1
fi

destination_folder="${!#}"

local_username="$(whoami)"
local_server="$(hostname)"
total_bytes_copied=0

if [ "$local_username" = "root" ]; then
    remote_username="root"
else
    remote_username="vagrant" 
fi


if [ "$local_server" = "server1" ]; then
    remote_server="server2"
        for source_file in "${@:1:$#-1}"; do
    scp "$source_file" "$remote_username@$remote_server:$destination_folder" 
    if [ $? -eq 0 ]; then
        file_size=$(stat -c %s "$source_file")
        total_bytes_copied=$((total_bytes_copied+file_size))
    else
        echo "Failed"
    fi
done


else
    remote_server="server1"  
        for source_file in "${@:1:$#-1}"; do
        scp -i ~/.ssh/"$remote_username"_server1_private_key "$source_file" "$remote_username@$remote_server:$destination_folder" 
        if [ $? -eq 0 ]; then
            file_size=$(stat -c %s "$source_file")
            total_bytes_copied=$((total_bytes_copied + file_size))
        else
            echo "Failed"
        fi
    done

fi
echo "$total_bytes_copied"




