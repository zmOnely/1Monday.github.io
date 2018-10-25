#!/bin/bash
read -p "请输入要创建的用户名的前缀" user
echo "用户名的前缀是："$user
for((i=1;i<=30;i=i+1))
do
	useradd $user$i
	echo "用户$user$i 已创建"
	echo "hadoop" | passwd $user$i --stdin
done
