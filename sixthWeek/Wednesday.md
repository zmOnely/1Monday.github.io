### 安装azkaban步骤
* 1.将azkaban-executor-server-2.5.0.tar.gz；存放了执行器
      azkaban-sql-script-2.5.0.tar.gz；存放azkaban运行需要的sql
	  (sql倒完了这就没用了)
	  azkaban-web-server-2.5.0.tar.gz；存放web服务器
	  create-all-sql-2.5.0.sql 完整的sql文件，只执行它就可以
	  压缩包解压  
* 2.azkaban-executor-2.5.0 启动，关闭执行器  start/shutdown
    azkaban.properties
     
	 azkaban-web-2.5.0 启动，关闭服务器
	 azkaban.properties 设置时间，设置mysql的信息，jetty密码等同于ssl的密钥
	 azkaban-users.xml 设置登录azkaban的用户及其权限
* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-3dd0530321dcbf6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## Sqoop	 
###	安装sqoop步骤
* 1.将压缩包传到/home/hadoop路径下，解压
* 2.如果嫌弃名字太长，改名
	* mv sqoop-1.4.5.bin__hadoop-2.0.4-alpha sqoop
* 3.修改配置文件
	* cd sqoop
	* cd conf/
	* cp sqoop-env-template.sh sqoop-env.sh
	* vim sqoop-env.sh
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-5453b78a1851387e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 4.检测是否配置成功
	* 在/home/hadoop/sqoop下
	* bin/sqoop help
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-34075809894e84ed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 这样即为成功
### sqoop的使用
* 数据的导入(mysql-->hdfs) 	
	* 导入表数据到hdfs
		```
		bin/sqoop import \
		--connect jdbc:mysql://172.18.24.227:3306/zlsqop \
		--username root \
		--password root \
		--table users \
		--m 1
		```
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-1698b147f248b53e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 检查结果
		* hadoop fs -cat /user/hadoop/users/part-m-00000
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-cdd7b220e16f2353.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ps：
			* 1."\"的作用是可以换行，但不执行;
			* 2.解决目录存在问题，设置输出位置，默认路径/user/hadoop/users
			* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-ade775be82c53485.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

			  ```
			  bin/sqoop import \
			  --connect jdbc:mysql://172.18.24.227:3306/zlsqop \
			  --username root \
			  --password root \
			  --target-dir 想存放的路径
			  --table users \
			  --m 1
			  ```
			* 3.为输出结果设置分隔符
			  ```
			  bin/sqoop import \
			  --connect jdbc:mysql://172.18.24.227:3306/zlsqop \
			  --username root \
			  --password root \
			  --table users \
			  --fields-terminated-by '\t' \
			  --m 1
			  ```
			* 4.只获取部分字段的数据，加条件
				* 只在最后面加上 --columns name,pwd即可
			  			
				
	* 导入关系表到hive
		```
		bin/sqoop import \
		--connect jdbc:mysql://172.18.24.198:3306/zlsqop \
		--username root \
		--password root \
		--table users \
		--hive-import \
		--m 1
		```
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-0aa14ccdf38459db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 增量导入
		```
		bin/sqoop import \
		--connect jdbc:mysql://172.18.24.198:3306/zlsqop \
		--username root \
		--password root \
		--table users --m 1 \
		--incremental append \
		--check-column id \
		--last-value 5
		```
		* ps：根据id来区分，上一个表的最后一个id为5，之后添加的所有数据都是新增加的
* 数据的导出(hdfs-->mysql)
	```
	bin/sqoop export \
	--connect jdbc:mysql://172.18.24.198:3306/zlsqop \
	--username root \
	--password root \
	--table users \
	--export-dir /sqop/export
	```
	* 查看结果
		* 打开mysql数据库，查询
	* ps：导出前，目标表必须存在于目标数据库中；
	默认操作是从将文件中的数据使用INSERT语句插入到表中；
  更新模式下，是生成UPDATE语句更新表数据
	
	