#!/bin/bash

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
maven_path = "$base_path/maven"
gradle_path ="$base_path/gradle"
tomcat_path = "$base_path/tomcat"
nuxus_path = "$base_path/nuxus"
git_path = "$base_path/git"

# 版本
shell_version="1.0.0"
maven_version="3.6.2"
jdk_version="8u221"
tomcat_version="9.0.19"
gradle_version=""
nuxus_version=""
mysql_version=""

# 远程安装包地址
github="https://raw.githubusercontent.com/gclm/shell/master"
coding="https://dev.tencent.com/u/gclm/p/shell/git/raw/master"


#==================基础配置 end =============================


#############系统开发环境组件 start #############

#================== git =============================

# 安装 git
git(){
    echo ""
    uninstall
    mkdir  /opt/dev_soft
    # mkdir -p /opt/soft/git
    cd /opt/dev_soft
	wget https://dev.tencent.com/u/gclm/p/shell/git/raw/master/git/git-2.9.5.tar.gz
	tar zxvf git-2.9.5.tar.gz
	cd git-2.9.5
	./configure --prefix=/usr/local/git
	make && make install
	ln -s /usr/local/git/bin/* /usr/bin/
    echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/profile
    source /etc/profile
    git_version=`git --version`
   
}

# 卸载git
uninstall_git(){
    echo -e "开始卸载卸载git"
	yum remove git
    rm -rf /opt/dev_soft/git-2.9.5
	rm -rf /usr/local/git
	rm -rf /usr/local/git/bin/git
	rm -rf /usr/local/git/bin/git-cvsserver
	rm -rf /usr/local/git/bin/gitk
	rm -rf /usr/local/git/bin/git-receive-pack
	rm -rf /usr/local/git/bin/git-shell
	rm -rf /usr/local/git/bin/git-upload-archive
	rm -rf /usr/local/git/bin/git-upload-pack
    echo "git 卸载完成"
}

#================== jdk =============================

# oracle  jdk install
jdk(){
    # 初始化文件夹
    if [ ! -d "$jdk_Path" ]; then
        echo -e "正在创建$jdk_Path目录"
        sudo mkdir $jdk_Path
        echo -e "目录$jdk_Path创建成功"
    fi

    jdk_file=$(ls | grep jdk-*-linux-*.gz)
    jdk_dirname="jdk1.8.0_201"

    if [ ! -f "$jdk_file" ]; then
    echo -e "正在下载jdk请稍等..."
    wget -N --no-check-certificate https://${coding}/linux/java/jdk-8u221-linux-x64.tar.gz
    fi

    if [ -f "$jdk_file" ]; then

        sudo tar -zxvf $jdk_file -C /usr/local/java/
        echo -e "安装JDK成功"

        echo -e "配置环境变量"
        cp /etc/profile /etc/profile.backup
        echo -e "export JAVA_HOME=$jdk_Path/$jdk_dirname" >> /etc/profile
        echo -e "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
        echo -e "export PATH=\$PATH:\$JAVA_HOME/bin:" >> /etc/profile
        source /etc/profile
        echo -e "配置环境成功"
        jdk_test
    fi
}

# open_jdk 
open_jdk(){
    if [[ "${release}" == "centos" ]]; then
        yum -y install  java-1.8.0-openjdk-headless java-1.8.0-openjdk java-1.8.0-openjdk-devel 
    elif [[ "${release}" = "ubuntu" || "${release}" = "debian" ]];then
        apt-get -y install openjdk-8-jre openjdk-8-jdk
    fi
    jdk_test
}

jdk_test(){
    echo -e "测试是否安装成功"
    java -version
    echo -e "安装成功"
}


#================== maven =============================

# maven install
maven(){
    # 初始化安装目录
    if [ ! -d "$maven_path" ]; then
        echo -e "正在创建$maven_path目录"
        sudo mkdir $maven_path
        echo -e "目录$maven_path创建成功"
    fi

    #apache-maven-3.6
    echo -e "正在下载maven安装包，请稍等..."

    wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://211.162.31.136/files/71480000031E20AE/mirrors.hust.edu.cn/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz"

    maven_file =$(ls | grep apache*maven-*.gz)


    if [ -f "$maven_file" ]; then

        #这个名字其实就是mvn .tar.gz解压之后的文件夹的名字
        mvndirname="apache-maven-3.6.0"

        #不能加 用'zxvf' 加了 z 就创建了包里面的apace* 文件夹，而我们只要把apace*文件夹下的文件全部解压到 maven_path里面就好
        tar zxvf $maven_file -C $maven_path

        echo -e "安装maven成功"
        echo "配置环境变量"

        mv ~/.bashrc ~/.bashrc.backup.mvn
        cat ~/.bashrc.backup.mvn >> ~/.bashrc

        echo -e "PATH=\"$PATH:$maven_path/$mvndirname/bin\"" >> ~/.bashrc
        echo -e "MAVEN_HOME=$maven_path/$mvndirname" >> ~/.bashrc

        source ~/.bashrc

        echo -e "配置环境成功"
        echo -e "测试是否安装成功"
        mvn -v
        echo -e "安装成功"
    else
        echo -e "没有找到maven文件"
    fi
}


#############系统开发环境组件  end #############



#############系统基础组件  start #############

# 采用 root 权限使用该脚本
root(){
   #判断是否是roo用户
   if [ $(id -u) != "0" ]; then
        echo "Error:You must be root to run this script"
   fi
}

# 初始化环境
init(){
    if [[ "${release}" = "centos" ]];then
       init_centos
    elif [[ "${release}" = "ubuntu" || "${release}" = "debian" ]];then
        init_debain_ubuntu
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

#更新脚本
Update_Shell(){
	echo -e "当前版本为 [ ${shell_version} ]，开始检测最新版本..."
	shell_new_version=$(wget --no-check-certificate -qO- "http://${github}/tcp.sh"|grep 'shell_version="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1)
	[[ -z ${shell_new_version} ]] && echo -e "${Error} 检测最新版本失败 !" && start_menu
	if [[ ${shell_new_version} != ${shell_version} ]]; then
		echo -e "发现新版本[ ${shell_new_version} ]，是否更新？[Y/n]"
		read -p "(默认: y):" yn
		[[ -z "${yn}" ]] && yn="y"
		if [[ ${yn} == [Yy] ]]; then
			wget -N --no-check-certificate http://${github}/tcp.sh && chmod +x tcp.sh
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
  
 ${Green_font_prefix}0.${Font_color_suffix} 初始化安装环境  
———————————— 开发环境(Java) ————————————
 ${Green_font_prefix}11.${Font_color_suffix} 安装 Oracle-JDK(v${jdk_version})
 ${Green_font_prefix}12.${Font_color_suffix} 安装 Open-JDK(v1.8.0)
 ${Green_font_prefix}13.${Font_color_suffix} 安装 Maven(v${maven_version})
 ${Green_font_prefix}14.${Font_color_suffix} 安装 Nuxus(v${nuxus_version}) 
 ${Green_font_prefix}15.${Font_color_suffix} 安装 Gradle(v${gradle_version}) 
 ${Green_font_prefix}16.${Font_color_suffix} 安装 MySQL(v${mysql_version})
———————————— 运维环境 —————————————————
 ${Green_font_prefix}21.${Font_color_suffix} 安装 Git
 ${Green_font_prefix}22.${Font_color_suffix} 安装 Jenkins
 ${Green_font_prefix}23.${Font_color_suffix} 安装 Nginx
———————————— 杂项管理 —————————————————
 ${Green_font_prefix}1.${Font_color_suffix} 升级脚本
 ${Green_font_prefix}2.${Font_color_suffix} 退出脚本
——————————————————————————————————————" && echo

echo
read -p " 请输入选项 :" num
case "$num" in
	0)
	init
	;;
    1)
	Update_Shell
	;;
    2)
	exit 1
	;;
	11)
	jdk
	;;
	12)
	open_jdk
	;;
	13)
	check_sys_Lotsever
	;;
	14)
	startbbr
	;;
	15)
	startbbrmod
	;;
	16)
	startbbrmod_nanqinlang
	;;
	21)
	startbbrplus
	;;
	22)
	startlotserver
	;;
	23)
	remove_all
	;;
	*)
	clear
	echo -e "${Error}:请输入正确选项："
	sleep 5s
	start_menu
	;;
esac
}
#############系统基础组件  end #############


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