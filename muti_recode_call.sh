#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail


# Usage:
# muti_recode_call.sh   \
#            -n cloudflare-api-token \ # cloadflare api token create in your account profile
#            -h host.example.com \     # fqdn of the record you want to update
#            -z example.com \          # will show you all zones if forgot, but you need this
#            -t A|AAAA                 # specify ipv4/ipv6, default: ipv4

# Optional flags:
#            -f false|true \           # force dns update, disregard local stored ip


CF_DDNS_SHELL=./cf-v4-ddns.sh

# API Token, see https://www.cloudflare.com/a/account/my-account,
CFTOKEN=

# Zone name, eg: example.com
CFZONE_NAME=

# Hostname to update, in array, eg: (x1.example.com x2.example.com x3.example.com)
CFRECORD_NAME_ARRAY=( )
CFRECORD_NAME_ARRAY_LEN=${#CFRECORD_NAME_ARRAY[*]}


# run
for ((i=0; i<$CFRECORD_NAME_ARRAY_LEN; i++));
do
    $CF_DDNS_SHELL -n $CFTOKEN -h ${CFRECORD_NAME_ARRAY[$i]} -z $CFZONE_NAME -t A
done



