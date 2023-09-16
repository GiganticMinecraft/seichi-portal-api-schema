#!/bin/bash

redocly build-docs /schema/openapi.yml -o ./docs/index.html -t ./template.hbs
http-server ./docs -p $PORT
