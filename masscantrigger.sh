#!/bin/bash -
#===============================================================================
#masscantrigger v0.1 - Copyright 2020 James Slaughter,
#This file is part of masscantrigger v0.1.

#masscantrigger v0.1 is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#masscantrigger v0.1 is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with masscantrigger v0.1.  If not, see <http://www.gnu.org/licenses/>.
#===============================================================================
#------------------------------------------------------------------------------
#
# Execute masscantrigger on top of an Ubuntu-based Linux distribution.
#
#------------------------------------------------------------------------------

__ScriptVersion="masscantrigger-v0.1"
LOGFILE=""
Target_file=$1
Output_file=$2

echoerror() {
    printf "${RC} [x] ${EC}: $@\n" 1>&2;
}

echoinfo() {
    printf "${GC} [*] ${EC}: %s\n" "$@";
}

echowarn() {
    printf "${YC} [-] ${EC}: %s\n" "$@";
}

usage() {
    echo "usage: sudo masscantrigger.sh <target file> <output file>"
    exit 1
}

initialize() {
    echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE
    echoinfo "Running masscantrigger.sh version $__ScriptVersion on `date`" >> $LOGFILE
    echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE

    echoinfo "---------------------------------------------------------------"
    echoinfo "Running masscantrigger.sh version $__ScriptVersion on `date`"
    echoinfo "---------------------------------------------------------------"
}

pipe_to_masscan() {
 
    #Target 
    echoinfo "Target file is: $ARG1" 

    #
    echoinfo "Piping program execution to masscan..."
    echoinfo "Piping program execution to masscan..." >> $LOGFILE
    echo $(masscan -p80,161,443,2075,2076,3000,3306,3366,3868,4000,4040,4044,5000,5432,5673,5900,6000,6443,7077,7080,7443,7447,8000,8080,8081,8181,8089,8880,8888,8983,9000,9091,9443,9999,10000,15672 --open -il $Target_file --banners -oG $Output_file) >> $LOGFILE

    return 0
}

wrap_up() {
    echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE
    echoinfo "Program complete on `date`" >> $LOGFILE
    echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE

    echoinfo "---------------------------------------------------------------"
    echoinfo "Program complete on `date`"
    echoinfo "---------------------------------------------------------------"
}

#Function calls
#Bail if we aren't root.  We have to do this for masscan
if [ `whoami` != "root" ]; then
    echoerror "masscantrigger must run as root!"
    echoerror "Usage: sudo ./masscantrigger.sh <targetfile> <output file>"
    exit 3
fi

initialize

if [ ! -z "$1" ] || [ ! -z "$2" ]
then
    pipe_to_masscan
else
    usage
fi
wrap_up
