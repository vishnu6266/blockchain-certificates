#!/bin/bash

# Refer read me file for more details on how to setup in AWS

sudo rm -rf /home/ec2-user/pdf-certs/test/data/*

#Copy sample_data to EC2
aws s3 cp s3://laureate-block-certs/pdf-certs/test/data .  --recursive

sudo docker exec -it block-chain-certificates /blockchain_certificates/regtest_setup.sh
sudo docker exec -it block-chain-certificates /blockchain_certificates/issue_certificate.sh

#push changed files to s3
aws s3 sync ./data/certificates s3://laureate-block-certs/pdf-certs/test/data/certificates

