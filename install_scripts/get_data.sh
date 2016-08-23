#!/bin/bash

# Then you can source the *-openrc.sh file as shown here 
# or put in your .bashrc file!
# This allows you to run swift and create containers/ objects 
source ~/.ssh/Pawsey_NeCTAR_dev-openrc.sh


# define the download directory
DATA_DIR=/mnt/data/blast_single_db
# define the container name 
CONTAINER=blast_single_db 

# test to see if the object container exist
# if not create it 

# this is a list of the containers attacted to this NeCTAR project 
list=`swift list`

for object in ${list[@]}
do 
  if [ ${CONTAINER}=${object} ]; then 
    echo " the object directory exists"
  else
    OBJ_TEST=1 # false - object directory does not exist    
  fi
done  

if [ "${OBJ_TEST}" = "1" ]; then
  # Container does not exist use swift post command to create!
  swift post ${CONTAINER}
fi

if [ ! -d ${DATA_DIR} ]; then 
  # The data download directory does not exist create it!
  mkdir -p ${DATA_DIR}
fi 

cd ${DATA_DIR}

# download nt files from the /blast/db/FASTA directory 

lftp ftp.ncbi.nlm.nih.gov <<EOF
cd /blast/db/FASTA
get nt.gz
get nt.gz.md5
quit
EOF

echo " check file size nt "
# check that the file size is correct
# log any bad files in check_file.log 

if ! md5sum --status -c nt.gz.md5; then
  echo " nt is bad " >> check_file.log
else
  echo " md5 test OK " 
  swift upload ${CONTAINER} nt.gz
  swift upload ${CONTAINER} nt.gz.md5 
  echo " kick ASS!! "
fi 

if [ -f check_file.log ]; then
  echo " Aw man!! The nt file is bad check log file "
else 
  echo " Hot Damn! Successfully downloaded nt file from ncbi! "
fi 

exit