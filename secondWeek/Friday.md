##hadoop完全分布式的配置与使用
* 准备工作
	* 新建一台虚拟机，作为namenode使用
	```
	1.创建一个hadoop用户
	2.visudo 将hadoop用户可以sudo
	3.下载vim*    yum install -y vim*
	4.下载net-tools
	5.永久关闭防火墙
	6.将jdk和hadoop压缩包导入/home/hadoop下
	7.拍摄快照  
	(拍摄的是zl8的快照，名为"差不多初始虚拟机"，但此虚拟机未关闭防火墙！)
	```
	* 克隆三个，作为datanode使用
		* ps：只克隆好，不要进行任何配置，等namenode配好了同步即可
* 开始配置
	* 配置好hadoop伪分布式 
		* (具体步骤参考secondWeek/Thursday笔记)
	* 在namenode下
	```
	1.将它的配置文件传给datanode
	scp 要传输的内容 要传到电脑的用户名@要传到的电脑ip:要传到这台电脑的位置
	(scp -r ~/hadoop2.7.3/etc/hadoop/ hadoop@172.18.24.2:/home/hadoop/hadoop-2.7.3/etc/)
	2.hadoop-daemon.sh start namenode 启动namenode
	3.jps查看是否启动
	4.去网页访问 namenodeip：50070
	ps：若关闭，则访问不到
	```
	* 在datanode下
	```
	1.开启发送键输入到所有对话
	2.先将namenode的/etc/profile下配置jdk和hadoop的三个语句复制粘贴到datanode的相应文件下
	3.hadoop-daemon.sh start datanode
	4.jps查看是否启动
	```
* 可能遇到问题及解决方案
	* 如果在网页中查看"活着的节点数一直为0"
	```
	在namenode中操作
	1.cd /home/hadoop/dfs/data/current
	2.ls
	3.查看BP...
	4.vim VERSION，查看ID是否匹配
	```
	![VERSION.png](https://upload-images.jianshu.io/upload_images/14467401-b922f74a8a92188a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	```
	5.若匹配，继续下一步
	6.将namenode和datanode都关闭
	hadoop-daemon.sh stop namenode(datanode)
	7.cd /home/hadoop/hadoop-2.7.3/etc/hadoop
	8.vim slaves 将datanode的ip写入里面，进行注册
	9.start-dfs.sh 
	(效果：namenode启动，datanode也随之启动，只需操作namenode即可)
	10.查看日志寻找错误源
	cat ~/hadoop-2.7.3/logs/hadoop-hadoop-datanode-localhost.localdomain.log
	11.sudo vim /etc/hosts 将以下信息填入，如图
	```
	![hosts.png](https://upload-images.jianshu.io/upload_images/14467401-aa8f22e995f29ac3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	```
	12.重启后，查看网页的"活着的节点"
	   或者hdfs dfsadmin -report即可
	```
	
	* 免密问题
	```
	在namenode中操作
	1.ssh-keygen  生成密钥
	2.ssh-copy-id 需要免密的用户名@需要免密的ip
	ssh-copy-id hadoop@172.18.24.2
	ps：注意看需要输入的是哪个用户的密码，将所有datanode的进行免密操作
	3.给namenode免密
	cat .ssh/id_rsa.pub >> .ssh/authorized_keys
	4.ll -al ，查看隐藏文件
	5.cd .ssh
	6.ll ，可以查看id_rsa.pub
	7.免密操作完成后，进行重启检测
	
	* 有问题记得先查看日志呦~~
	* cat ~/hadoop-2.7.3/logs/hadoop-hadoop-datanode-localhost.localdomain.log
	
		