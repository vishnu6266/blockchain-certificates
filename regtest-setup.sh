#!/bin/bash

cp -p /etc/data/bitcoin.conf  ~/.bitcoin/

issuer=`bitcoin-cli getnewaddress` 
bitcoin-cli generate 101
bitcoin-cli sendtoaddress $issuer 10
bitcoin-cli listunspent 0
bitcoin-cli getbalance $issuer
bitcoin-cli generate 1
bitcoin-cli listunspent 1