#!/bin/bash

search=${1}

echo ${PWD}

if ! matches=`grep ${search} file>/dev/null|awk '{print $1}'`; then
   echo "not found"
fi
