#!/bin/bash

MD_PATH=$1
REL_MD_PATH=`python -c "import os.path; print os.path.relpath('$MD_PATH', '.')"`
MD_DIR=`dirname $MD_PATH`

nohup browser-sync start --server --serveStatic $MD_DIR --index $REL_MD_PATH --files $REL_MD_PATH &> /dev/null &
