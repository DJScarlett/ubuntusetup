#!/bin/bash

#タイムゾーンの設定
sudo timedatectl set-timezone Asia/Tokyo
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#時刻の同期
sudo sed -i 's/#NTP=/NTP=ntp.nict.jp/g' /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo systemctl restart systemd-timesyncd.service

#パッケージアーカイブミラーJP変更
#sudo perl -p -i.bak -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' /etc/apt/sources.list

#アップデート確認
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y

# パッケージインストール
sudo apt install -y git gcc g++ make openssl zlib1g-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev vim build-essential curl wget aptitude update-manager-core update-manager

#OSバージョンアップ
sudo do-release-upgrade -y

#再起動
echo "reboot"
sudo reboot