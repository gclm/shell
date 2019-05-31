#!/bin/bash
Green_font="\033[32m" && Yellow_font="\033[33m" && Red_font="\033[31m" && Font_suffix="\033[0m" && Blue_font="\033[34m" && Purple_font="\033[35m"
Info="${Green_font}[Info]${Font_suffix}"
Error="${Red_font}[Error]${Font_suffix}"
Important_one="${Red_font}[选择前须知:]${Font_suffix}"
Important_two="${Red_font}[温馨提示：面板千万别安装插件，请用脚本安装插件。]${Font_suffix}"
Important_two1="${Red_font}[温馨提示：第三方插件，出问题官方都不负责，我也不负责。]${Font_suffix}"
Important_z="${Purple_font}[雾子工具箱]${Font_suffix}"
Important_c="${Red_font}[帮助：需要其他命令，可以找雾子添加！]${Font_suffix}"
PLUGIN_RETURN="${Yellow_font}从下表选择你要开心的插件:${Font_suffix}"
PLUGIN_RETURC="${Yellow_font}雾子集合宝塔的管理操作命令：${Font_suffix}"
PLUGIN_RETURN1="${Yellow_font}从下表选择你要开心的插件:${Font_suffix}"
Thank="${Blue_font}感谢使用书记的脚本!!${Font_suffix}"
Byebye="${Red_font}感谢使用书记的脚本!!!\n更多内容请关注 → Loli分享论坛：www.moecat.cn 雾子の博客（原：樱花博客）：www.kiriko.org ！${Font_suffix}"
PANEL_DIR=/www/server/panel
install_tmp='/tmp/bt_install.pl'
pluginPath=/www/server/panel/plugin/baidu
pluginPath1=/www/server/panel/plugin/webshell
pluginPath2=/www/server/panel/plugin/diskquota
pluginPath3=/www/server/panel/plugin/domains
pluginPath4=/www/server/panel/plugin/btco
pluginPath5=/www/server/panel/plugin/disk
pluginPath6=/www/server/panel/plugin/w7assistant
pluginPath7=/www/server/panel/plugin/qiankeji
pluginPath8=/www/server/panel/plugin/openfogos
umaru_Url=https://umaru.uk
MAIN_RETURN=${Red_font}[宝塔面板Bt_Kiriko_Suki开心脚本]${Font_suffix}
MAIN_RETURN1="${Yellow_font}13.插件单独选择安装完毕，下一步第三方插件安装操作${Font_suffix}"
MAIN_RETURN2="${Yellow_font}9.第三方插件单独选择安装完毕，获取面板信息操作${Font_suffix}"
over="${Green_font}感谢使用书记的脚本!!\n该版本下次在写，本次通宵终于填完坑了！${Font_suffix}"
scfy="${Yellow_font}请到论坛获取该脚本相关信息：https://moecat.cn/thread-1037-1-1.html${Font_suffix}"
MAIN_RETURNC="${Yellow_font}公告：网站防CC 宝塔对接云锁 部署脚本 详细查看 → 请执行命令 a${Font_suffix}"
MAIN_RETURND="${Yellow_font}公告：关于对作者 雾子（原叫：书记、樱花、小埋）了解 → 请执行命令 b ${Font_suffix}"
MAIN_RETURNPP="${Blue_font}[全新安装宝塔]${Font_suffix}"
MAIN_RETURNPR="${Blue_font}[全新安装宝塔/已安装宝塔]${Font_suffix}"
MAIN_RETURNPT="${Blue_font}[宝塔面板6X/宝塔面板5X]${Font_suffix}"
MAIN_RETURNPA="${Yellow_font}Warning:\nIf you cannot access the panel,\nrelease the following port (8888|888|80|443|20|21) in the security group${Font_suffix}"
Beta="${Red_font}[宝塔 6.9.19 Beta]${Font_suffix}"
fuli="${Purple_font}[OLD]${Font_suffix}"
gonggao1="${Yellow_font}公告：欢迎大家到 Loli分享论坛：moecat.cn 发帖交流 论坛很需要大家带动起来~${Font_suffix}"
gongjuxiang="${Purple_font}11.雾子工具箱${Font_suffix}"

# 宝塔 5.9.1 判断是否安装宝塔
Bt_Umaru_Pro_5.9.1_p(){
clear
read -p "已经安装宝塔 请选择1 ，未安装宝塔 请选择2 ，返回主目录 请选择3:" dp_o
while [[ ! "${dp_o}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" dp_o
	done
if [[ "${dp_o}" == "1" ]]; then
	Bt_Umaru_Pro_5.9.1_y
elif [[ "${dp_o}" == "2" ]]; then
    Bt_Umaru_Pro_5.9.1
elif [[ "${dp_o}" == "3" ]]; then
    main
else
	clear
	exit 1
fi	

}

# 宝塔 5.9.1 已安装宝塔版
Bt_Umaru_Pro_5.9.1_y(){
# 就这么简单呀~   
    wget -O update.sh $umaru_Url/install/update_pro.sh && bash update.sh pro
	rm -rf update.sh
	main
}


# 宝塔 5.9.1 未安装宝塔版
Bt_Umaru_Pro_5.9.1(){
clear

	while [ "$yes" != 'y' ] && [ "$yes" != 'n' ]
	do
		read -p "输入yes进行安装/输入no进行取消安装(y/n): " yes;
	done 
	
	if [ "$yes" == 'y' ]; then
		Bt_Umaru_Pro_5.9.1_centos
	elif [ "$yes" == 'n' ]; then
	    cd /
	else
	    clear
		exit 1
	fi

}

# 宝塔 5.9.1 安装 centos面板
Bt_Umaru_Pro_5.9.1_centos(){
    yum install -y wget && wget -O install.sh $umaru_Url/install/5.9.1/install.sh && bash install.sh
    rm -rf install.sh
    main
}

# 宝塔 6.8.9 未安装宝塔版
Bt_Umaru_Pro_6.8.9(){
clear

	while [ "$yes" != 'y' ] && [ "$yes" != 'n' ]
	do
		read -p "输入yes进行安装/输入no进行取消安装(y/n): " yes;
	done 
	
	if [ "$yes" == 'y' ]; then
		Bt_Umaru_Pro_6.8.9_centos
	elif [ "$yes" == 'n' ]; then
        cd /
	else
	    clear
		exit 1
	fi	

}

# 宝塔 6.8.9 安装 centos面板
Bt_Umaru_Pro_6.8.9_centos(){
    yum install -y wget && wget -O install.sh $umaru_Url/install/6.8.9/install_6.0.sh && bash install.sh
    rm -rf install.sh
    main
}

# 宝塔 6.9.0 未安装宝塔版
Bt_Umaru_Pro_6.9.0(){
clear

	while [ "$yes" != 'y' ] && [ "$yes" != 'n' ]
	do
		read -p "输入yes进行安装/输入no进行取消安装(y/n): " yes;
	done 
	
	if [ "$yes" == 'y' ]; then
		Bt_Umaru_Pro_6.9.0_centos
	elif [ "$yes" == 'n' ]; then
        cd /
	else
	    clear
		exit 1
	fi	

}

# 宝塔 6.9.0 安装 centos面板
    Bt_Umaru_Pro_6.9.0_centos(){
    yum install -y wget && wget -O install.sh $umaru_Url/install/6.9.0/install_6.0.sh && bash install.sh
    rm -rf install.sh
    main
}

# 宝塔 6.9.1 未安装宝塔版
Bt_Umaru_Pro_6.9.1(){
clear

	while [ "$yes" != 'y' ] && [ "$yes" != 'n' ]
	do
		read -p "输入yes进行安装/输入no进行取消安装(y/n): " yes;
	done 
	
	if [ "$yes" == 'y' ]; then
		Bt_Umaru_Pro_6.9.1_centos
	elif [ "$yes" == 'n' ]; then
        cd /
	else
	    clear
		exit 1
	fi	

}

# 宝塔 6.9.1 安装 centos面板
Bt_Umaru_Pro_6.9.1_centos(){
    yum install -y wget && wget -O install.sh $umaru_Url/install/6.9.1/install_6.0.sh && bash install.sh
    rm -rf install.sh
    main
}

# 宝塔 6.9.2 未安装宝塔版
Bt_Umaru_Pro_6.9.2(){
clear

	while [ "$yes" != 'y' ] && [ "$yes" != 'n' ]
	do
		read -p "输入yes进行安装/输入no进行取消安装(y/n): " yes;
	done 
	
	if [ "$yes" == 'y' ]; then
		Bt_Umaru_Pro_6.9.2_centos
	elif [ "$yes" == 'n' ]; then
        cd /
	else
	    clear
		exit 1
	fi	

}

# 宝塔 6.9.2 安装 centos面板
    Bt_Umaru_Pro_6.9.2_centos(){
    yum install -y wget && wget -O install.sh $umaru_Url/install/6.9.2/install_6.0.sh && bash install.sh
    rm -rf install.sh
    main
}

# 宝塔 6.9.3 未安装宝塔版
Bt_Umaru_Pro_6.9.3(){
clear

	while [ "$yes" != 'y' ] && [ "$yes" != 'n' ]
	do
		read -p "输入yes进行安装/输入no进行取消安装(y/n): " yes;
	done 
	
	if [ "$yes" == 'y' ]; then
		Bt_Umaru_Pro_6.9.3_centos
	elif [ "$yes" == 'n' ]; then
	    cd /
	else
	    clear
		exit 1
	fi

}

# 宝塔 6.9.3 安装 centos面板
Bt_Umaru_Pro_6.9.3_centos(){
    yum install -y wget && wget -O install.sh $umaru_Url/install/6.9.3/install_6.0.sh && bash install.sh
    rm -rf install.sh
    main
}

# 宝塔 6.9.4 判断是否安装宝塔
Bt_Umaru_Pro_6.9.4_p(){
clear
read -p "已经安装宝塔 请选择1 ，未安装宝塔 请选择2 ，返回主目录 请选择3:" dp_i
while [[ ! "${dp_i}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" dp_i
	done
if [[ "${dp_i}" == "1" ]]; then
	Bt_Umaru_Pro_6.9.4_y
elif [[ "${dp_i}" == "2" ]]; then
    Bt_Umaru_Pro_6.9.4
elif [[ "${dp_i}" == "3" ]]; then
    main
else
	clear
	exit 1
fi	

}

# 宝塔 6.9.4 已安装宝塔版
Bt_Umaru_Pro_6.9.4_y(){
# rm 掉以前安装过宝塔面板遗留的远程文件~
    rm -rf /www/server/panel/BTPanel/templates/default/index.html
	rm -rf /www/server/panel/BTPanel/static/js/soft.js
	rm -rf /www/server/panel/BTPanel/__init__.py
    rm -rf /www/server/panel/class/panelPlugin.py
	rm -rf /www/server/panel/class/panelPlugin.pyc
	rm -rf /www/server/panel/class/ajax.py
	rm -rf /www/server/panel/class/public.py
	rm -rf /www/server/panel/class/plugin2.so
	rm -rf /www/server/panel/class/plugin3.so

# 创建下载我破解好的文件啦~
    mkdir /root/Bt_Umaru_Pro
	cd /root/Bt_Umaru_Pro
	wget -N --no-check-certificate ${umaru_Url}/Bt_Umaru_Pro.zip
	unzip -o Bt_Umaru_Pro.zip > /dev/null	
	
# 进行cp所需要的文件啦~
    cp -pf /root/Bt_Umaru_Pro/__init__.py ${PANEL_DIR}/BTPanel/__init__.py
	cp -pf /root/Bt_Umaru_Pro/panelPlugin.py ${PANEL_DIR}/class/panelPlugin.py
	cp -pf /root/Bt_Umaru_Pro/ajax.py ${PANEL_DIR}/class/ajax.py
	cp -pf /root/Bt_Umaru_Pro/public.py ${PANEL_DIR}/class/public.py
    cp -pf /root/Bt_Umaru_Pro/soft.js ${PANEL_DIR}/BTPanel/static/js/soft.js
	cp -pf /root/Bt_Umaru_Pro/index.html ${PANEL_DIR}/BTPanel/templates/default/index.html	

# 开心完成啦~	
	rm -rf /root/Bt_Umaru_Pro
	/etc/init.d/bt restart
	echo -e "${Info} 成功升级专业版!"
	main
}

# 宝塔 6.9.4 未安装宝塔版
Bt_Umaru_Pro_6.9.4(){
clear

	while [ "$yes" != 'y' ] && [ "$yes" != 'n' ]
	do
		read -p "输入yes进行安装/输入no进行取消安装(y/n): " yes;
	done 
	
	if [ "$yes" == 'y' ]; then
		Bt_Umaru_Pro_6.9.4_centos
	elif [ "$yes" == 'n' ]; then
	    cd /
	else
	    clear
		exit 1
	fi

}

# 宝塔 6.9.4 安装 centos面板
    Bt_Umaru_Pro_6.9.4_centos(){
    yum install -y wget && wget -O install.sh $umaru_Url/install/install_6.0.sh && bash install.sh
    rm -rf install.sh
    main
}

# 是否继续执行安装插件
Bt_Umaru_Pro_install(){
clear
read -p "安装插件 请选择1 ，不安装插件 请选择2:" ist
while [[ ! "${ist}" =~ ^[1-2]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" ist
	done
if [[ "${ist}" == "1" ]]; then
	Bt_Umaru_Pro_plugin_jx
elif [[ "${ist}" == "2" ]]; then
    Bt_Umaru_Pro_install_shop
else
	clear
	exit 1
fi
	
}

# 宝塔插件开心
Bt_Umaru_Pro_plugin(){
clear
read -p "一键开心所有付费插件 请选择1 ，单独开心付费插件 请选择2 ，返回主目录 请选择3:" pl
while [[ ! "${pl}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" pl
	done
if [[ "${pl}" == "1" ]]; then
	plugin_all
elif [[ "${pl}" == "2" ]]; then
    plugin_a
elif [[ "${pl}" == "3" ]]; then
    main
else
	clear
	exit 1
fi	

}

# 一键开心所有付费插件
plugin_all(){
clear
read -p "Nginx环境 请选择1 ，Apache环境 请选择2:" plan
while [[ ! "${plan}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" plan
	done
if [[ "${plan}" == "1" ]]; then
	plugin_all_n
elif [[ "${plan}" == "2" ]]; then
    plugin_all_a
else
	clear
	exit 1
fi	
}

plugin_all_n(){
# 网页防篡改程序
	wget -O install.sh $umaru_Url/install/plugin/tamper_proof/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 宝塔系统加固
	wget -O install.sh $umaru_Url/install/plugin/syssafe/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 网站监控报表
	wget -O install.sh $umaru_Url/install/plugin/total/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# Nginx防火墙
	wget -O install.sh $umaru_Url/install/plugin/btwaf/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 宝塔负载均衡
	wget -O install.sh $umaru_Url/install/plugin/load_leveling/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# MYSQL主从复制
	wget -O install.sh $umaru_Url/install/plugin/masterslave/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 宝塔任务管理器
	wget -O install.sh $umaru_Url/install/plugin/task_manager/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 微信小程序
	wget -O install.sh $umaru_Url/install/plugin/app/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 异常监控推送
	wget -O install.sh $umaru_Url/install/plugin/msg_push/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 数据同步工具
	wget -O install.sh $umaru_Url/install/plugin/rsync/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 宝塔安全登录
	wget -O install.sh $umaru_Url/install/plugin/safelogin/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	
	main
}

plugin_all_a(){
# 网页防篡改程序
	wget -O install.sh $umaru_Url/install/plugin/tamper_proof/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 宝塔系统加固
	wget -O install.sh $umaru_Url/install/plugin/syssafe/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 网站监控报表
	wget -O install.sh $umaru_Url/install/plugin/total/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# Apache防火墙
	wget -O install.sh $umaru_Url/install/plugin/btwaf_httpd/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 宝塔负载均衡
	wget -O install.sh $umaru_Url/install/plugin/load_leveling/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# MYSQL主从复制
	wget -O install.sh $umaru_Url/install/plugin/masterslave/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 宝塔任务管理器
	wget -O install.sh $umaru_Url/install/plugin/task_manager/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 微信小程序
	wget -O install.sh $umaru_Url/install/plugin/app/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 异常监控推送
	wget -O install.sh $umaru_Url/install/plugin/msg_push/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 数据同步工具
	wget -O install.sh $umaru_Url/install/plugin/rsync/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh

# 宝塔安全登录
	wget -O install.sh $umaru_Url/install/plugin/safelogin/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	
	main
}

# 单独开心付费插件
plugin_a(){
clear
echo -e "${White_font}
#====================================================
# ${Important_one} 
# ${Important_two} 
#====================================================
# ${PLUGIN_RETURN}
#====================================================
#          1.网页防篡改程序 2.4 ${fuli}
#          2.宝塔系统加固 2.2
#          3.网站监控报表 2.7
#          4.Apache防火墙 6.3 ${fuli}
#          5.Nginx防火墙 6.9.9 ${fuli}
#          6.宝塔负载均衡 1.5
#          7.MYSQL主从复制 2.1
#          8.宝塔任务管理器 1.3
#          9.微信小程序 1.8
#          10.异常监控推送 1.5
#          11.数据同步工具 2.3
#          12.宝塔安全登录 1.3
#          13.返回主菜单
#====================================================
${Font_suffix}"
read -p "输入数字以选择:" plg

if [[ "${plg}" == "1" ]]; then
	tamper_proof
elif [[ "${plg}" == "2" ]]; then
	syssafe
elif [[ "${plg}" == "3" ]]; then
	total
elif [[ "${plg}" == "4" ]]; then
	btwaf_httpd
elif [[ "${plg}" == "5" ]]; then
	btwaf
elif [[ "${plg}" == "6" ]]; then
	load_leveling
elif [[ "${plg}" == "7" ]]; then
	masterslave
elif [[ "${plg}" == "8" ]]; then
	task_manager
elif [[ "${plg}" == "9" ]]; then
	app
elif [[ "${plg}" == "10" ]]; then
	msg_push
elif [[ "${plg}" == "11" ]]; then
	rsync
elif [[ "${plg}" == "12" ]]; then
	safelogin
elif [[ "${plg}" == "13" ]]; then
	main
fi	
}

# 网页防篡改程序
tamper_proof(){
	wget -O install.sh $umaru_Url/install/plugin/tamper_proof/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# 宝塔系统加固
syssafe(){
	wget -O install.sh $umaru_Url/install/plugin/syssafe/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# 网站监控报表
total(){
	wget -O install.sh $umaru_Url/install/plugin/total/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# Apache防火墙
btwaf_httpd(){
	wget -O install.sh $umaru_Url/install/plugin/btwaf_httpd/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# Nginx防火墙
btwaf(){
	wget -O install.sh $umaru_Url/install/plugin/btwaf/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}


# 宝塔负载均衡
load_leveling(){
	wget -O install.sh $umaru_Url/install/plugin/load_leveling/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}


# MYSQL主从复制
masterslave(){
	wget -O install.sh $umaru_Url/install/plugin/masterslave/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# 宝塔任务管理器
task_manager(){
	wget -O install.sh $umaru_Url/install/plugin/task_manager/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# 微信小程序
app(){
	wget -O install.sh $umaru_Url/install/plugin/app/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# 异常监控推送
msg_push(){
	wget -O install.sh $umaru_Url/install/plugin/msg_push/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# 数据同步工具
rsync(){
	wget -O install.sh $umaru_Url/install/plugin/rsync/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# 宝塔安全登录
safelogin(){
	wget -O install.sh $umaru_Url/install/plugin/safelogin/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	plugin_a
}

# 是否继续执行安装第三方插件
Bt_Umaru_Pro_install_shop(){
clear
read -p "安装第三方插件 请选择1 ，不安装第三方插件 请选择2:" ists
while [[ ! "${ists}" =~ ^[1-2]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" ists
	done
if [[ "${ists}" == "1" ]]; then
	Bt_Umaru_Pro_plugin_shop_jx
elif [[ "${ists}" == "2" ]]; then
    /etc/init.d/bt default
    main
else
	clear
	exit 1
fi
	
}

# 宝塔第三方插件开心
Bt_Umaru_Pro_plugin_shop(){
clear
read -p "一键开心所有付费第三方插件 请选择1 ，单独开心付费第三方插件 请选择2 ，返回主目录 请选择3:" plshop
while [[ ! "${plshop}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" plshop
	done
if [[ "${plshop}" == "1" ]]; then
	plugin_all_shop
elif [[ "${plshop}" == "2" ]]; then
    plugin_a_shop
elif [[ "${plshop}" == "3" ]]; then
    main
else
	clear
	exit 1
fi	

}

# 一键开心所有付费第三方插件
plugin_all_shop(){

# SSH秘钥管理器
	wget -O install.sh $umaru_Url/install/plugin/sshkey/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	\cp -a -r /www/server/panel/plugin/sshkey/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-sshkey.png

# 对象存储挂载工具(OSS/COS)
	wget -O install.sh $umaru_Url/install/plugin/ossfs/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	\cp -a -r /www/server/panel/plugin/ossfs/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-ossfs.png

# 百度提交
	mkdir -p $pluginPath
	echo '正在安装脚本文件...' > $install_tmp
	wget -O $pluginPath/baidu_main.py $umaru_Url/install/plugin/baidu/baidu_main.py -T 5
	wget -O $pluginPath/index.html $umaru_Url/install/plugin/baidu/index.html -T 5
	wget -O $pluginPath/info.json $umaru_Url/install/plugin/baidu/info.json -T 5
	wget -O $pluginPath/icon.png $umaru_Url/install/plugin/baidu/icon.png -T 5
	\cp -a -r /www/server/panel/plugin/baidu/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-baidu.png
	echo '安装完成' > $install_tmp

# 文件共享管理器
	wget -O install.sh $umaru_Url/install/plugin/nfsserver/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	\cp -a -r /www/server/panel/plugin/nfsserver/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-nfsserver.png

# 站点磁盘配额管理
	mkdir -p $pluginPath2
	echo '正在安装脚本文件...' > $install_tmp
	wget -O $pluginPath2/diskquota_main.py $umaru_Url/install/plugin/diskquota/diskquota_main.py -T 5
	wget -O $pluginPath2/index.html $umaru_Url/install/plugin/diskquota/index.html -T 5
	wget -O $pluginPath2/info.json $umaru_Url/install/plugin/diskquota/info.json -T 5
	wget -O $pluginPath2/icon.png $umaru_Url/install/plugin/diskquota/icon.png -T 5
	wget -O $pluginPath2/conf.json $umaru_Url/install/plugin/diskquota/conf.json -T 5
	\cp -a -r /www/server/panel/plugin/diskquota/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-diskquota.png
	echo '安装完成' > $install_tmp

# 磁盘挂载工具
	mkdir -p $pluginPath5
	echo '正在安装脚本文件...' > $install_tmp
	wget -O install.sh $umaru_Url/install/plugin/disk/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	wget -O $pluginPath5/disk_main.py $umaru_Url/install/plugin/disk/disk_main.py -T 5
	wget -O $pluginPath5/index.html $umaru_Url/install/plugin/disk/index.html -T 5
	wget -O $pluginPath5/info.json $umaru_Url/install/plugin/disk/info.json -T 5
	wget -O $pluginPath5/icon.png $umaru_Url/install/plugin/disk/icon.png -T 5
	wget -O $pluginPath5/ing.gif $umaru_Url/install/plugin/disk/ing.gif -T 5
	\cp -a -r /www/server/panel/plugin/disk/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-disk.png
	\cp -a -r /www/server/panel/plugin/disk/ing.gif /www/server/panel/BTPanel/static/img/ing.gif
	echo '安装完成' > $install_tmp

# 简易木马扫描
	mkdir -p $pluginPath1
	echo '正在安装脚本文件...' > $install_tmp
	wget -O $pluginPath1/webshell_main.py $umaru_Url/install/plugin/webshell/webshell_main.py -T 5
	wget -O $pluginPath1/index.html $umaru_Url/install/plugin/webshell/index.html -T 5
	wget -O $pluginPath1/rule.json$umaru_Url/install/plugin/webshell/rule.json -T 5
	wget -O $pluginPath1/icon.png $umaru_Url/install/plugin/webshell/icon.png -T 5
	wget -O $pluginPath1/info.json $umaru_Url/install/plugin/webshell/info.json -T 5
	\cp -a -r /www/server/panel/plugin/webshell/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-webshell.png
	echo '安装完成' > $install_tmp

# 域名解析助手
    mkdir -p $pluginPath3
	wget -O install.sh $umaru_Url/install/plugin/domains/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	wget -O $pluginPath3/domains.zip $umaru_Url/install/plugin/domains/domains.zip -T 5
	unzip -o $pluginPath3/domains.zip -d $pluginPath3 > /dev/null
	rm -rf $pluginPath3/domains.zip
	\cp -a -r /www/server/panel/plugin/domains/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-domains.png

# BTCO
    mkdir -p $pluginPath4
	wget -O $pluginPath4/btco.zip $umaru_Url/install/plugin/btco/btco.zip -T 5
	unzip -o $pluginPath4/btco.zip -d $pluginPath4 > /dev/null
	rm -rf $pluginPath4/btco.zip
	\cp -a -r /www/server/panel/plugin/btco/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-btco.png
	
# 微擎助手
    mkdir -p $pluginPath6
	wget -O install.sh $umaru_Url/install/plugin/w7assistant/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	wget -O $pluginPath6/w7assistant.zip $umaru_Url/install/plugin/w7assistant/w7assistant.zip -T 5
	unzip -o $pluginPath6/w7assistant.zip -d $pluginPath6 > /dev/null
	rm -rf $pluginPath6/w7assistant.zip
	\cp -a -r /www/server/panel/plugin/w7assistant/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-w7assistant.png

# 钟馗风控薅羊毛手机号识别
    mkdir -p $pluginPath7
	wget -O install.sh $umaru_Url/install/plugin/qiankeji/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	wget -O $pluginPath7/qiankeji.zip $umaru_Url/install/plugin/qiankeji/qiankeji.zip -T 5
	unzip -o $pluginPath7/qiankeji.zip -d $pluginPath7 > /dev/null
	rm -rf $pluginPath7/qiankeji.zip
	\cp -a -r /www/server/panel/plugin/qiankeji/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-qiankeji.png

# OpenFogOS
	mkdir -p $pluginPath8
	wget -O openfog_installer.sh $umaru_Url/install/plugin/openfogos/openfog_installer.sh && chmod 755 openfog_installer.sh && bash openfog_installer.sh
	wget -O install.sh $umaru_Url/install/plugin/openfogos/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	rm -rf openfog_installer.sh
	\cp -a -r /www/server/panel/plugin/openfogos/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-openfogos.png
	
	main
}

# 单独开心付费第三方插件
plugin_a_shop(){
clear
echo -e "${White_font}
#====================================================
# ${Important_one} 
# ${Important_two1} 
#====================================================
# ${PLUGIN_RETURN1}
#====================================================
#          1.SSH秘钥管理器 1.1
#          2.对象存储挂载工具(OSS/COS) 1.3
#          3.百度提交
#          4.文件共享管理器 1.2
#          5.站点磁盘配额管理 1.0
#          6.磁盘挂载工具 1.7
#          7.简易木马扫描 1.1
#          8.域名解析助手 3.2
#          9.BTCO 1.0
#          10.微擎助手 2.0
#          11.钟馗风控薅羊毛手机号识别 1.0
#          12.OpenFogOS 1.1
#          13.返回主菜单
#====================================================
${Font_suffix}"
read -p "输入数字以选择:" shop

if [[ "${shop}" == "1" ]]; then
	sshkey
elif [[ "${shop}" == "2" ]]; then
	ossfs
elif [[ "${shop}" == "3" ]]; then
	baidu
elif [[ "${shop}" == "4" ]]; then
	nfsserver
elif [[ "${shop}" == "5" ]]; then
	diskquota
elif [[ "${shop}" == "6" ]]; then
	disk
elif [[ "${shop}" == "7" ]]; then
	webshell
elif [[ "${shop}" == "8" ]]; then
	domains
elif [[ "${shop}" == "9" ]]; then
	btco
elif [[ "${shop}" == "10" ]]; then
    w7assistant
elif [[ "${shop}" == "11" ]]; then
	qiankeji
elif [[ "${shop}" == "12" ]]; then
	OpenFogOS
elif [[ "${shop}" == "13" ]]; then
	main
fi	

}

# SSH秘钥管理器
sshkey(){
	wget -O install.sh $umaru_Url/install/plugin/sshkey/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	\cp -a -r /www/server/panel/plugin/sshkey/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-sshkey.png
	plugin_a_shop
}

# 对象存储挂载工具(OSS/COS)
ossfs(){
	wget -O install.sh $umaru_Url/install/plugin/ossfs/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	\cp -a -r /www/server/panel/plugin/ossfs/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-ossfs.png
	plugin_a_shop
}

# 百度提交
baidu(){
	mkdir -p $pluginPath
	echo '正在安装脚本文件...' > $install_tmp
	wget -O $pluginPath/baidu_main.py $umaru_Url/install/plugin/baidu/baidu_main.py -T 5
	wget -O $pluginPath/index.html $umaru_Url/install/plugin/baidu/index.html -T 5
	wget -O $pluginPath/info.json $umaru_Url/install/plugin/baidu/info.json -T 5
	wget -O $pluginPath/icon.png $umaru_Url/install/plugin/baidu/icon.png -T 5
	\cp -a -r /www/server/panel/plugin/baidu/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-baidu.png
	echo '安装完成' > $install_tmp
	plugin_a_shop
}

# 文件共享管理器
nfsserver(){
	wget -O install.sh $umaru_Url/install/plugin/nfsserver/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	\cp -a -r /www/server/panel/plugin/nfsserver/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-nfsserver.png
	plugin_a_shop
}

# 站点磁盘配额管理
diskquota(){
	mkdir -p $pluginPath2
	echo '正在安装脚本文件...' > $install_tmp
	wget -O $pluginPath2/diskquota_main.py $umaru_Url/install/plugin/diskquota/diskquota_main.py -T 5
	wget -O $pluginPath2/index.html $umaru_Url/install/plugin/diskquota/index.html -T 5
	wget -O $pluginPath2/info.json $umaru_Url/install/plugin/diskquota/info.json -T 5
	wget -O $pluginPath2/icon.png $umaru_Url/install/plugin/diskquota/icon.png -T 5
	wget -O $pluginPath2/conf.json $umaru_Url/install/plugin/diskquota/conf.json -T 5
	\cp -a -r /www/server/panel/plugin/diskquota/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-diskquota.png
	echo '安装完成' > $install_tmp
	plugin_a_shop
}

# 磁盘挂载工具
disk(){
	mkdir -p $pluginPath5
	echo '正在安装脚本文件...' > $install_tmp
	wget -O install.sh $umaru_Url/install/plugin/disk/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	wget -O $pluginPath5/disk_main.py $umaru_Url/install/plugin/disk/disk_main.py -T 5
	wget -O $pluginPath5/index.html $umaru_Url/install/plugin/disk/index.html -T 5
	wget -O $pluginPath5/info.json $umaru_Url/install/plugin/disk/info.json -T 5
	wget -O $pluginPath5/icon.png $umaru_Url/install/plugin/disk/icon.png -T 5
	wget -O $pluginPath5/ing.gif $umaru_Url/install/plugin/disk/ing.gif -T 5
	\cp -a -r /www/server/panel/plugin/disk/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-disk.png
	\cp -a -r /www/server/panel/plugin/disk/ing.gif /www/server/panel/BTPanel/static/img/ing.gif
	echo '安装完成' > $install_tmp
	plugin_a_shop
}

# 简易木马扫描
webshell(){
	mkdir -p $pluginPath1
	echo '正在安装脚本文件...' > $install_tmp
	wget -O $pluginPath1/webshell_main.py $umaru_Url/install/plugin/webshell/webshell_main.py -T 5
	wget -O $pluginPath1/index.html $umaru_Url/install/plugin/webshell/index.html -T 5
	wget -O $pluginPath1/rule.json$umaru_Url/install/plugin/webshell/rule.json -T 5
	wget -O $pluginPath1/icon.png $umaru_Url/install/plugin/webshell/icon.png -T 5
	wget -O $pluginPath1/info.json $umaru_Url/install/plugin/webshell/info.json -T 5
	\cp -a -r /www/server/panel/plugin/webshell/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-webshell.png
	echo '安装完成' > $install_tmp
	plugin_a_shop
}

# 域名解析助手
domains(){
    mkdir -p $pluginPath3
	wget -O install.sh $umaru_Url/install/plugin/domains/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	wget -O $pluginPath3/domains.zip $umaru_Url/install/plugin/domains/domains.zip -T 5
	unzip -o $pluginPath3/domains.zip -d $pluginPath3 > /dev/null
	rm -rf $pluginPath3/domains.zip
	\cp -a -r /www/server/panel/plugin/domains/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-domains.png
	plugin_a_shop
}

# BTCO
btco(){
    mkdir -p $pluginPath4
	wget -O $pluginPath4/btco.zip $umaru_Url/install/plugin/btco/btco.zip -T 5
	unzip -o $pluginPath4/btco.zip -d $pluginPath4 > /dev/null
	rm -rf $pluginPath4/btco.zip
	\cp -a -r /www/server/panel/plugin/btco/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-btco.png
	plugin_a_shop
}

# 微擎助手
w7assistant(){
    mkdir -p $pluginPath6
	wget -O install.sh $umaru_Url/install/plugin/w7assistant/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	wget -O $pluginPath6/w7assistant.zip $umaru_Url/install/plugin/w7assistant/w7assistant.zip -T 5
	unzip -o $pluginPath6/w7assistant.zip -d $pluginPath6 > /dev/null
	rm -rf $pluginPath6/w7assistant.zip
	\cp -a -r /www/server/panel/plugin/w7assistant/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-w7assistant.png
	plugin_a_shop
}

# 钟馗风控薅羊毛手机号识别
qiankeji(){
    mkdir -p $pluginPath7
	wget -O install.sh $umaru_Url/install/plugin/qiankeji/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	wget -O $pluginPath7/qiankeji.zip $umaru_Url/install/plugin/qiankeji/qiankeji.zip -T 5
	unzip -o $pluginPath7/qiankeji.zip -d $pluginPath7 > /dev/null
	rm -rf $pluginPath7/qiankeji.zip
	\cp -a -r /www/server/panel/plugin/qiankeji/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-qiankeji.png
	plugin_a_shop
}

# OpenFogOS
OpenFogOS(){
	mkdir -p $pluginPath8
	wget -O openfog_installer.sh $umaru_Url/install/plugin/openfogos/openfog_installer.sh && chmod 755 openfog_installer.sh && bash openfog_installer.sh
	wget -O install.sh $umaru_Url/install/plugin/openfogos/install.sh && chmod 755 install.sh && bash install.sh install
	rm -rf install.sh
	rm -rf openfog_installer.sh
	\cp -a -r /www/server/panel/plugin/openfogos/icon.png /www/server/panel/BTPanel/static/img/soft_ico/ico-openfogos.png
	plugin_a_shop
}

# 退出脚本
delete(){
    clear
    echo -e "${Byebye}"
    rm -rf Bt_Kiriko_Suki.sh
}

# 0
a(){
clear
echo -e "${Green_font}雾子 是小姐姐你造麻？！！！${Font_suffix}"

read -p "我造 选择1，不造 选择2:" a1

while [[ ! "${a1}" =~ ^[0-2]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" a1
	done
if [[ "${a1}" == "1" ]]; then
	c
elif [[ "${a1}" == "2" ]]; then
    b
else
	clear
	exit 1
fi	
}

# 1
b(){
clear
echo -e "${Green_font}哼！我生气了，生起起来的我，后果很严重！${Font_suffix}"

read -p "我才没错 选择1，我错了 求原谅 选择2:" b1

while [[ ! "${b1}" =~ ^[0-2]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" b1
	done
if [[ "${b1}" == "1" ]]; then
	d
elif [[ "${b1}" == "2" ]]; then
    c
else
	clear
	exit 1
fi
}

# 2
c(){
clear
echo -e "${Purple_font}哼哼，看你不听我话！\n${Font_suffix}"
echo -e "${Purple_font}雾子的网站有：\nLoli分享论坛：www.moecat.cn\n雾子の博客：www.kiriko.org\n\n雾子生活：\n无工作自由爱好者~\n整天混吃混合等死~\n\n雾子愿望：\n雾子 求主人领养！！！\n雾子已经养不活自己了~\n一日管雾子三餐就好~\n雾子会做家务 会服侍主人~\n\n雾子的福利：\nhttps://umaru.uk/img/umaru1.jpg\nhttps://umaru.uk/img/umaru2.jpg\nhttps://umaru.uk/img/umaru3.jpg\nhttps://umaru.uk/img/umaru4.jpg\nhttps://umaru.uk/img/umaru5.jpg\nhttps://umaru.uk/img/umaru6.jpg\nhttps://umaru.uk/img/umaru7.jpg\nhttps://umaru.uk/img/umaru8.jpg\nhttps://umaru.uk/img/umaru9.jpg\nhttps://umaru.uk/img/umaru10.jpg\nhttps://umaru.uk/img/umaru11.jpg\nhttps://umaru.uk/img/umaru12.jpg\nhttps://umaru.uk/img/umaru13.jpg\nhttps://umaru.uk/img/umaru14.jpg\nhttps://umaru.uk/img/umaru15.jpg\n\n卖个萌而已，2333 大家别打我！！！(*╹▽╹*)\n${Font_suffix}"
}

# 3
d(){
echo -e "${Green_font}恭喜你！我已经生气到极点了！${Font_suffix}"

read -p "你去死吧！ 选择1，知错就改！ 选择2:" d1

while [[ ! "${d1}" =~ ^[0-2]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" d1
	done
if [[ "${d1}" == "1" ]]; then
	b
elif [[ "${d1}" == "2" ]]; then
    c
else
	clear
	exit 1
fi
}

# 正版用户第三方插件选择
py(){
clear

read -p "正版用户 选择1 ，开心版用户 选择2:" py1

while [[ ! "${py1}" =~ ^[0-2]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" py1
	done
if [[ "${py1}" == "1" ]]; then
	pyc
elif [[ "${py1}" == "2" ]]; then
    Bt_Umaru_Pro_plugin_shop
else
	clear
	exit 1
fi
}

# 正版用户开心第三方插件
pyc(){
    rm -rf /www/server/panel/class/panelPlugin.py
	rm -rf /www/server/panel/class/panelPlugin.pyc
	rm -rf /www/server/panel/class/plugin2.so
	rm -rf /www/server/panel/class/plugin3.so
	cd /www/server/panel/class
	wget -O panelPlugin.py ${umaru_Url}/install/panelPlugin.py
	/etc/init.d/bt restart
	Bt_Umaru_Pro_plugin_shop
}

# 需要6X面板密码
pass(){
clear

read -p "宝塔面板6X 选择1 ，宝塔面板5X 选择2:" pw

while [[ ! "${pw}" =~ ^[1-2]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" pw
	done

if [[ "${pw}" == "1" ]]; then
	/etc/init.d/bt default
elif [[ "${pw}" == "2" ]]; then
    orz
else
	clear
	exit 1
fi

}

# 修改5X面板密码
orz(){
clear
cd /www/server/panel && python tools.py panel moecat.cn
clear
echo -e "你的面板端口：" && cat /www/server/panel/data/port.pl
echo -e "\n"
echo -e "=================================================================="
cd /www/server/panel
python tools.py username
echo -e "password：moecat.cn"
echo -e "修改默认密码：cd /www/server/panel && python tools.py panel 你的新密码"
echo -e "${MAIN_RETURNPA}"
echo -e "=================================================================="
}

# Beta 面板 选择安装
beta_p(){
clear

read -p "全新安装 宝塔Beta版 选择1 ，已安装 宝塔Beta版  选择2 ，返回主目录 请选择3:" bta

while [[ ! "${bta}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" bta
	done
	
if [[ "${bta}" == "1" ]]; then
	beta
elif [[ "${bta}" == "2" ]]; then
    beta_c
elif [[ "${bta}" == "3" ]]; then
    main
else
	clear
	exit 1
fi
	
}

# 安装 Beta 版面板
beta(){
    yum install -y wget && wget -O install.sh $umaru_Url/install/install_beta.sh && bash install.sh
    rm -rf install.sh
    main
}

beta_c(){
# rm 掉以前安装过宝塔面板遗留的远程文件~
    rm -rf /www/server/panel/BTPanel/templates/default/index.html
	rm -rf /www/server/panel/BTPanel/static/js/soft.js
	rm -rf /www/server/panel/BTPanel/__init__.py
    rm -rf /www/server/panel/class/panelPlugin.py
	rm -rf /www/server/panel/class/panelPlugin.pyc
	rm -rf /www/server/panel/class/ajax.py
	rm -rf /www/server/panel/class/public.py
	rm -rf /www/server/panel/class/plugin2.so
	rm -rf /www/server/panel/class/plugin3.so

# 创建下载我破解好的文件啦~
    mkdir /root/Bt_Umaru_Pro
	cd /root/Bt_Umaru_Pro
	wget -N --no-check-certificate ${umaru_Url}/Bt_Umaru_Pro_beta.zip
	unzip -o Bt_Umaru_Pro_beta.zip > /dev/null	
	
# 进行cp所需要的文件啦~
    cp -pf /root/Bt_Umaru_Pro/__init__.py ${PANEL_DIR}/BTPanel/__init__.py
	cp -pf /root/Bt_Umaru_Pro/panelPlugin.py ${PANEL_DIR}/class/panelPlugin.py
	cp -pf /root/Bt_Umaru_Pro/ajax.py ${PANEL_DIR}/class/ajax.py
	cp -pf /root/Bt_Umaru_Pro/public.py ${PANEL_DIR}/class/public.py
    cp -pf /root/Bt_Umaru_Pro/soft.js ${PANEL_DIR}/BTPanel/static/js/soft.js
	cp -pf /root/Bt_Umaru_Pro/index.html ${PANEL_DIR}/BTPanel/templates/default/index.html	

# 开心完成啦~	
	rm -rf /root/Bt_Umaru_Pro
	/etc/init.d/bt restart
	echo -e "${Info} 成功升级专业版!"
	main
}

# 修复 install.sh: No such file or directory 报错
free(){
	clear
	cd /root
	wget https://umaru.uk/resolv.conf
	rm -rf /etc/resolv.conf
	cp -pf /root/resolv.conf /etc/resolv.conf
	cd /
	rm -rf /root/resolv.conf
	echo -e "${Info} DNS 修复成功！ 请输入 'reboot' 重启小鸡 在重新下载脚本！"
	echo -e "${Info} 若是 修复重启之后 还是出现 install.sh: No such file or directory \n请检查 etc/esolv.conf 里的内容 是否为：\nnameserver 8.8.8.8\nnameserver 8.8.4.4 \n"
}

# 管理宝塔
gjx(){
cygj="${Yellow_font}常用工具${Font_suffix}"
glbt="${Yellow_font}管理宝塔${Font_suffix}"
fwgl="${Yellow_font}Nginx服务管理${Font_suffix}"
fwgl1="${Yellow_font}Apache服务管理${Font_suffix}"
fwgl2="${Yellow_font}MySQL服务管理${Font_suffix}"
fwgl3="${Yellow_font}FTP服务管理${Font_suffix}"
fwgl4="${Yellow_font}PHP服务管理${Font_suffix}"
fwgl5="${Yellow_font}Redis服务管理${Font_suffix}"
fwgl6="${Yellow_font}Memcached服务管理${Font_suffix}"
error="${Red_font}结束${Font_suffix}"
clear
echo -e "${White_font}
#====================================================
#            ${Important_z} 
# ${Important_c} 
#====================================================
# ${PLUGIN_RETURC}
#====================================================
# ${cygj}
#          1.宝塔面板升级命令
#          2.5.x平滑升级到6.x命令
#          3.6x专业转免费命令
#          4.5x专业转免费命令 
#          5.Beta面板转免费版命令
# ${glbt}
#          6.宝塔面板停止
#          7.宝塔面板启动
#          8.宝塔面板重启
#          9.宝塔面板卸载
#          10.查看面板端口
#          11.centos 6修改面板端口
#          12.centos 7修改面板端口
#          13.修改MySQL管理密码
#          14.修改面板密码
#          15.查看宝塔日志
#          16.查看软件安装日志
#          17.站点配置文件位置
#          18.删除域名绑定面板
#          19.清理登陆限制
#          20.查看面板授权IP
#          21.关闭访问限制
#          22.查看许可域名
#          23.关闭面板SSL
#          24.查看面板错误日志
#          25.查看数据库错误日志
#          26.站点配置文件目录(nginx)
#          27.站点配置文件目录(apache)
#          28.站点默认目录
#          29.数据库备份目录
#          30.站点备份目录
#          31.站点日志
# ${fwgl}
#          32.nginx安装目录
#          33.nginx启动
#          34.nginx停止
#          35.nginx重启
#          36.nginx启载
#          37.nginx配置文件
# ${fwgl1}
#          38.apache安装目录
#          39.apache启动
#          40.apache停止
#          41.apache重启
#          42.apache启载
#          43.apache配置文件
# ${fwgl2}
#          44.mysql安装目录
#          45.phpmyadmin安装目录
#          46.数据存储目录
#          47.MySQL启动
#          48.MySQL停止
#          49.MySQL重启
#          50.MySQL启载
#          51.mysql配置文件
# ${fwgl3}
#          52.ftp安装目录
#          53.ftp启动
#          54.ftp停止
#          55.ftp重启
#          56.ftp配置文件
# ${fwgl4}
#          57.php安装目录
#          58.php启动
#          59.php停止
#          60.php重启
#          61.php启载
#          62.php配置文件
# ${fwgl5}
#          63.redis安装目录
#          64.redis启动
#          65.redis停止
#          66.redis配置文件
# ${fwgl6}
#          67.memcached安装目录
#          68.memcached启动
#          69.memcached停止
#          70.memcached重启
#          71.memcached启载
# ${error}
#          72.返回主目录
#====================================================
${Font_suffix}"
read -p "输入数字以选择:" nnn

if [[ "${nnn}" == "1" ]]; then
	echo -e "curl http://download.bt.cn/install/update6.sh|bash"
elif [[ "${nnn}" == "2" ]]; then
	echo -e "curl http://download.bt.cn/install/update_to_6.sh|bash"
elif [[ "${nnn}" == "3" ]]; then
	echo -e "curl http://download.bt.cn/install/update6.sh|bash"
elif [[ "${nnn}" == "4" ]]; then
	echo -e "wget -O update.sh http://download.bt.cn/install/update.sh && bash update.sh free"
elif [[ "${nnn}" == "5" ]]; then
	echo -e "curl http://download.bt.cn/install/update6.sh|bash"
elif [[ "${nnn}" == "6" ]]; then
	echo -e "/etc/init.d/bt stop"
elif [[ "${nnn}" == "7" ]]; then
	echo -e "/etc/init.d/bt start"
elif [[ "${nnn}" == "8" ]]; then
	echo -e "/etc/init.d/bt restart"
elif [[ "${nnn}" == "9" ]]; then
	echo -e "/etc/init.d/bt stop && chkconfig --del bt && rm -f /etc/init.d/bt && rm -rf /www/server/panel"
elif [[ "${nnn}" == "10" ]]; then
	echo -e "cat /www/server/panel/data/port.pl"
elif [[ "${nnn}" == "11" ]]; then
	echo -e "echo '8881' > /www/server/panel/data/port.pl && /etc/init.d/bt restart"
elif [[ "${nnn}" == "12" ]]; then
	echo -e "echo '8881' > /www/server/panel/data/port.pl && /etc/init.d/bt restart"
elif [[ "${nnn}" == "13" ]]; then
	echo -e "cd /www/server/panel && python tools.py root 123456"
elif [[ "${nnn}" == "14" ]]; then
echo -e "cd /www/server/panel && python tools.py panel 123456"
elif [[ "${nnn}" == "15" ]]; then
echo -e "cat /tmp/panelBoot.pl"
elif [[ "${nnn}" == "16" ]]; then
echo -e "cat /tmp/panelExec.log"
elif [[ "${nnn}" == "17" ]]; then
echo -e "/www/server/panel/vhost"
elif [[ "${nnn}" == "18" ]]; then
echo -e "rm -f /www/server/panel/data/domain.conf"
elif [[ "${nnn}" == "19" ]]; then
echo -e "rm -f /www/server/panel/data/*.login"
elif [[ "${nnn}" == "20" ]]; then
echo -e "cat /www/server/panel/data/limitip.conf"
elif [[ "${nnn}" == "21" ]]; then
echo -e "rm -f /www/server/panel/data/limitip.conf"
elif [[ "${nnn}" == "22" ]]; then
echo -e "cat /www/server/panel/data/domain.conf"
elif [[ "${nnn}" == "23" ]]; then
echo -e "rm -f /www/server/panel/data/ssl.pl && /etc/init.d/bt restart"
elif [[ "${nnn}" == "24" ]]; then
echo -e "cat /tmp/panelBoot"
elif [[ "${nnn}" == "25" ]]; then
echo -e "cat /www/server/data/*.err"
elif [[ "${nnn}" == "26" ]]; then
echo -e "/www/server/panel/vhost/nginx"
elif [[ "${nnn}" == "27" ]]; then
echo -e "/www/server/panel/vhost/apache"
elif [[ "${nnn}" == "28" ]]; then
echo -e "/www/wwwroot"
elif [[ "${nnn}" == "29" ]]; then
echo -e "/www/backup/database"
elif [[ "${nnn}" == "30" ]]; then
echo -e "/www/backup/site"
elif [[ "${nnn}" == "31" ]]; then
echo -e "/www/wwwlogs"
elif [[ "${nnn}" == "32" ]]; then
echo -e "/www/server/nginx"
elif [[ "${nnn}" == "33" ]]; then
echo -e "/etc/init.d/nginx start"
elif [[ "${nnn}" == "34" ]]; then
echo -e "/etc/init.d/nginx stop"
elif [[ "${nnn}" == "35" ]]; then
echo -e "/etc/init.d/nginx restart"
elif [[ "${nnn}" == "36" ]]; then
echo -e "/etc/init.d/nginx reload"
elif [[ "${nnn}" == "37" ]]; then
echo -e "/www/server/nginx/conf/nginx.conf"
elif [[ "${nnn}" == "38" ]]; then
echo -e "/www/server/httpd"
elif [[ "${nnn}" == "39" ]]; then
echo -e "/etc/init.d/httpd start"
elif [[ "${nnn}" == "40" ]]; then
echo -e "/etc/init.d/httpd stop"
elif [[ "${nnn}" == "41" ]]; then
echo -e "/etc/init.d/httpd restart"
elif [[ "${nnn}" == "42" ]]; then
echo -e "/etc/init.d/httpd reload"
elif [[ "${nnn}" == "43" ]]; then
echo -e "/www/server/apache/conf/httpd.conf"
elif [[ "${nnn}" == "44" ]]; then
echo -e "/www/server/mysql"
elif [[ "${nnn}" == "45" ]]; then
echo -e "/www/server/phpmyadmin"
elif [[ "${nnn}" == "46" ]]; then
echo -e "/www/server/data"
elif [[ "${nnn}" == "47" ]]; then
echo -e "/etc/init.d/mysqld start"
elif [[ "${nnn}" == "48" ]]; then
echo -e "/etc/init.d/mysqld stop"
elif [[ "${nnn}" == "49" ]]; then
echo -e "/etc/init.d/mysqld restart"
elif [[ "${nnn}" == "50" ]]; then
echo -e "/etc/init.d/mysqld reload"
elif [[ "${nnn}" == "51" ]]; then
echo -e "/etc/my.cnf"
elif [[ "${nnn}" == "52" ]]; then
echo -e "/www/server/pure-ftpd"
elif [[ "${nnn}" == "53" ]]; then
echo -e "/etc/init.d/pure-ftpd start"
elif [[ "${nnn}" == "54" ]]; then
echo -e "/etc/init.d/pure-ftpd stop"
elif [[ "${nnn}" == "55" ]]; then
echo -e "/etc/init.d/pure-ftpd restart"
elif [[ "${nnn}" == "56" ]]; then
echo -e "/www/server/pure-ftpd/etc/pure-ftpd.conf"
elif [[ "${nnn}" == "57" ]]; then
echo -e "/www/server/php"
elif [[ "${nnn}" == "58" ]]; then
echo -e "/etc/init.d/php-fpm-{52|53|54|55|56|70|71} start"
elif [[ "${nnn}" == "59" ]]; then
echo -e "/etc/init.d/php-fpm-{52|53|54|55|56|70|71} stop"
elif [[ "${nnn}" == "60" ]]; then
echo -e "/etc/init.d/php-fpm-{52|53|54|55|56|70|71} restart"
elif [[ "${nnn}" == "61" ]]; then
echo -e "/etc/init.d/php-fpm-{52|53|54|55|56|70|71} reload"
elif [[ "${nnn}" == "62" ]]; then
echo -e "/www/server/php/{52|53|54|55|56|70|71}/etc/php.ini"
elif [[ "${nnn}" == "63" ]]; then
echo -e "/www/server/redis"
elif [[ "${nnn}" == "64" ]]; then
echo -e "/etc/init.d/redis start"
elif [[ "${nnn}" == "65" ]]; then
echo -e "/etc/init.d/redis stop"
elif [[ "${nnn}" == "66" ]]; then
echo -e "/www/server/redis/redis.conf"
elif [[ "${nnn}" == "67" ]]; then
echo -e "/usr/local/memcached"
elif [[ "${nnn}" == "68" ]]; then
echo -e "/etc/init.d/memcached start"
elif [[ "${nnn}" == "69" ]]; then
echo -e "/etc/init.d/memcached stop"
elif [[ "${nnn}" == "70" ]]; then
echo -e "/etc/init.d/memcached restart"
elif [[ "${nnn}" == "71" ]]; then
echo -e "/etc/init.d/memcached reload"
elif [[ "${nnn}" == "72" ]]; then
main
fi	
}

# Bt_Kiriko_Suki 面板
main(){
clear
echo -e "${Thank}"
echo -e "${Red_font}
#=======================================
# Name:            Bt_Kiriko_Suki
# Version:         Suki_V2
# Author I:        雾子の博客（原：樱花博客）
# Author II:       Loli分享论坛
# Copyright I:     www.kiriko.org
# Copyright II:    https://www.moecat.cn
# QQ交流群：       687305290
# TG交流群：       t.me/freechevereto
#=======================================
${Font_suffix}"
echo -e "${MAIN_RETURN}"
echo -e "${MAIN_RETURNC}\n${MAIN_RETURND}${fuli}\n${gonggao1}\n0.宝塔 5.9.1 ${MAIN_RETURNPR}\n1.宝塔 6.8.9 ${MAIN_RETURNPP}\n2.宝塔 6.9.0 ${MAIN_RETURNPP}\n3.宝塔 6.9.1 ${MAIN_RETURNPP}\n4.宝塔 6.9.2 ${MAIN_RETURNPP}\n5.宝塔 6.9.3 ${MAIN_RETURNPP}\n6.宝塔 6.9.4 ${MAIN_RETURNPR}\n7.宝塔 Beta版 ${Beta}\n8.宝塔插件\n9.宝塔第三方插件\n10.查看面板信息 ${MAIN_RETURNPT}\n${gongjuxiang}\n12.修复 install.sh: No such file or directory 报错\n13.退出脚本"
read -p "请输入需要输入的选项:" function

# while [[ ! "${function}" =~ ^[0-9]$ ]]
	# do
		# echo -e "${Error} 无效输入"
		# echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" function
	# done	

if [[ "${function}" == "0" ]]; then
	Bt_Umaru_Pro_5.9.1_p
elif [[ "${function}" == "1" ]]; then
    Bt_Umaru_Pro_6.8.9
elif [[ "${function}" == "2" ]]; then
    Bt_Umaru_Pro_6.9.0
elif [[ "${function}" == "3" ]]; then
    Bt_Umaru_Pro_6.9.1
elif [[ "${function}" == "4" ]]; then
    Bt_Umaru_Pro_6.9.2
elif [[ "${function}" == "5" ]]; then
    Bt_Umaru_Pro_6.9.3
elif [[ "${function}" == "6" ]]; then
    Bt_Umaru_Pro_6.9.4_p	
elif [[ "${function}" == "7" ]]; then
    beta_p
elif [[ "${function}" == "8" ]]; then
    Bt_Umaru_Pro_plugin
elif [[ "${function}" == "9" ]]; then
    py
elif [[ "${function}" == "10" ]]; then
    pass
elif [[ "${function}" == "11" ]]; then
    gjx
elif [[ "${function}" == "12" ]]; then
    free
elif [[ "${function}" == "13" ]]; then
    delete
elif [[ "${function}" == "a" ]]; then
    echo -e "${scfy}" 
elif [[ "${function}" == "b" ]]; then
    a
else
	clear
	exit 1
fi	
}
main
