#!/bin/bash

TEST_CASE_PROXY=$1

# Boot the server in a background process.
nohup npx verdaccio@6.0.0-6-next.76 --config ./config.yml --listen $TEST_CASE_PROXY &

# Wait for the server to begin listening for connections
( tail -F -n10 proxy.log & ) | fgrep -q $TEST_CASE_PROXY

cat proxy.log
