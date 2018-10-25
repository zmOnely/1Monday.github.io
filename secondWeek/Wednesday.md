### 案例一
* 自动安装java环境(从下包到配置)
	* cd /home/hadoop/bin
	* > creatjava.sh
	* vim creatjava.sh
	* 在vim里写内容
	```
	#!/bin/bash
	echo "从网页上下载压缩包"
	wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
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




