#!/bin/bash

#create certificate template based on configuration from conf.ini
cd /cert-tools && create-certificate-template -c  /etc/data/certificate_templates/conf.ini 

rm -f /etc/data/unsigned_certificates/*
rm -f /etc/data/blockchain_certificates/*

# generate certificates using certificate template json file and user csv file in sample_data/rosters/  
cd /cert-tools && instantiate-certificate-batch -c /etc/data/certificate_templates/conf.ini 


#Start bitcoind
#bitcoind -daemon 

#sleep 1m

bitcoin-cli getinfo

if [ "$regtest" = "true" ]
then
  #Create  issuing address inside the cert-issuer container
  issuer=`bitcoin-cli getnewaddress` 
  sed -i.bak "s/<issuing-address>/$issuer/g" /etc/data/issuer/conf.ini
  bitcoin-cli dumpprivkey $issuer > /etc/data/issuer/pk_issuer.txt
fi

#Generate and print fake bitcoin money in cert-issuer container

bitcoin-cli generate 101
bitcoin-cli getbalance

echo "issuer - $issuer"

#Send money to cert issuer
bitcoin-cli sendtoaddress $issuer 5
 
cert-issuer -c /etc/data/issuer/conf.ini

if [ "$regtest" = "true" ]
then
  cp -f /etc/data/issuer/conf.ini.bak /etc/data/issuer/conf.ini
fi
