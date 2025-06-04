#!/usr/bin/env bash
log(){
    echo $(date -u +"%Y-%m-%d %H:%M:%S")  "$@"
}

while [[true]]; do
    log "Number of open connections: $(netstat -tlnp | wc -l)
    sleep 30
done