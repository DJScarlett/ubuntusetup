#!/bin/bash

#sources.list ファイルをバックアップ
sudo cp -p /etc/apt/sources.list ~/tmp/sources.list.backup

#sources.list ファイルを書き換え
sudo sed -i 's/xenial/bionic/g' /etc/apt/sources.list

#タイムゾーンの設定
sudo timedatectl set-timezone Asia/Tokyo
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#時刻の同期
sudo sed -i 's/#NTP=/NTP=ntp.nict.jp/g' /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo systemctl restart systemd-timesyncd.service

#パッケージアーカイブミラーJP変更
sudo perl -p -i.bak -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' /etc/apt/sources.list

#アップデート確認
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y
