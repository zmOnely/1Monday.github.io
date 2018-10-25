### 案例一
* 自动安装java环境(从下包到配置)
- [执行文件链接](https://zmonely.github.io/zmOnely/secondWeek/javaPath.sh) 
* ！！！注意：点击就开始安装，请慎重！！！
	* cd /home/hadoop/bin
	* touch javaPath.sh
	* vim javaPath.sh
	* 在vim里写内容
	```
	#!/bin/bash
	echo "从网页上下载压缩包"
	wget --no-check-certificate --no-cookies --header 
	"Cookie: oraclelicense=accept-securebackup-cookie" 
	http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
	echo "解压文件夹"
	javatar=$(ls | sed -n '/jdk.*gz$/p')
	tar -zxf $javatar
	rm -rf $javatar
	echo "配置环境变量"
	jdkname=$(ls | grep jdk)
	cd $jdkname
	javaname=$(pwd)
	echo "export JAVA_HOME=$javaname" >> /etc/profile
	echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
	echo 'export CLASSPATH=$:CLASSPATH:$JAVA_HOME/lib/' >>/etc/profile
	. /etc/profile
	```
### 案例二
* 自动创建30个用户(可自选喜欢的前缀)
- [执行文件链接](https://zmonely.github.io/zmOnely/secondWeek/create30User.sh) 
* ！！！注意：点击就开始创建，请慎重！！！
	* cd /home/hadoop/bin
	* touch creat30user.sh
	* vim creat30user.sh
	* 在vim里写内容
	```
	#!/bin/bash
	read -p "请输入要创建的用户名的前缀" user
	echo "用户名的前缀是："$user
	for((i=1;i<=30;i=i+1))
	do
		useradd $user$i
		echo "用户$user$i 已创建"
		echo "hadoop" | passwd $user$i --stdin
	done
	```
### 案例三
* 自动解压当前目录下所有压缩包
- [执行文件链接](https://zmonely.github.io/zmOnely/secondWeek/zltar.sh) 
* ！！！注意：点击就开始创建，请慎重！！！
	* cd /home/hadoop/bin
	* touch zltar.sh
	* vim zltar.sh
	* 在vim里写内容
	```
	#!/bin/bash
	echo $1
	ls $1/*.gz > /home/hadoop/bin/tars.log
	for files in $(cat /home/hadoop/bin/tars.log)
	do
		echo "file is:"$files
		tar -zxf $files
	done
	```
	




