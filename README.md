# dotfiles

This repository includes dotfiles (for MacOS)

## Setup

### 前提条件

先にHomebrewをインストールすること。(https://brew.sh/ja/)
本リポジトリを適当なところに clone してきて、カレントディレクトリを本リポジトリのルートに変更しておく。

```shell
$ git clone https://github.com/k3nNyJP/dotfiles.git
$ cd dotfiles
```


### homebrew の環境再現

本リポジトリのルートディレクトリで下記を実行する
（もしくは Brewfile のパスを必要に応じて調整すること）

```shell
$ brew bundle install --file=Brewfile
```

### shell 環境の再現

シェルの設定ファイル等を構築するためのスクリプトを実行する
（NOTE：一部Homebrewで管理しているツールに依存しているので先にHomebrewの環境を再現すること）

```shell
$ source initialize.sh
```

## What's in the box?

* .zshrc
* Brewfile
