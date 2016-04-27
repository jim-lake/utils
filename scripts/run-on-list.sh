#!/bin/bash

LIST=$1
IPS=`cat $LIST`
SCRIPT=`cat $2`

for IP in $IPS ; do
  ssh $IP 'bash -s' < $2
done
