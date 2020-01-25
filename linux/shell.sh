#!/usr/bin/env bash

#更新脚本
update_shell(){
	echo -e "当前版本为 [ ${shell_version} ]，开始检测最新版本..."
	shell_new_version=$(wget --no-check-certificate -qO- "http://${coding}/linux/install.sh"|grep 'shell_version="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1)
	[[ -z ${shell_new_version} ]] && echo -e "${Error} 检测最新版本失败 !" && start_menu
	if [[ ${shell_new_version} != ${shell_version} ]]; then
		echo -e "发现新版本[ ${shell_new_version} ]，是否更新？[Y/n]"
		read -p "(默认: y):" yn
		[[ -z "${yn}" ]] && yn="y"
		if [[ ${yn} == [Yy] ]]; then
			wget -N --no-check-certificate http://${github}/linux/install.sh && chmod +x install.sh
			echo -e "脚本已更新为最新版本[ ${shell_new_version} ] !"
		else
			echo && echo "	已取消..." && echo
		fi
	else
		echo -e "当前已是最新版本[ ${shell_new_version} ] !"
		sleep 5s
	fi
}