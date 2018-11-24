#!/bin/bash

echo 
echo "************************************************"
echo "*         ����������ɻ���grepall����          *"
echo "*   �÷�˵��:grepall��grep������÷���ȫһ��   *"
echo "************************************************"
echo 

all_ip="123.56.223.8 47.93.243.71"  #use your server ip.
sshuser="lrj"   #use your user
localpath=`pwd`

if [ $# -eq 0 ] || [ $# -eq 1 ]
then
	echo "grepall ����ȱ�ٲ���"
	echo "Usage: grepall [OPTION]... PATTERN [FILE]..."
	echo "Try 'grep --help' for more information."
	exit
fi

echo "=====================start======================"
echo 

for ip in ${all_ip}
do
	result=`sshpass -p lrj ssh ${sshuser}@${ip} "cd ${localpath};echo "------------------------------------"; grep $@ && echo "����Ϊ${ip}��ѯ���Ľ��" || echo "��${ip}��δ��ѯ����¼" "`  
	echo "${result}"
	echo "------------------------------------"
	echo "Look up on next machine..."
echo 
done

echo "======================end======================="
