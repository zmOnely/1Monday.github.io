## hadoop完全分布式的配置与使用
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
	(拍摄的是namenode的快照，名为"namenode")
	```
	* 克隆三个，作为datanode使用
		* ps：只克隆好，先不要进行任何配置
* 开始配置
	* 配置好hadoop伪分布式 
		* (具体步骤参考secondWeek/Thursday笔记)
	* 在namenode下
	```
	1.将它的配置文件传给datanode
	  scp 要传输的内容 要传到电脑的用户名@要传到的电脑ip:要传到那台电脑的位置
	 (scp -r ~/hadoop2.7.3/etc/hadoop/ hadoop@172.18.24.2:/home/hadoop/hadoop-2.7.3/etc/)
	2.启动namenode 
	  hadoop-daemon.sh start namenode 
	3.jps 查看是否启动
	4.启动后，去网页访问 
	  (namenode的ip):50070
	ps：若关闭，则访问不到
	```
	* 在datanode下
	```
	1.开启发送键输入到所有对话
	2.先将namenode的/etc/profile下配置jdk和hadoop的三个语句复制粘贴到datanode的相应文件下
	3.启动datanode
	  hadoop-daemon.sh start datanode
	4.jps 查看是否启动
	5.启动后，去网页查看Live Nodes，个数是否匹配
	```
* 可能遇到问题及解决方案
	* 如果在网页中查看"Live Nodes一直为0"
	```
	在namenode中操作
	1.cd /home/hadoop/dfs/data/current
	2.ls 查看BP...
	3.vim VERSION 查看ID是否匹配
	```
	
	
	![VERSION.png](https://upload-images.jianshu.io/upload_images/14467401-b922f74a8a92188a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	
	
	```
	4.若匹配，继续下一步
	5.cd /home/hadoop/hadoop-2.7.3/etc/hadoop
	6.vim slaves 将datanode的ip写入里面，进行注册，如图
	```
	
	![slaves.png](https://upload-images.jianshu.io/upload_images/14467401-52c6a76194aa015f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 7.sudo vim /etc/hosts 将以下信息填入，如图
	![hosts.png](https://upload-images.jianshu.io/upload_images/14467401-aa8f22e995f29ac3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 8.重启后，查看网页的"Live Nodes"或者hdfs dfsadmin -report即可
	
	
	* 免密问题
	
	```
	在namenode中操作
	1.ssh-keygen  生成密钥
	ps：不输入任何信息，直接回车就好
	2.ssh-copy-id 需要免密的用户名@需要免密的ip
	  eg：
	  ssh-copy-id hadoop@172.18.24.198
	  ps：注意看需要输入的是哪个用户的密码，到此，免密就做好啦，下面的步骤是查看相关免密信息的
	
	3.cat .ssh/id_rsa.pub >> .ssh/authorized_keys
	4.ll -al ，查看隐藏文件
	5.cd .ssh
	6.ll ，可以查看id_rsa.pub
	7.免密操作完成后，进行重启检测
	ps：ssh-keygen  产生公钥与私钥对；
		ssh-copy-id 将本机的公钥复制到远程机器的authorized_keys文件中，
		ssh-copy-id也能让你有到远程机器的home，~./ssh，和 ~/.ssh/authorized_keys的权利
	```
	
	
	
	* 查看日志寻找错误源	
		* cat ~/hadoop-2.7.3/logs/hadoop-hadoop-datanode-localhost.localdomain.log
	
	
		