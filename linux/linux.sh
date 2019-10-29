#!/usr/bin/env bash
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin

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
base_path = "/usr/local"
jdk_Path = "$base_path/java"
mvn_path = "$base_path/maven"
tomcat_path = "$base_path/tomcat"
nuxus_path = "$base_path/nuxus"
git_path = "$base_path/git"


# 脚本版本
shell_version="1.3.2"

# 远程安装包地址
github="https://raw.githubusercontent.com/gclm/shell/master"
coding=""

#==================基础配置 end =============================

#############系统基础组件  start #############

# 采用 root 权限使用该脚本
root(){
   #判断是否是roo用户
   if [ $(id -u) != "0" ]; then
        echo "Error:You must be root to run this script"
   fi
}


# 基础环境组件 centos
init_centos(){ 
    echo -e "${Info}:================== 开始进行初始化环境 ============================="
    echo -e "安装开发工具---> Development Tools"
    yum -y groupinstall 'Development Tools'
    echo -e "安装开发工具完成"
    echo -e "安装系统编译组件 ---> gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker"
    yum -y install gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker 
    echo -e "安装系统编译组件完成"
    echo -e "安装 ---> wget"
    yum install -y curl wget
    echo -e "安装 ---> wget 完成"   
    echo -e "${Info}:================== 初始化环境完成 ============================="
}

# 基础环境组件 debain/ubuntu
init_debain_ubuntu(){
    echo -e "${Info}:================== 开始进行初始化环境 ============================="
    echo -e "安装开发工具---> Development Tools"
    yum -y groupinstall 'Development Tools'
    echo -e "安装开发工具完成"
    echo -e "安装系统编译组件 ---> gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker"
    yum -y install gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker 
    echo -e "安装系统编译组件完成"
    echo -e "安装 ---> wget"
    apt-get install -y curl wget
    echo -e "安装 ---> wget 完成"   
}
#############系统基础组件  end #############


#############系统开发环境组件  start #############

# oracle  jdk install
# openjdk 
openjdk(){
    if [[ "${release}" == "centos" ]]; then
        yum install java-1.8.0-openjdk-headless java-1.8.0-openjdk java-1.8.0-openjdk-devel -y
    elif [[ "${release}" = "ubuntu" || "${release}" = "debian" ]];then
        apt-get install -y curl wget
    fi
}

#############系统开发环境组件  end #############


#############系统检测组件 start #############

#检查系统
check_system_version(){
	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
}

#检查Linux版本
check_linux_version(){
	if [[ -s /etc/redhat-release ]]; then
		version=`grep -oE  "[0-9.]+" /etc/redhat-release | cut -d . -f 1`
	else
		version=`grep -oE  "[0-9.]+" /etc/issue | cut -d . -f 1`
	fi
	bit=`uname -m`
	if [[ ${bit} = "x86_64" ]]; then
		bit="x64"
	else
		bit="x32"
	fi
}

#############系统检测组件 end #############