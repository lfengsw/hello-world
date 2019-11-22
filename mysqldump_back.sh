#!/bin/bash
#author lll

dbName=test
fileName=`date +%Y%m%d.%H%M`
backupPath=/root/data
dbuser=root
dbpassword=123456
if [ ! -n "$1" ] ;then
	echo -e "---请输入需要备份数据库名称---"
	exit
fi



if [ "${dbName}" == "$1" ];then

	if [ ! -e $backupPath ];then
       		echo "---正在创建备份路径---"
        	mkdir -p $backupPath
	fi

	mysqldump -u$dbuser -p$dbpassword $1>$backupPath/$fileName.sql
	echo "---$1数据库备份完成---"
	echo "---备份路径为$backupPath/$fileName.sql---"
else
	echo "---please input correct database name---"
	exit
fi
