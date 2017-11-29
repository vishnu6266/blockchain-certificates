#!/bin/bash

cp -p /etc/data/bitcoin.conf  ~/.bitcoin/

bitcoin-cli -regtest generate 1

source new_py3_env/bin/activate

create-certificates -c /etc/data/config.ini

deactivate
