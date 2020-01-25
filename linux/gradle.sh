#!/usr/bin/env bash

# 初始化安装目录
init(){

if [ ! -d "$java_Path" ]; then
    echo -e "正在创建$java_Path目录"
    mkdir -p $java_Path
    echo -e "目录$java_Path创建成功"
fi
}


gradle(){

    init

    echo -e "${Tip}安装Gradle 之前必须安装 JDK"

    gradle_uninstall

    cd $soft_path

    gradle_file=$(ls | grep gradle-*.gz)
    gradle_dirname="gradle-${gradle_version}"

    if [ ! -f "$gradle_file" ]; then
       echo -e "${Info}:正在下载 Gradle 安装包，请稍等..."
       wget -N --no-check-certificate ${coding}/gradle/gradle-${gradle_version}-bin.tar.gz
    fi

    echo -e "${Info}: 开始安装 Gradle "
    tar -zxvf gradle-${gradle_version}-bin.tar.gz -C $java_Path

    echo -e "${Info}:配置环境变量"
    echo -e "export GRADLE_HOME=/usr/local/java/$gradle_dirname" >> /etc/profile
    echo -e "export PATH=\$PATH:\$GRADLE_HOME/bin:" >> /etc/profile
    source /etc/profile

    echo $java_path

    echo -e "${Info}:测试是否安装成功"
    gradle -v
}

gradle_uninstall(){
    echo -e "${Info}:开始卸载原有 maven 组件"
	rm -rf $java_Path/gradle-${maven_version}
    rm -rf $soft_path/gradle-${maven_version}-bin.tar.gz
    sed -i '/GRADLE_HOME/d' /etc/profile
    source /etc/profile
}

gradle