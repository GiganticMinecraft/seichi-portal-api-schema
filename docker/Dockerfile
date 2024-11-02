FROM node:22-bullseye-slim

ENV PAGE_TITLE=ReDoc
ENV SPEC_URL=https://petstore3.swagger.io/api/v3/openapi.json
ENV PORT=8080

EXPOSE 8080

RUN npm install -g @typespec/compiler @redocly/cli http-server 

USER node
WORKDIR /tmp/files

COPY --chmod=554 --chown=node:node ./docker/entrypoint.sh .
COPY --chown=node:node ./.github/template.hbs .

ENTRYPOINT ["./entrypoint.sh"]
