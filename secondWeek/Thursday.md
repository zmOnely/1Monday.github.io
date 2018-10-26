### 配置java环境
* 从网上下载jdk压缩包
	* wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-  securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u191-  b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
* 用命令取到下载的jar包名字
	* jdktar=$(ls `|` sed -n '/jdk.*gz$/p')
* 解压jar包
	* tar -zxf $jdktar
* 解压之后删除压缩包
	* rm -rf $jdktar
* 取到解压后的包的名字
	* jdkname=$(ls `|` grep jdk)
* 进入jdk包中
	* cd $jdkname
* 取到其包所在的路径
	* javahome=$(pwd)
* 配置环境
	* echo "javahome:"$javahome
		* echo "export JAVA_HOME=$javahome" >> /etc/profile
		* echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
		* echo 'export CLASSPATH=$:CLASSPATH:$JAVA_HOME/lib/' >> /etc/profile
		* . /etc/profile
* 退出vim，运行.sh即可
 
### 配置单点hadoop
* java环境  配置jdk
* 将hadoop的jar.gz包解压
* 将解压后的包移到hadoop用户的 ~ 目录下
* 进入 hadoop解压后的包
* 进入bin，执行hadoop命令，检测执行，成功；
	* 进入 ~ 目录，执行hadoop命令，失败
* 配置hdoop环境变量
* 进入 ~ 目录
* vim .bash_profile，修改此文件
	* export HADOOP_HOME=/home/hadoop/hadoop-2.7.3
	* PATH=$PATH:$HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
* 执行hadoop 点命令
* 在 ~ 下执行hadoop命令，检测，成功
	* ps：但其实在hadoop用户下配置更好

### 配置 hadoop伪分布式
* 关闭防火墙
	* systemctl stop firewalld
	* systemctl status firewalld 查看是否关闭 
	* ps：但是这里要永久关闭，systemctl disable firewalld
* 在配置完单点hadoop的基础上继续操作
* cd ~/hadoop-2.7.3/etc/hadoop/
* 配置四大文件
    ```
	vim core-site.xml 
		<property>  
			<name>hadoop.tmp.dir</name>  
			<value>/home/hadoop/tmp</value>
		</property>  
		<property>  
			<name>fs.defaultFS</name>  
			<value>hdfs://(namenode的ip地址):9000</value>  
		</property> 
	```
	
	
	```
	vim hdfs-site.xml 
		<!-- <property>    
			<name>dfs.replication</name>    
			<value>1</value>    
		</property> -->   
		<property>    
			<name>dfs.namenode.name.dir</name>    
			<value>file:/home/hadoop/dfs/name</value>    
		</property>    
		<property>    
			<name>dfs.datanode.data.dir</name>    
			<value>file:/home/hadoop/dfs/data</value>    
		</property>
	```
	
	
	```
	vim yarn-site.xml 
		<property>  
			<name>mapreduce.framework.name</name>  
			<value>yarn</value>  
		</property>   
		<property>  
			<name>yarn.nodemanager.aux-services</name>  
			<value>mapreduce_shuffle</value>  
		</property>
	```	
* cp mapred-site.xml.template mapred-site.xml
	```
	vim mapred-site.xml
		<property>
			<name>mapreduce.framework.name</name>
			<value>yarn</value>
		</property>
	```
	
* 格式化(对namenode的储存位置)
	* hadoop namenode -format
* 配置
	* vim hadoop-env.sh
    * 将JAVA_HOME改为(echo $JAVA_HOME)的运行结果
* 启动
	* start-all.sh
* 检测是否成功 jps
	* ![jps.png](https://upload-images.jianshu.io/upload_images/14467401-5f8a3a7e807fd295.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 权限不够的解决方案
	* 查看是否之前用root用户登录过，sudo试试
	* 查看日志 
		* cd /home/hadoop/hadoop-2.7.3/logs
		* ls	
* 端口被进程占用的解决方案 
	* 第一步：查看占用端口的进程
		* netstat -tunlp `|` grep 端口号
	* 第二步：如果被占用，解除被占用的端口
		* kill -9 进程号 (pid 进程号)













