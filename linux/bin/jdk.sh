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
coding="https://dev.tencent.com/u/gclm/p/shell/git/raw/master"

#==================基础配置 end =============================


init(){
    # 初始化安装目录
    if [ ! -d "$java_Path" ]; then
        echo -e "正在创建$java_Path目录"
        mkdir -p $java_Path
        echo -e "目录$java_Path创建成功"
    fi
}


install(){

    uninstall
    init

    cd $soft_path

    jdk_file=$(ls | grep jdk-*-linux-*.gz)
    jdk_dirname="jdk1.8.0_${jdk_version}"

    if [ ! -f "$jdk_file" ]; then
        echo -e "${Info}: 正在下载jdk请稍等..."
        wget -N --no-check-certificate ${coding}/linux/java/jdk-8u${jdk_version}-linux-x64.tar.gz
    fi

    echo -e "${Info}: 开始安装JDK"
    tar -zxvf jdk-8u${jdk_version}-linux-x64.tar.gz -C $java_Path

    echo -e "${Info}: 配置环境变量"
    echo -e "export JAVA_HOME=$java_Path/$jdk_dirname" >> /etc/profile
    echo -e "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
    echo -e "export PATH=\$PATH:\$JAVA_HOME/bin:" >> /etc/profile

    source /etc/profile
    source /etc/profile
    echo -e "${Info}: 测试是否安装成功"
    java -version
}

uninstall(){
    echo -e "${Info}:开始卸载原有 JDK"
	yum remove -y java-1.8.0-openjdk-headless java-1.8.0-openjdk java-1.8.0-openjdk-devel
	rm -rf $java_Path/jdk1.8.0_${jdk_version}
    rm -rf $soft_path/jdk-8u${jdk_version}-linux-x64.tar.gz
    # 判断是否有需要删除的字符串
    if [ sed -n '/JAVA_HOME/p' /etc/profile ]; then
        sed -i '/JAVA_HOME/d' /etc/profile
        source /etc/profile
    fi
}

install