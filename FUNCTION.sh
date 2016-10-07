#!/bin/bash

#
# this script should not be run directly,
# instead you need to source it from your .bashrc,
# by adding this line:
#   . ~/bin/CASE.sh
#

function CASE() {

   CASES="/home/lowk/cases"

   if [ "$#" -gt 1 ];
   then
      echo -e "\nUsage: ${FUNCNAME[0]} CASE_NAME (optional)\n\n"
      return 1
   elif [ "$#" -eq 1 ]
   then
      CASE_DIR=${CASES}/${1}
      if [ -d ${CASE_DIR} ];
      then
         echo ${CASE_DIR}
      else
         echo -e "${CASE_DIR}\tCREATE? [y]"
         read CONFIRM
         if [ "${CONFIRM}" == "y" ]
         then
            echo "CASE CREATED"
            mkdir ${CASE_DIR}
            cp ${CASES}/TEMPLATE/* ${CASE_DIR}
         else
            echo "CANCEL"
            return
         fi
      fi
   else
      cd ${CASES}

      select DIR in *;
      do
         CASE_DIR=${CASES}/${DIR}
         break
      done
   fi
   cd ${CASE_DIR}
}
