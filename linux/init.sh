#!/usr/bin/env bash

#初始化Linux环境
init(){

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
# 采用 root 权限使用该脚本
root(){
   #判断是否是roo用户
   if [ $(id -u) != "0" ]; then
        echo "请使用 root 用户运行该脚本"
   fi
}

#############系统检测组件 end #############
check_system_version
check_linux_version
[[ ${release} != "centos" ]] && echo -e "${Error} 本脚本不支持当前系统 ${release} !" && exit 1
root
init