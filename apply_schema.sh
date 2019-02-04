#!/bin/bash

docker-compose exec cassandra cqlsh -f /create_schema.cql
