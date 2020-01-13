#!/bin/bash

# Stop on the first sign of trouble
set -e

SCRIPT_COMMON_FILE=$(pwd)/../rak/rak/shell_script/rak_common.sh

if [ $UID != 0 ]; then
    echo_error "Operation not permitted. Forgot sudo?"
    exit 1
fi

source $SCRIPT_COMMON_FILE

mkdir -p /usr/local/rak/lora

mkdir /opt/ttn-gateway -p

pushd rak7246
./install.sh
popd

cp ./update_gwid.sh rak7246/packet_forwarder/lora_pkt_fwd/update_gwid.sh
cp ./start.sh  rak7246/packet_forwarder/lora_pkt_fwd/start.sh
cp ./set_eui.sh  rak7246/packet_forwarder/lora_pkt_fwd/set_eui.sh

cp rak7246 /usr/local/rak/lora/ -rf

cp ttn-gateway.service /lib/systemd/system/ttn-gateway.service

systemctl enable ttn-gateway.service

