# seichi-portal-api-schema

このリポジトリは、Seichi Portal において、フロントエンドとバックエンド間の通信に必要なスキーマの定義を行っています。

プロジェクトの目的やフロントエンド・バックエンドなどの関連リポジトリについては、[こちらのリポジトリ](https://github.com/GiganticMinecraft/seichi-portal)を参照してください。

## API 定義について

API の定義には [TypeSpec](https://typespec.io/) を使用しています。
TypeSpec については[公式ドキュメント](https://typespec.io/docs)を参照してください。

### リモートで確認する

seichi-portal-api-schema は GitHub Pages によって redocly が提供する形式で公開されています。

[GitHub Pages上の定義はこちら](https://giganticminecraft.github.io/seichi-portal-api-schema/)

### ローカルで確認する

`docker compose` を利用することで、ローカル環境で、スキーマを視覚的に確認することができます。

docker を使用する前に seichi-portal-api-schema のルートディレクトリで `tsp compile ./src` を実行し、`openapi.yaml`を生成する必要があります。

`docker compose up -d` で、コンテナを起動したら、`http://localhost:8081` または `http://localhost:8082` にアクセスすると開くことができます。

それぞれの違いは以下の通りです。

- 8081
  - Swagger が提供するイメージを利用するコンテナです。
  - [バックエンドサーバー](https://github.com/GiganticMinecraft/seichi-portal-backend)が起動していれば、画面から実際にバックエンドに向けてリクエストを送信することができます。
- 8082
  - redocly が提供するイメージを利用するコンテナです。
  - Swagger のものに比べて、見やすくなっています。

## ライセンス

[Apache Licence 2.0](./LICENSE)
