#!/bin/bash

MD_PATH=$1
if [ ! -z "$MD_PATH" ]
then
    REL_MD_PATH=`python -c "import os.path; print os.path.relpath('$MD_PATH', '.')"`
    MD_DIR=`dirname $MD_PATH`
fi


start() {
    browser-sync start --server --serveStatic $MD_DIR --index $REL_MD_PATH --files $REL_MD_PATH &> /dev/null &
}

stop() {
    pkill -f "browser-sync start --server --serveStatic $MD_DIR --index $REL_MD_PATH --files $REL_MD_PATH"
}

case "$2" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    *)
        echo "Usage: $0 md_path {start|stop}"
        exit 1
esac
exit 0
