#!/bin/bash


#アップデート確認
echo "アップデート確認"
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

#OSバージョンアップ
echo "do-release-upgrade"
sudo do-release-upgrade