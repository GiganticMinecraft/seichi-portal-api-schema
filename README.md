# seichi-api-schema

このリポジトリは、Seichi Portalにおいて、フロントエンドとバックエンド間の通信に必要なスキーマの定義を行っています。

プロジェクトの目的やフロントエンド・バックエンドなどの関連リポジトリについては、[こちらのリポジトリ](https://github.com/GiganticMinecraft/seichi-portal)を参照してください。

## 実装について

スキーマは、[OpenAPI v3.0.0](https://spec.openapis.org/oas/v3.0.0)で記載されています。

[GitHub Pages上に公開](https://giganticminecraft.github.io/seichi-api-schema/)もされており、視覚的に確認できるようになっています。これは`main`ブランチに更新があると、自動的にGitHub Actionsによって反映されます。

### ローカルで確認する

`docker compose`を利用することで、ローカル環境で、スキーマを視覚的に確認することができます。

`docker compose up -d`で、コンテナを起動したら、`http://localhost:8081`または`http://localhost:8082`にアクセスすると開くことができます。

それぞれの違いは以下の通りです。

* 8081
  * Swaggerが提供するイメージを利用するコンテナです。
  * バックエンドサーバーが起動していれば、画面から実際にバックエンドに向けてリクエストを送信することができます。
* 8082
  * redoclyが提供するイメージを利用するコンテナです。
  * Swaggerのものに比べて、見やすくなっています。

## ライセンス

[Apache Licence 2.0](./LICENSE)
