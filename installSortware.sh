#!/bin/sh
apt-get update

##install notepadqq
 add-apt-repository ppa:notepadqq-team/notepadqq


 add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:saiarcot895/myppa
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo add-apt-repository ppa:team-xbmc/ppa

sudo add-apt-repository ppa:fcitx-team/nightly

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

apt-get update
sudo apt-get -y install apt-fast

apt-fast upgrade

apt-fast -y  install gnome-tweak-tool

apt-fast -y install code # or code-insiders

apt-fast -y  install notepadqq

apt-fast -y  install oracle-java8-installer 

 

apt-fast -y  install guake

apt-fast -y  install mysql-server-5.7

apt-fast -y  install git 

apt-fast -y  install uget

apt-fast -y  install fcitx 
apt-fast -y  install sogoupinyin

apt-get install -f 


wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb

dpkg -i sublime-text_build-3083_amd64.deb



apt-fast -y  install shadowsocks-qt5


apt-fast -y install kodi


##install wudao dict
# echo 安装环境\: 需要python3和bs4\(在线搜索用\)

# apt-fast -y  install python3
# apt-fast -y  install python3-pip
# apt-fast -y  install pip3
#  pip3 install --upgrade pip
#  pip3 install setuptools
#  pip3 install bs4
# echo 运行

#git clone https://github.com/ChestnutHeng/Wudao-dict/
#cd Wudao-dict/wudao-dict
#sh setup.sh





#zsh
apt-get install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
source .zshrc
apt-get install maven

