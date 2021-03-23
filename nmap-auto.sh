#!/bin/bash

#Variables
MODE="$1"
ADDRESS="$2"
PORTS="$3"
RESULTSDIR="$4"

echo "This script is set to output to XML format"

#Checking if directory exists
if [ ! -d "$RESULTSDIR" ]; then
	echo "Sorry $RESULTSDIR does not exist."
	sleep 1
	echo "Creating it now.."
	mkdir $RESULTSDIR # Creating directory 
	echo "$RESULTSDIR created."
else
	#Running nmap command
	nmap -$MODE -sV -Pn $ADDRESS -sC -p$PORTS -oX $RESULTSDIR/$(date "+%Y.%m.%d-%H.%M").xml
	if [ $? -eq 0 ]; then # Checking if nmap command failed or not
		echo "Success"
	else
		echo "Failed"
	fi
fi
exit