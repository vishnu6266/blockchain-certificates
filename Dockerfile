FROM seegno/bitcoind:0.13.2-alpine
MAINTAINER Sreevishnu Nair "sreevishnu.nair@laureate.net"

COPY . /blockchain_certificates

# 2nd line of apk adds are for ethereum
# The last line is a workaround for merkletools requiring an old version of pysha3
RUN apk add --update bash python3 python3-dev ca-certificates linux-headers gcc musl-dev \
  libtool libffi-dev openssl openssl-dev gmp-dev build-base openjdk8-jre \
    ##&& python3 -m venv new_py3_env\
    ##&& source new_py3_env/bin/activate \
    && pip3 install /blockchain_certificates/. \
    && mkdir -p /etc/data \
    && mkdir ~/.bitcoin \
    #&& echo $'rpcuser=foo\nrpcpassword=bar\nrpcport=8332\nregtest=1\nrelaypriority=0\nrpcallowip=127.0.0.1\nrpcconnect=127.0.0.1\n' > /root/.bitcoin/bitcoin.conf \
    && rm -r /usr/lib/python*/ensurepip \
    && rm -rf /var/cache/apk/* \
    && rm -rf /root/.cache \
    #&& sed -i.bak s/==1\.0b1/\>=1\.0\.2/g /usr/lib/python3.*/site-packages/merkletools-1.0.2-py3.*.egg-info/requires.txt

#ADD ./issue_certificate.sh /usr/local/bin
RUN chmod +x /blockchain_certificates/issue_certificate.sh

#ADD bitcoin-entrypoint.sh /usr/local/bin
RUN chmod +x /blockchain_certificates/bitcoin-entrypoint.sh

#ENTRYPOINT bitcoind -daemon && bash
ENTRYPOINT /blockchain_certificates/bitcoin-entrypoint.sh

