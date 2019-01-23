#!/bin/bash

wget -e --output-document=virtualmin-install.sh -nv http://software.virtualmin.com/gpl/scripts/install.sh
/bin/sh virtualmin-install.sh -f -v -n $1