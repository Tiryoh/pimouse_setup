# pimouse_setup

[rt-net/RaspberryPiMouse](https://github.com/rt-net/RaspberryPiMouse)のデバイスドライバをOS起動後に自動でロードするためのインストーラです。

「Raspberry Piで学ぶ ROSロボット入門」の4章で作る、デバイスドライバのインストーラ([ryuichiueda/pimouse_setup](https://github.com/ryuichiueda/pimouse_setup))をベースにしています。  
`systemd`を使ってサービスとして起動できるようにアップデートしてあります。

## 使い方

* [rt-net/RaspberryPiMouse](https://github.com/rt-net/RaspberryPiMouse)を`/home/ubuntu`にダウンロードし、インストール

```sh
cd $HOME && git clone https://github.com/rt-net/RaspberryPiMouse.git
./utils/build_install.bash
```

* このインストーラをダウンロード

```sh
cd $HOME && git clone https://github.com/Tiryoh/pimouse_setup.git
```

* このインストーラを実行

```sh
cd $HOME/pimouse_setup && sudo make install
```

## 注意点

Ubuntu 18.04などの一部の環境では`rtcounter`が正常に動作しないことがわかっており、
以下の方法で`/boot/firmware/config.txt`を書き換えれば問題なく使用できるようです。  
https://github.com/rt-net/RaspberryPiMouse/issues/13#issuecomment-470002246

```sh
grep -q dtparam=i2c_baudrate /boot/firmware/config.txt || echo dtparam=i2c_baudrate=62500 | sudo tee -a /boot/firmware/config.txt
```
