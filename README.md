おこづかいちょうβ
=======

[![wercker status](https://app.wercker.com/status/abdace97f9ad0f730c2448ed2a170e66/s/master "wercker status")](https://app.wercker.com/project/byKey/abdace97f9ad0f730c2448ed2a170e66)

## 本番環境
- http://account-book-pig.herokuapp.com/

## ステージング環境
- http://account-book-pig-test.herokuapp.com/

## 開発

開発は[@kae_kasui](https://twitter.com/kae_kasui)が中心になって実装しています。

### バックエンド

- Ruby 2系
  - 詳細なバージョンは、`.ruby-version`または`Gemfile`の`ruby`を確認
- Rails 5系
  - 詳細なバージョンは、`Gemfile`を確認
- PostgreSQL

### フロントエンド

- gulp
- jade
- Coffee Script
- AngularJS
- sass

## コーディングルール
- 基本的にはrubocop

## CI環境

werckerを利用

## 環境構築

### パッケージのインストール

Command line toolsをインストール
```
xcode-select --install
```

Homebrewをインストール
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

```

rbenv等のインストールと設定
```
brew update
brew install rbenv ruby-build
brew install curl-ca-bundle
brew install npm
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```

rbenvでインストールできるRubyのバージョンを確認
```
rbenv install -l
```

rbenvでRubyをインストール
```
rbenv install 2.3.1
rbenv rehash
```

### ソースコードの入手

```
git clone https://github.com/summer-snowflake/account-book-pig.git
```
### PostgreSQLのインストールと起動

```
brew install postgres
postgres -D /usr/local/var/postgres
```

### Railsのインストール

```
cd account-book-pig
gem install bundle
bundle
```

### 各種パッケージのインストール

```
npm install
```

### DBの構築

```
rails db:create
rails db:migrate
rails db:seed # 現在のところは不要
```

### 初期データの作成（TODO: rails db:seedで入れられるようにします）

```
bin/rails c
> user = FactoryBot.create(:email_user, :registered)
> user.save
> exit

rake user:set_admin USER_ID=1
```

### サーバーの起動

```
bin/rails s -p 3001
gulp serve
```
