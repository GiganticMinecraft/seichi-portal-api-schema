FROM node:20-bullseye-slim

ENV PAGE_TITLE=ReDoc
ENV SPEC_URL=https://petstore3.swagger.io/api/v3/swagger.json
ENV PORT=8080

EXPOSE 8080

RUN npm install -g @redocly/cli kill-port http-server

USER node
WORKDIR /tmp/files

COPY --chmod=554 --chown=node:node ./docker/entrypoint.sh .
COPY --chown=node:node ./.github/template.hbs .

ENTRYPOINT ["./entrypoint.sh"]
