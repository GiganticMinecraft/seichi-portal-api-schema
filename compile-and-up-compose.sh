#!/bin/bash

npm ci
tsp compile ./src
docker compose down
docker compose up -d
