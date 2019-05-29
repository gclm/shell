#!/bin/bash

#fonts color
Red="\033[31m" 
Font="\033[0m"
Blue="\033[36m"

# 初始化当前环境，安装必要依赖
initialization(){
    echo "${Blue}初始化环境: Development Tools  gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker${Font}"
    yum -y groupinstall 'Development Tools'
    yum -y install gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker 
    echo "${Blue}初始化环境完成${Font}"
}

# 卸载git
uninstall(){
    echo "${Blue}开始卸载卸载git${Font}"
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
    echo "${Blue} git 卸载完成 ${Font}"
}

# 安装 git
install(){
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
    if [[ ${git_version} != "git version 2.9.5" ]]; then
        echo "${Red}Git 安装失败。${Font}"
    else
        rm -rf /opt/soft/git/git-2.9.5
        echo "${Blue} git 安装完成 ${Font}"
    fi
}



