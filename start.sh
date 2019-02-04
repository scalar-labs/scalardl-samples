#!/bin/bash

print_usage_and_exit() {
  echo "Usage: $0 [-hs]"
  echo "  -s  Apply schema"
  echo "  -h  Print out this message and exit"
  exit 1
}

while getopts 'hs' opt; do
  case $opt in
    s) apply_schema=true ;;
    *) print_usage_and_exit ;;
  esac
done

docker-compose up -d

if [ $apply_schema ]; then
  echo "applying schema"
  for i in {1..7}; do
    sleep 3
    docker-compose exec cassandra cqlsh -f /create_schema.cql && break
    echo "error applying schema... sleeping for 3 seconds"

    if [ $i -eq 7 ]; then
      echo "error applying schema... aborting"
      docker-compose down
      exit 1
    fi
  done
  echo "schema successfully applied"
  exit 0
fi
