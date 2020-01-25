#!/usr/bin/env bash

#=================================================
#	System Required: CentOS 7
#	Description: 开发环境搭建脚本 for linux
#	Version: 1.0.0
#	Author:  孤城落寞
#	Blog: https://blog.gclmit.club/
#=================================================

#==================基础配置 start ============================

# 字体样式
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${Green_font_prefix}[注意]${Font_color_suffix}"

# 安装路径
base_path="/usr/local"
java_Path="$base_path/java"
git_path="$base_path/git"
nexus_path="$base_path/nexus"
soft_path="/opt/software"
module_path="/opt/module"

# 版本
shell_version="1.0.2"
jdk_version="241"
maven_version="3.6.3"
git_version="2.25.0"
gradle_version="5.6.4"
nexus_version="3.20.1-01"
axel_verson="2.17.6"

# 远程安装包地址
#https://gclm.coding.net/p/LinuxSoftwares/d/LinuxSoftwares/git/raw/master/README.md
coding="https://gclm.coding.net/p/LinuxSoftwares/d/LinuxSoftwares/git/raw/master"
shell="https://gclm.coding.net/p/shell/d/shell/git/raw/master/linux"
#==================基础配置 end =============================

# 执行相关脚本
init(){
wget ${shell}/init.sh  && chmod +x init.sh
wget ${shell}/axel.sh  && chmod +x axel.sh
. ./init.sh
. ./axel.sh
}

init_jdk(){
wget ${shell}/jdk.sh  && chmod +x jdk.sh
. ./jdk.sh
}

init_maven(){
wget ${shell}/maven.sh  && chmod +x maven.sh
. ./maven.sh
}

init_nexus(){
wget ${shell}/nexus.sh  && chmod +x nexus.sh
. ./nexus.sh
}

init_git(){
wget ${shell}/git.sh  && chmod +x git.sh
. ./git.sh
}

init_nginx(){
wget ${shell}/nginx.sh  && chmod +x nginx.sh
. ./nginx.sh
}

init_gradle(){
wget ${shell}/gradle.sh  && chmod +x gradle.sh
. ./gradle.sh
}

#================== jenkins =============================

jenkins(){
    echo -e "${Info}: 开始安装 Jenkins"
    wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    yum install -y jenkins
}

#更新脚本
update_shell(){
	echo -e "当前版本为 [ ${shell_version} ]，开始检测最新版本..."
	shell_new_version=$(wget --no-check-certificate -qO- "http://${coding}/linux/install.sh"|grep 'shell_version="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1)
	[[ -z ${shell_new_version} ]] && echo -e "${Error} 检测最新版本失败 !" && start_menu
	if [[ ${shell_new_version} != ${shell_version} ]]; then
		echo -e "发现新版本[ ${shell_new_version} ]，是否更新？[Y/n]"
		read -p "(默认: y):" yn
		[[ -z "${yn}" ]] && yn="y"
		if [[ ${yn} == [Yy] ]]; then
			wget -N --no-check-certificate http://${github}/linux/install.sh && chmod +x install.sh
			echo -e "脚本已更新为最新版本[ ${shell_new_version} ] !"
		else
			echo && echo "	已取消..." && echo
		fi
	else
		echo -e "当前已是最新版本[ ${shell_new_version} ] !"
		sleep 5s
	fi
}

#开始菜单
start_menu(){
clear
echo -e "
Linux开发环境 一键安装管理脚本 ${Red_font_prefix}[v${shell_version}]${Font_color_suffix}
  -- 孤城落寞博客 | blog.gclmit.club --

 ${Green_font_prefix}0.${Font_color_suffix}  初始化环境
———————————— 开发环境(Java) ————————————
 ${Green_font_prefix}11.${Font_color_suffix} 安装 Oracle-JDK(v8u${jdk_version})
 ${Green_font_prefix}12.${Font_color_suffix} 安装 Open-JDK(v1.8.x)
 ${Green_font_prefix}13.${Font_color_suffix} 安装 Maven(v${maven_version})
 ${Green_font_prefix}14.${Font_color_suffix} 安装 Nexus(v${nexus_version})
 ${Green_font_prefix}15.${Font_color_suffix} 安装 Gradle(v${gradle_version})
———————————— 运维环境 —————————————————
 ${Green_font_prefix}21.${Font_color_suffix} 安装 Git
 ${Green_font_prefix}22.${Font_color_suffix} 安装 Git LFS
 ${Green_font_prefix}23.${Font_color_suffix} 安装 Nginx
 ${Green_font_prefix}24.${Font_color_suffix} 安装 Jenkins
———————————— 杂项管理 —————————————————
 ${Green_font_prefix}1.${Font_color_suffix} 升级脚本
 ${Green_font_prefix}2.${Font_color_suffix} 退出脚本
——————————————————————————————————————
 ${Red_font_prefix}请先初始化环境在进行其他操作${Font_color_suffix}
——————————————————————————————————————" && echo

read -p " 请输入选项 :" num
case "$num" in
	0)
	init
	;;
    1)
	update_shell
	;;
	2)
	rm -rf *.sh
	exit 1
	;;
	11)
	init_jdk
	jdk
	;;
	12)
	init_jdk
	open_jdk
	;;
	13)
	init_maven
	;;
	14)
	init_nexus
	;;
	15)
	init_gradle
	;;
    21)
	init_git
	git_install
	;;
	22)
	init_git
	git_lfs
	;;
	23)
	init_nginx
	;;
    24)
    jenkins
	;;
	*)
	clear
	echo -e "${Error}:请输入正确选项："
	sleep 3s
	start_menu
	;;
esac
}

start_menu