#!/bin/bash

#sources.list �t�@�C�����o�b�N�A�b�v
sudo cp -p /etc/apt/sources.list ~/tmp/sources.list.backup

#sources.list �t�@�C������������
sudo sed -i 's/xenial/bionic/g' /etc/apt/sources.list

#�^�C���]�[���̐ݒ�
sudo timedatectl set-timezone Asia/Tokyo
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#�����̓���
sudo sed -i 's/#NTP=/NTP=ntp.nict.jp/g' /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo systemctl restart systemd-timesyncd.service

#�p�b�P�[�W�A�[�J�C�u�~���[JP�ύX
sudo perl -p -i.bak -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' /etc/apt/sources.list

#�A�b�v�f�[�g�m�F
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y
