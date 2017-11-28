
#### To build docker image
docker build -t laur/block-chain-certificates:1.0 .

#### To run docker container

docker run -it -d --name block-chain-certificates -p 8332:8332 -p 8333:8333 -p 18332:18332 -p 18333:18333 -p 18444:18444 -v <project_folder>/data:/etc/data laur/block-chain-certificates:1.0


docker run -it -d --name block-chain-certificates -p 8332:8332 -p 8333:8333 -p 18332:18332 -p 18333:18333 -p 18444:18444  -v /Users/snair/Documents/Data/Incubation/BlockChain/blockchain-certificates/data:/etc/data laur/block-chain-certificates:1.0


#### bitcoin-cli

bitcoin-cli getnewaddress
bitcoin-cli generate 101
bitcoin-cli getbalance
bitcoin-cli sendtoaddress <address> 10

bitcoin-cli dumpprivkey <address>

bitcoin-cli listunspent 0

bitcoin-cli -regtest validateaddress <address>

### testnet

Generate a test wallet and get some testnet coins

https://blog.smoogs.io/how-to-get-a-testnet-wallet-and-coins-f480c678f23a

#### Generate the certificates

Update data/config.ini with wallet id

sudo docker exec -it block-chain-certificates /bin/bash

source new_py3_env/bin/activate

create-certificates -c /etc/data/config.ini

deactivate


####

bitcoin-core

/Applications/Bitcoin-Qt.app/Contents/MacOS/Bitcoin-Qt -testnet -dnsseed=0 -connect=localhost:18332 -datadir=/Users/snair/Documents/Data/Incubation/BlockChain/localnet/


/Applications/Bitcoin-Qt.app/Contents/MacOS/Bitcoin-Qt -regtest -dnsseed=0 -connect=localhost:18332 -datadir=/Users/snair/Documents/Data/Incubation/BlockChain/regtest/

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



