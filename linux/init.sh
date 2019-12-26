#!/usr/bin/env bash


#=================================================
#	System Required: CentOS 7,Debian 8/9,Ubuntu 16+
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
shell_version="0.0.4"
maven_version="3.6.2"
jdk_version="221"
tomcat_version="9.0.19"
gradle_version=""
nexus_version="3.19.1-01"
mysql_version=""
git_version="2.9.5"

# 远程安装包地址
coding="https://dev.tencent.com/u/gclm/p/resources/git/raw/master"

#==================基础配置 end =============================

install(){

echo -e "${Info}:================== 开始进行初始化环境 ============================="

echo -e "${Info}:更新系统缓存"
yum -y update

echo -e "${Info}:修改终端名"
hostnamectl set-hostname centos7
hostnamectl --pretty
hostnamectl --static
hostnamectl --transient

echo -e "${Info}:安装基础组件"
yum install -y curl wget vim

echo -e "${Info}:安装编译环境"
yum -y groupinstall 'Development Tools'
yum -y install gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker

# 初始化软件文件夹
echo -e "${Info} 初始化安装软件文件夹"
if [ ! -d "$soft_path" ]; then
    echo -e "正在创建$soft_path目录"
    mkdir -p $soft_path
    echo -e "目录$soft_path创建成功"
fi

}

install