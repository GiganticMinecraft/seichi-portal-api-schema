#!/bin/bash

tsp compile ./src

redocly build-docs ./tsp-output/@typespec/openapi3/openapi.yaml -o ./docs/index.html -t ./template.hbs
http-server ./docs -p $PORT
