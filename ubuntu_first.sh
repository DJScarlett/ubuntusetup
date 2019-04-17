#!/bin/bash

#�^�C���]�[���̐ݒ�
sudo timedatectl set-timezone Asia/Tokyo
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#�����̓���
sudo sed -i 's/#NTP=/NTP=ntp.nict.jp/g' /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo systemctl restart systemd-timesyncd.service

#�p�b�P�[�W�A�[�J�C�u�~���[JP�ύX
#sudo perl -p -i.bak -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' /etc/apt/sources.list

#�A�b�v�f�[�g�m�F
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y

# �p�b�P�[�W�C���X�g�[��
sudo apt install -y git gcc g++ make openssl zlib1g-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev vim build-essential curl wget aptitude

#�ċN��
echo "reboot"
sudo reboot