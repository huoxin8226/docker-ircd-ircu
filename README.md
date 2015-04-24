ircd-ircu
================

# はじめに
dockerにてircd-ircuサーバを提供するコンテナです。

使い方
------
# Installation
以下のようにdocker imageをpullします。

    docker pull sharaku/ircd-ircu


Docker imageを自分で構築することもできます。

    https://github.com/sharaku/docker-ircd-ircu.git
    cd docker-ircd-ircu
    docker build --tag="$USER/ircd-ircu" .

# Quick Start
ircd-ircuのimageを実行します。

    docker run -d \
      -e IRCD_GENERAL_NAME=example.com \
      -e IRCD_GENERAL_DESCRIPTION=example.com \
      -e IRCD_ADMIN_CONTACT=root@example.com \
      -e IRCD_CLITENT_PASSWD="" \
      -p 6667:6667 \
      sharaku/ircd-ircu

# Argument

+   `-e IRCD_GENERAL_NAME=example.com`
    IRCサーバの名称を設定します。

+   `-e IRCD_GENERAL_DESCRIPTION=example.com`
    IRCサーバのWelcomeメッセージや説明を設定します。

+   `-e IRCD_ADMIN_CONTACT=root@example.com`
    ircへ接続するためのパスワードを指定します。

+   `-e IRCD_CLITENT_PASSWD=""`
    ircへ接続するためのパスワードを指定します。

+   `-p port:6667`
    ircの外部公開するポートを設定します。


