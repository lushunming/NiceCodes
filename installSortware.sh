#!/bin/sh
apt-get update
apt-get upgrade
# add-apt-repository ppa:webupd8team/java
 #apt-get update
 #apt-get install oracle-java7-installer 

 add-apt-repository ppa:webupd8team/brackets
 apt-get update
 apt-get install brackets 

 apt-get install guake

 apt-get install mysql-server-5.7

 apt-get install git 

 apt-get install fcitx 

##install wudao dict
echo 安装环境\: 需要python3和bs4\(在线搜索用\)

 apt-get install python3
 apt-get install python3-pip
 apt-get install pip3
 pip3 install bs4
echo 运行

git clone https://github.com/ChestnutHeng/Wudao-dict/
cd Wudao-dict/wudao-dict
sh setup.sh
##install notepadqq
 add-apt-repository ppa:notepadqq-team/notepadqq
 apt-get update
 apt-get install notepadqq


#zsh
apt-get install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh


chsh -s /bin/zsh

apt-get install maven