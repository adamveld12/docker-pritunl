#!/bin/bash
mongod -f /etc/mongod.conf --quiet &
pritunl start;
