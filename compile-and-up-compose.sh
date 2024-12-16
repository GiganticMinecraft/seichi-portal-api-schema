#!/bin/bash

npm ci
tsp compile ./spec
docker compose down
docker compose up -d
