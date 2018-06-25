#!/bin/bash
# created by Chris Bording 23 Aug 2016
# check the https://support.ehelp.edu.au/support/solutions/articles/6000115009-pawsey-nectar-storage-and-ncbi-data
# the important sections/tasks to understand are about:
# -  Using wget
# -  Configuring your instance to use the Openstack APIs
# -  Copying your *-openrc.sh file copied to your instance
# -  Copying your ssh keyfile or pem file to your instance

# Then you can source the *-openrc.sh file as shown here 
# or put in your .bashrc file!
# This allows you to run swift and create containers/ objects 
source ~/.ssh/Pawsey_NeCTAR_dev-openrc.sh

# define the download directory
DATA_DIR=/mnt/data/blast
# define the container name 
CONTAINER=blast_db 

# test to see if the object container exist
# if not create it 

# this is a list of the containers attacted to this NeCTAR project 
list=`swift list`

for object in ${list[@]}
do 
  if [ ! ${CONTAINER}=${object} ]; then 
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

index=("00" "01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39")

# download nt files from the /blast/db directory 
for i in ${index[@]}
do 
lftp ftp.ncbi.nlm.nih.gov <<EOF
cd /blast/db
echo " download nt.${i}.tar.gz "
get nt.${i}.tar.gz
get nt.${i}.tar.gz.md5
quit
EOF
 
echo " check file size nt.${i}"
# check that the file size is correct
# log any bad files in check_file.log 

if ! md5sum --status -c nt.${i}.tar.gz.md5; then
  echo " nt.${i} is bad " >> check_file.log
else
  echo " md5 test OK " 
  swift upload ${CONTAINER} nt.${i}.tar.gz
  swift upload ${CONTAINER} nt.${i}.tar.gz.md5 
  echo " kick ASS!! "
fi 
 #rm nt.${i}.tar.*
done

if [ -f check_file.log ]; then
  echo " Aw man!! There is a bad nt file check log file "
else 
  echo " Hot Damn! Successfully downloaded nt files from ncbi! "
fi 

exit

