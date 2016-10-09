おこづかいちょうβ
=======

## 本番環境
- http://account-book-pig.herokuapp.com/

## ステージング環境
- http://account-book-pig-test.herokuapp.com/

## 開発

開発は[@kae_kasui](https://twitter.com/kae_kasui)が中心になって実装しています。
Railsを触ったことがない人も開発の練習のために参加してみてはどうでしょうか。

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
### PostgreSQLのインストール

```
brew install postgres
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
> user = FactoryGirl.create(:email_user, :registered)
> user.save
> exit

rake user:add_admin USER_ID=1
```

### サーバーの起動

```
bin/rails s -p 3001
gulp serve
```