# ベースイメージ
FROM ruby:3.3.3

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    default-mysql-client \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリを設定
WORKDIR /rails

# GemfileとGemfile.lockをコピーして依存関係をインストール
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 4 --retry 3

# アプリケーションのソースコードをコピー
COPY . .

# コンテナ起動時に実行されるコマンドを設定（例: Railsサーバーを起動）
CMD ["rails", "server", "-b", "0.0.0.0"]
