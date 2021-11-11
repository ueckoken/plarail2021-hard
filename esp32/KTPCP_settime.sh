#!/bin/bash

nowtime=`date +%s`
nowtime=`echo ${nowtime} | sed -e "s/[\r\n]\+//g"`
curl -X POST -H "Content-Type: application/json" -d '{"pin": -1, "state":"'${nowtime}'"}' "http://$1"