#!/bin/bash

source new_py3_env/bin/activate

create-certificates -c /etc/data/config.ini

deactivate
