#!/bin/bash

#sources.list �t�@�C�����o�b�N�A�b�v
echo "sources.list �t�@�C�����o�b�N�A�b�v"
sudo cp -p /etc/apt/sources.list ~/tmp/sources.list.backup

#sources.list �t�@�C������������
echo "sources.list �t�@�C������������"
sudo sed -i 's/xenial/bionic/g' /etc/apt/sources.list

#�^�C���]�[���̐ݒ�
echo "�^�C���]�[���̐ݒ�"
sudo timedatectl set-timezone Asia/Tokyo
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#�����̓���
echo "#�����̓���"
sudo sed -i 's/#NTP=/NTP=ntp.nict.jp/g' /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo systemctl restart systemd-timesyncd.service

#�p�b�P�[�W�A�[�J�C�u�~���[JP�ύX
#echo "�p�b�P�[�W�A�[�J�C�u�~���[JP�ύX"
#sudo perl -p -i.bak -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' /etc/apt/sources.list

#�A�b�v�f�[�g�m�F
echo "�A�b�v�f�[�g�m�F"
echo "update"
sudo apt update
echo "upgrade"
sudo apt upgrade -y
echo "dist-upgrade"
sudo apt dist-upgrade -y
echo "full-upgrade"
sudo apt full-upgrade -y
echo "autoremove"
sudo apt autoremove -y
echo "clean"
sudo apt clean -y
