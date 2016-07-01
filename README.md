# 社絡

## 開発環境

- Ruby 2.3.1
- Rails 5.0.0

## インストール

```
cp config/database.yml.example config/database.yml
bundle
rails db:create
rails db:migrate
```

## デプロイ

develop ブランチを変更すると、wercker により自動でデプロイされます。  
[https://sharaku-staging.herokuapp.com](https://sharaku-staging.herokuapp.com)

## ライセンス
[MIT License](https://github.com/ogihara-ryo/sharaku/blob/develop/LICENSE)
