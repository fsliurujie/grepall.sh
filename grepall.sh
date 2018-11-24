#!/bin/bash

echo 
echo "************************************************"
echo "*         多服务器集成环境grepall命令          *"
echo "*   用法说明:grepall与grep命令的用法完全一致   *"
echo "************************************************"
echo 

all_ip="123.56.223.8 47.93.243.71"  #use your server ip.
sshuser="lrj"   #use your user
localpath=`pwd`

if [ $# -eq 0 ] || [ $# -eq 1 ]
then
	echo "grepall 命令缺少参数"
	echo "Usage: grepall [OPTION]... PATTERN [FILE]..."
	echo "Try 'grep --help' for more information."
	exit
fi

echo "=====================start======================"
echo 

for ip in ${all_ip}
do
	result=`sshpass -p lrj ssh ${sshuser}@${ip} "cd ${localpath};echo "------------------------------------"; grep $@ && echo "以上为${ip}查询到的结果" || echo "在${ip}上未查询到记录" "`  
	echo "${result}"
	echo "------------------------------------"
	echo "Look up on next machine..."
echo 
done

echo "======================end======================="
