FROM node:19-bullseye-slim

ENV PAGE_TITLE=ReDoc
ENV SPEC_URL=https://petstore3.swagger.io/api/v3/swagger.json
ENV PORT=8080

EXPOSE 8080

RUN npm install -g @redocly/cli

ENTRYPOINT ["sh", "-c", "redocly preview-docs $SPEC_URL --port $PORT --host 0.0.0.0 --force"]
