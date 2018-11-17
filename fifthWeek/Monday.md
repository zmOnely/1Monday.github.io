## MapReduce、Hive环境搭建

* 自定义inputFormat
* 背景
	* 面临处理大量小文件时，在业务处理之前，在HDFS上使用mapreduce程序对小文件进行合并
* 实现

	* MyInputFormat类
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-f652b2011db93203.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* MyRecordReader类
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-7f4a4b90319a0314.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-7c28982773dfd156.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-19afe05fb08b940b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* MyInputMapper类
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-3bab8a4a105a3338.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	
* 自定义outputFormat
* 背景
	* 现有一些原始日志需要做增强解析处理，流程：
	* 1、从原始日志文件中读取数据
	* 2、根据日志中的一个URL字段到外部知识库中获取信息增强到原始日志
	* 3、如果成功增强，则输出到增强结果目录；如果增强失败，则抽取原始数据中URL字段输出到待爬清单目录
* 实现
	* MyOutputFormat类
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-eb1a13ae3c9e1b40.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* MyRecordWriter类
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-490fce58c6f9a0ee.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-254623b6275bb81f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* MyOutputMapper类 (此需求不需要，略)
	* InputOutputTest类
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-55df6aaa7dc77bff.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


* ![21.png](https://upload-images.jianshu.io/upload_images/14467401-44d5cb51ac70b279.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* ps：上面所记录的是一个需求，如下
* 读取两个文件，使用自定义inputformat一次性读取出来，然后在map中进行解析，最终将合法读取两个文件，使用自定义inputformat一次性读取出来，然后在map中进行解析，最终将合法
  的记录以<文件，记录>的形式输出到success.log中，不合法的记录以<文件，记录>的形式输出
  到error.log中,不执行reduce

* Hive环境搭建（Linux环境）
	* 步骤
		* 1.解压apache-hive-1.2.1-bin.tar压缩包
		* 2.mv apa... hive 可以将压缩包改名
		* 3.进入hive，pwd获取路径，复制
		* 4.sudo vim /etc/profile 配置环境
		```
		export HIVE_HOME=/home/hadoop/hive
		PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:
		$HADOOP_HOME/sbin:$HIVE_HOME/bin
		```
		* 5.  . /etc/profile 执行一次
		* 6.hive 检测是否成功
		* 7.安装mysql
			```
			1.sudo yum -y install wget
			2.wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
			3.sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
			4.sudo yum -y install mysql-server
			5.sudo yum -y install mysql
			6.systemctl start mysqld
			7.mysql -u root -p(没密码)

			```
		* 8.给root修改密码
			```
			老版本方法：
			UPDATE mysql.user SET authentication_string=PASSWORD('6757DUgu') where USER='root';
			新版本方法：
			UPDATE mysql.user SET Password=PASSWORD('新密码') where USER='root’;
			flush privileges;
			exit
			```
		* 9.在hive/conf目录下创建hive-site.xml，并加入连接mysql数据库的配置
			```
			<configuration>
				<property>
					<name>javax.jdo.option.ConnectionURL</name>
					<value>
					jdbc:mysql://'IP':3306/hivedb?createDatabaseIfNotExist=true
					</value>
				</property>
				<property>
					<name>javax.jdo.option.ConnectionDriverName</name>
					<value>com.mysql.jdbc.Driver</value>
				</property>
				<property>
					<name>javax.jdo.option.ConnectionUserName</name>
					<value>root</value>
				</property>
				<property>
					<name>javax.jdo.option.ConnectionPassword</name>
					<value>'mysql密码'</value>
				</property>
			</configuration>
			```
		* 10.启动hive查看是否正常
		
	* 设置远程访问数据库：
		* 将mysql-connector-java-5.1.34包导入/home/hadoop/hive/lib下
		* 登录后输入：
		* GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'youmysqlpassword' WITH GRANT OPTION;
		* FLUSH PRIVILEGES
		* service mysqld restart
		* ps：为使用mysql可视化app设置的
