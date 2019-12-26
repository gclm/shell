#!/usr/bin/env bash


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
jenkins_version=""

# 远程安装包地址
coding="https://dev.tencent.com/u/gclm/p/resources/git/raw/master/"

#==================基础配置 end =============================

install(){

echo -e "${Info}: 开始安装 Jenkins"

cd $soft_path
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
mwget --file=jenkins-2.204.1-1.1.noarch.rpm  ${coding}/jenkins/jenkins-2.204.1-1.1.noarch.rpm
yum localinstall -y jenkins-2.204.1-1.1.noarch.rpm
yum install -y jenkins

}

install

