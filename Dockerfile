FROM seegno/bitcoind:0.13.2-alpine
MAINTAINER Sreevishnu Nair "sreevishnu.nair@laureate.net"

COPY . /blockchain_certificates

# 2nd line of apk adds are for ethereum
# The last line is a workaround for merkletools requiring an old version of pysha3
RUN apk add --update curl bash python3 python3-dev ca-certificates linux-headers gcc musl-dev \
  libtool libffi-dev openssl openssl-dev gmp-dev build-base openjdk8-jre \
    && python3 -m venv  --without-pip  new_py3_env\
    && source new_py3_env/bin/activate \
    && curl https://bootstrap.pypa.io/get-pip.py | python \
    && deactivate \
    && source new_py3_env/bin/activate \
    && pip3 install /blockchain_certificates/. \
    && deactivate \
    && mkdir -p /etc/data \
    && mkdir ~/.bitcoin \
    && rm -r /usr/lib/python*/ensurepip \
    && rm -rf /var/cache/apk/* \
    && rm -rf /root/.cache 

#ADD ./issue_certificate.sh /usr/local/bin
RUN chmod +x /blockchain_certificates/issue_certificate.sh

#ADD bitcoin-entrypoint.sh /usr/local/bin
RUN chmod +x /blockchain_certificates/bitcoin-entrypoint.sh

EXPOSE 8332 8333 18332 18333 18444
#ENTRYPOINT bitcoind -daemon && bash
ENTRYPOINT /blockchain_certificates/bitcoin-entrypoint.sh

