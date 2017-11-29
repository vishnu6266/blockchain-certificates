
### To build docker image
docker build -t laur/block-chain-certificates:1.0 .

### To run docker container

docker run -it -d --name block-chain-certificates -p 28332:8332 -p 28333:8333 -p 48332:18332 -p 48333:18333 -p 48444:18444 -v <project_folder>/data:/etc/data laur/block-chain-certificates:1.0

### Create certificate

#### AWS

Run /home/ec2-user/pdf-certs/issue_certificate.sh  in EC2 instance

Configuration files available in S3


#### To test using regtest

bitcoin-cli -regtest getnewaddress

bitcoin-cli -regtest generate 101
bitcoin-cli -regtest getbalance
bitcoin-cli -regtest sendtoaddress <address> 10

bitcoin-cli -regtest listunspent 0

bitcoin-cli -regtest generate 1

bitcoin-cli -regtest listunspent 1

bitcoin-cli -regtest validateaddress <address>

Update data/config.ini with address

sudo docker exec -it block-chain-certificates /bin/bash

source new_py3_env/bin/activate

create-certificates -c /etc/data/config.ini

deactivate

Run following command before executing this command

bitcoin-cli -regtest generate 1

#### testnet

Generate test net wallet

https://www.bitaddress.org/bitaddress.org-v1.9-SHA1-a487b495d710d6f617d688e5f758e40c8b6c510e.html?testnet=true

Get some testnet coins

https://blog.smoogs.io/how-to-get-a-testnet-wallet-and-coins-f480c678f23a

bitcoin-cli importprivkey <Private Key>  "My Testnet Wallet"

bitcoin-cli -testnet validateaddress <pub key> 

bitcoin-cli -testnet getbalance <pub key>


Update data/config.ini with public key

sudo docker exec -it block-chain-certificates /bin/bash

source new_py3_env/bin/activate

create-certificates -c /etc/data/config.ini

deactivate


### Validate Certificate

Validatation of the certificate is only supported in testnet since dependency with
https://github.com/karask/blockchain-proofs.git

    validate-certificates -c /etc/data/config.ini -f /etc/data/Andreas_Vlachos.pdf

####

bitcoin-core

/Applications/Bitcoin-Qt.app/Contents/MacOS/Bitcoin-Qt -testnet -dnsseed=0 -connect=localhost:18332 -datadir=<dir>


/Applications/Bitcoin-Qt.app/Contents/MacOS/Bitcoin-Qt -regtest -dnsseed=0 -connect=localhost:18332 -datadir=<dir>

blockchain-certificates
=======================

This project allows an institution to issue digital certificates. It creates pdf certificate files (or uses existing ones) and issues a hash representing those files into the Bitcoin network's blockchain. It can do so in two ways; one using an index file to aggregate the certificates' hashes and the other that does not require an index file. The former is the method used in the past and we do **recommend using the new method** as it supersedes the old ones. The only advantage of the old process over the new is that it is easier to verify manually.

****

More information on creating certificates  (**recommended**):

<https://github.com/UniversityOfNicosia/blockchain-certificates/blob/master/docs/create_certificates.md>

****

More information on issuing existing certificates:

<https://github.com/UniversityOfNicosia/blockchain-certificates/blob/master/docs/issue_certificates.md>

****

More information on creating certificates with an index file (deprecated): 

<https://github.com/UniversityOfNicosia/blockchain-certificates/blob/master/docs/create_certificates_with_index.md>



