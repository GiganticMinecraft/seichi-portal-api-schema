#!/bin/bash

npm ci
tsp compile ./src
docker compse down
docker compose up -d
