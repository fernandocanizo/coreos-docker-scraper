#!/bin/sh
POSTGRES="gosu postgres postgres"
${POSTGRES} --single -E <<EOSQL
CREATE DATABASE scraper
EOSQL
