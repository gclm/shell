#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
install_tmp='/tmp/bt_install.pl'
public_file=/www/server/panel/install/public.sh


if [ ! -f $public_file ];then
	wget -O $public_file $miui_Url/install/public.sh -T 5;
fi

. $public_file
download_Url=$NODE_URL
miui_Url='http://download.miui.uk:25041';
pluginPath=/www/server/panel/plugin/btwaf_httpd

pyVersion=$(python -V 2>&1|awk '{printf ("%d",$2)}')


Install_btwaf_httpd()
{	

	Install_cjson
	Install_socket
	Install_mod_lua
	yum install lua-socket -y
	apt-get install lua-cjson -y 
	apt-get install lua-socket -y 
	mkdir -p $pluginPath
	echo '正在安装脚本文件...' > $install_tmp
	mkdir -p /www/server/btwaf
	if [ "$pyVersion" == 2 ];then
		wget -O $pluginPath/btwaf_httpd_main.zip $miui_Url/install/plugin/btwaf_httpd/btwaf_httpd_main.zip -T 5
		unzip -o $pluginPath/btwaf_httpd_main.zip -d $pluginPath > /dev/null
		rm -rf $pluginPath/btwaf_httpd_main.zip
	else
		wget -O $pluginPath/btwaf_httpd_main.cpython-36m-x86_64-linux-gnu.zip $download_Url/install/plugin/btwaf_httpd/btwaf_httpd_main.cpython-36m-x86_64-linux-gnu.zip -T 5
		unzip -o $pluginPath/btwaf_httpd_main.cpython-36m-x86_64-linux-gnu.zip-d $pluginPath > /dev/null
		rm -rf $pluginPath/btwaf_httpd_main.cpython-36m-x86_64-linux-gnu.zip
		wget -O $pluginPath/btwaf_httpd_main.cpython-34m.zip $download_Url/install/plugin/btwaf_httpd/btwaf_httpd_main.cpython-34m.zip -T 5
		unzip -o $pluginPath/btwaf_httpd_main.cpython-34m.zip -d $pluginPath > /dev/null
		rm -rf $pluginPath/btwaf_httpd_main.cpython-34m.zip
	fi
	wget -O $pluginPath/firewalls_list.py $miui_Url/install/plugin/btwaf_httpd/firewalls_list.py -T 5
	wget -O $pluginPath/index.html $miui_Url/install/plugin/btwaf_httpd/index.html -T 5
	wget -O $pluginPath/info.json $download_Url/install/plugin/btwaf_httpd/info.json -T 5
	wget -O $pluginPath/icon.png $download_Url/install/plugin/btwaf_httpd/icon.png -T 5
	chattr -i /www/server/panel/vhost/apache/btwaf.conf
	rm -rf /www/server/panel/vhost/apache/btwaf.conf
	wget -O /www/server/panel/vhost/apache/btwaf.conf $download_Url/install/plugin/btwaf_httpd/btwaf.conf -T 5
	\cp -a -r /www/server/panel/plugin/btwaf_httpd/icon.png /www/server/panel/static/img/soft_ico/ico-btwaf_httpd.png
	wget -O $pluginPath/btwaf.zip $download_Url/install/plugin/btwaf_httpd/btwaf.zip -T 5
	unzip -o $pluginPath/btwaf.zip -d /tmp/ > /dev/null
	\cp -a -r /tmp/btwaf/rule/referer.json /www/server/btwaf/rule/referer.json
	rm -f $pluginPath/btwaf.zip
	btwaf_httpd_path=/www/server/btwaf
	mkdir -p $btwaf_httpd_path/html
	rm -rf /www/server/btwaf/cms
	mv /tmp/btwaf/cms/  $btwaf_httpd_path
	if [ ! -f $btwaf_httpd_path/html/get.html ];then
		\cp -a -r /tmp/btwaf/html/get.html $btwaf_httpd_path/html/get.html
		\cp -a -r /tmp/btwaf/html/get.html $btwaf_httpd_path/html/post.html
		\cp -a -r /tmp/btwaf/html/get.html $btwaf_httpd_path/html/cookie.html
		\cp -a -r /tmp/btwaf/html/get.html $btwaf_httpd_path/html/user_agent.html
		\cp -a -r /tmp/btwaf/html/get.html $btwaf_httpd_path/html/other.html
	fi
	
	mkdir -p $btwaf_httpd_path/rule
	if [ ! -f $btwaf_httpd_path/rule/url.json ];then
		\cp -a -r /tmp/btwaf/rule/url.json $btwaf_httpd_path/rule/url.json
		\cp -a -r /tmp/btwaf/rule/args.json $btwaf_httpd_path/rule/args.json
		\cp -a -r /tmp/btwaf/rule/post.json $btwaf_httpd_path/rule/post.json
		\cp -a -r /tmp/btwaf/rule/cn.json $btwaf_httpd_path/rule/cn.json
		\cp -a -r /tmp/btwaf/rule/cookie.json $btwaf_httpd_path/rule/cookie.json
		\cp -a -r /tmp/btwaf/rule/head_white.json $btwaf_httpd_path/rule/head_white.json
		\cp -a -r /tmp/btwaf/rule/ip_black.json $btwaf_httpd_path/rule/ip_black.json
		\cp -a -r /tmp/btwaf/rule/ip_white.json $btwaf_httpd_path/rule/ip_white.json
		\cp -a -r /tmp/btwaf/rule/scan_black.json $btwaf_httpd_path/rule/scan_black.json
		\cp -a -r /tmp/btwaf/rule/url_black.json $btwaf_httpd_path/rule/url_black.json
		\cp -a -r /tmp/btwaf/rule/url_white.json $btwaf_httpd_path/rule/url_white.json
		\cp -a -r /tmp/btwaf/rule/user_agent.json $btwaf_httpd_path/rule/user_agent.json
		\cp -a -r /tmp/btwaf/rule/referer.json $btwaf_httpd_path/rule/referer.json
	fi
	
	
	if [ ! -f $btwaf_httpd_path/rule/cc_uri_white.json ];then
		\cp -a -r /tmp/btwaf/rule/cc_uri_white.json $btwaf_httpd_path/rule/cc_uri_white.json
	fi
	
	if [ ! -f /dev/shm/stop_ip.json ];then
		\cp -a -r /tmp/btwaf/stop_ip.json /dev/shm/stop_ip.json
	fi
	
	chmod 777 /dev/shm/stop_ip.json
	chown www:www /dev/shm/stop_ip.json
	
	
	if [ ! -f $btwaf_httpd_path/1.json ];then
		\cp -a -r /tmp/btwaf/1.json $btwaf_httpd_path/1.json
	fi
	
	if [ ! -f $btwaf_httpd_path/2.json ];then
		\cp -a -r /tmp/btwaf/2.json $btwaf_httpd_path/2.json
	fi
	
	if [ ! -f $btwaf_httpd_path/3.json ];then
		\cp -a -r /tmp/btwaf/3.json $btwaf_httpd_path/3.json
	fi
	
	if [ ! -f $btwaf_httpd_path/4.json ];then
		\cp -a -r /tmp/btwaf/4.json $btwaf_httpd_path/4.json
	fi
	
		if [ ! -f $btwaf_httpd_path/5.json ];then
		\cp -a -r /tmp/btwaf/5.json $btwaf_httpd_path/5.json
	fi
	
	if [ ! -f $btwaf_httpd_path/6.json ];then
		\cp -a -r /tmp/btwaf/6.json $btwaf_httpd_path/6.json
	fi
	
	if [ ! -f $btwaf_httpd_path/zhi.json  ];then
		\cp -a -r /tmp/btwaf/zhi.json $btwaf_httpd_path/zhi.json
	fi
	
	
	if [ ! -f $btwaf_httpd_path/site.json ];then
		\cp -a -r /tmp/btwaf/site.json $btwaf_httpd_path/site.json
	fi
	
	if [ ! -f $btwaf_httpd_path/config.json ];then
		\cp -a -r /tmp/btwaf/config.json $btwaf_httpd_path/config.json
	fi
	
	if [ ! -f $btwaf_httpd_path/total.json ];then
		\cp -a -r /tmp/btwaf/total.json $btwaf_httpd_path/total.json
	fi
	
	if [ ! -f $btwaf_httpd_path/drop_ip.log ];then
		\cp -a -r /tmp/btwaf/drop_ip.log $btwaf_httpd_path/drop_ip.log
	fi
	\cp -a -r /tmp/btwaf/7.7.lua $btwaf_httpd_path/httpd.lua
	\cp -a -r /tmp/btwaf/memcached.lua $btwaf_httpd_path/memcached.lua
	\cp -a -r /tmp/btwaf/CRC32.lua $btwaf_httpd_path/CRC32.lua
	chmod +x $btwaf_httpd_path/httpd.lua
	chmod +x $btwaf_httpd_path/memcached.lua
	chmod +x $btwaf_httpd_path/CRC32.lua
	
	mkdir -p /www/wwwlogs/btwaf
	chmod 777 /www/wwwlogs/btwaf
	chmod -R 755 /www/server/btwaf
	#rm -rf /tmp/btwaf
	cd /www/server/panel
	chown -R root:root /www/server/btwaf/
	chown www:www /www/server/btwaf/*.json
	chown www:www /www/server/btwaf/drop_ip.log
	chattr +i /www/server/panel/vhost/apache/btwaf.conf
	/etc/init.d/httpd restart
	/etc/init.d/bt restart
	
	echo '安装完成' > $install_tmp
    echo -e "\033[31m脚本执行完毕，欢迎使用！ \033[0m"
	rm -rf btwaf_httpd.sh
}

Install_cjson()
{
	if [ -f /usr/bin/yum ];then
		isInstall=`rpm -qa |grep lua-devel`
		if [ "$isInstall" == "" ];then
			yum install lua lua-devel -y
		fi
	else
		isInstall=`dpkg -l|grep liblua5.1-0-dev`
		if [ "$isInstall" == "" ];then
			apt-get install lua5.1 lua5.1-dev -y
		fi
	fi
	
	if [ ! -f /usr/local/lib/lua/5.1/cjson.so ];then
		wget -O lua-cjson-2.1.0.tar.gz $download_Url/install/src/lua-cjson-2.1.0.tar.gz -T 20
		tar xvf lua-cjson-2.1.0.tar.gz
		rm -f lua-cjson-2.1.0.tar.gz
		cd lua-cjson-2.1.0
		make clean
		make
		make install
		cd ..
		rm -rf lua-cjson-2.1.0
		ln -sf /usr/local/lib/lua/5.1/cjson.so /usr/lib64/lua/5.1/cjson.so
		ln -sf /usr/local/lib/lua/5.1/cjson.so /usr/lib/lua/5.1/cjson.so
	else
		if [ -d "/usr/lib64/lua/5.1" ];then
			ln -sf /usr/local/lib/lua/5.1/cjson.so /usr/lib64/lua/5.1/cjson.so
		fi
		
		if [ -d "/usr/lib/lua/5.1" ];then
			ln -sf /usr/local/lib/lua/5.1/cjson.so /usr/lib/lua/5.1/cjson.so
		fi
	fi
}

Install_socket()
{
	if [ ! -f /usr/local/lib/lua/5.1/socket/core.so ];then
		wget -O luasocket-master.zip $download_Url/install/src/luasocket-master.zip -T 20
		unzip luasocket-master.zip
		rm -f luasocket-master.zip
		cd luasocket-master
		export C_INCLUDE_PATH=/usr/local/include/luajit-2.0:$C_INCLUDE_PATH
		make
		make install
		cd ..
		rm -rf luasocket-master
	fi
	
	if [ ! -d /usr/share/lua/5.1/socket ]; then
		if [ -d /usr/lib64/lua/5.1 ];then
			rm -rf /usr/lib64/lua/5.1/socket /usr/lib64/lua/5.1/mime
			ln -sf /usr/local/lib/lua/5.1/socket /usr/lib64/lua/5.1/socket
			ln -sf /usr/local/lib/lua/5.1/mime /usr/lib64/lua/5.1/mime
		else
			rm -rf /usr/lib/lua/5.1/socket /usr/lib/lua/5.1/mime
			ln -sf /usr/local/lib/lua/5.1/socket /usr/lib/lua/5.1/socket
			ln -sf /usr/local/lib/lua/5.1/mime /usr/lib/lua/5.1/mime
		fi
		rm -rf /usr/share/lua/5.1/mime.lua /usr/share/lua/5.1/socket.lua /usr/share/lua/5.1/socket
		ln -sf /usr/local/share/lua/5.1/mime.lua /usr/share/lua/5.1/mime.lua
		ln -sf /usr/local/share/lua/5.1/socket.lua /usr/share/lua/5.1/socket.lua
		ln -sf /usr/local/share/lua/5.1/socket /usr/share/lua/5.1/socket
	fi
}

Install_mod_lua()
{
	if [ -f /www/server/apache/modules/mod_lua.so ];then
		return 0;
	fi
	cd /www/server/apache
	if [ ! -d /www/server/apache/src ];then
		wget -O httpd-2.4.33.tar.gz $download_Url/src/httpd-2.4.33.tar.gz -T 20
		tar xvf httpd-2.4.33.tar.gz
		rm -f httpd-2.4.33.tar.gz
		mv httpd-2.4.33 src
		cd /www/server/apache/src/srclib
		wget -O apr-1.6.3.tar.gz $download_Url/src/apr-1.6.3.tar.gz
		wget -O apr-util-1.6.1.tar.gz $download_Url/src/apr-util-1.6.1.tar.gz
		tar zxf apr-1.6.3.tar.gz
		tar zxf apr-util-1.6.1.tar.gz
		mv apr-1.6.3 apr
		mv apr-util-1.6.1 apr-util
	fi
	cd /www/server/apache/src
	./configure --prefix=/www/server/apache --enable-lua
	cd /www/server/apache/src/modules/lua
	make
	make install
	
	if [ ! -f /www/server/apache/modules/mod_lua.so ];then
		echo 'mod_lua安装失败!';
		exit 0;
	fi
}

Uninstall_btwaf_httpd()
{
	chattr -i /www/server/panel/vhost/apache/btwaf.conf
	if [ ! -d /www/server/panel/plugin/btwaf ];then
		rm -rf /www/server/btwaf
	fi
	rm -f /www/server/panel/vhost/apache/btwaf.conf
	rm -rf $pluginPath
	/etc/init.d/httpd reload
}

if [ "${1}" == 'install' ];then
	Install_btwaf_httpd
elif  [ "${1}" == 'update' ];then
	Install_btwaf_httpd
elif [ "${1}" == 'uninstall' ];then
	Uninstall_btwaf_httpd
fi
