#!/bin/bash

redocly build-docs /schema/openapi.yaml -o ./docs/index.html -t ./template.hbs
http-server ./docs -p $PORT
