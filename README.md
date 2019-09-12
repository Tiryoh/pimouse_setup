# pimouse_setup

「Raspberry Piで学ぶ ROSロボット入門」の4章で作る、デバイスドライバのインストーラです。  
`systemd`を使ってサービスとして起動できるようにアップデートしてあります。

このインストーラを使用してRaspberryPiMouseをセットアップすることでOS起動後に自動で`rtmouse.ko`がインストールされるようになります。

## 使い方

* [rt-net/RaspberryPiMouse](https://github.com/rt-net/RaspberryPiMouse)を`/home/ubuntu`にダウンロード

```sh
cd $HOME && git clone https://github.com/rt-net/RaspberryPiMouse.git
```

* このインストーラをダウンロード

```sh
cd $HOME && git clone https://github.com/Tiryoh/pimouse_setup.git
```

* このインストーラを実行

```sh
cd $HOME/pimouse_setup && sudo make install
```
