#!/bin/bash

seq 0 11 | xargs -I{} -P 12 curl -X POST -H "Content-Type: application/json" -d '{"pin":"'{}'", "state":"GET"}' "http://$1/gpio"

seq 12 27 | xargs -I{} -P 16 curl -X POST -H "Content-Type: application/json" -d '{"pin":"'{}'", "state":"ON"}' "http://$1/gpio"
