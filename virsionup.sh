#!/bin/bash


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

#OS�o�[�W�����A�b�v
echo "do-release-upgrade"
sudo do-release-upgrade