#!bin/bash

# specifying photos directory
PHOTOS_DIR="/home/titin/Desktop/segregate_photos"
# specifying output directory
OUTPUT_DIR="/home/titin/Desktop/output"

files=$(ls ${PHOTOS_DIR})

for file in $files
do
    # splitting the filename with delimiter --> '-'
    readarray -d - -t split_path <<< "$file"
    
    # source file path
    SOURCE_PATH="${PHOTOS_DIR}/${file}"
    # echo "source -> ${SOURCE_PATH}"

    # destination file path
    DESTINATION_PATH="${OUTPUT_DIR}/${split_path[0]}/${split_path[1]}"

    # Creating the folder if it doesn't exist
    mkdir -p ${DESTINATION_PATH}

    # logging
    echo "${SOURCE_PATH} moves to ${DESTINATION_PATH}"

    # moving the file from source to destination
    mv $SOURCE_PATH $DESTINATION_PATH

    # renaming the file
    mv "${DESTINATION_PATH}/${file}" "${DESTINATION_PATH}/${split_path[2]}"
done
