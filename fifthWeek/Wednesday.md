## Hive的jdbc接口命令
* 进入jdbc接口的方法
	* beeline
	* !connect jdbc:hive2://localhost:10000
	* 再复制一个会话，hiveserver2，保持打开状态即可
* 创建数据库
	* create database 数据库名;
* 展示所有数据库
	* show databases;
* ![图片1.png](https://upload-images.jianshu.io/upload_images/14467401-e54e6b40e731a323.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 注意：hive是不会检查用户导入表中的数据的！如果数据的格式跟表定义的格式
  不一致，hive也不会做任何处理（能解析就解析，解析不了就是null）；
* 创建内部表
	* create table 表名(id int,name string) 
	* row format delimited fields terminated by '\t';
	
* 创建外部表
	* create external table exzl(id int,name string)
	* row format delimited fields terminated by '\t';
	* location '文件夹路径！！';
	* 内部表和外部表的区别
		```
		1.通过external关键字来进行区分	
		2.删除或者清空内部表是清除相关元数据，并删除表数据目录，而如果是外部表，只会将
		  表的关联信息删除掉，对指定位置下的内容没任何影响，即只会清除相关元数据
		3.表目录位于hive的仓库目录/user/hive/warehouse；
		  表目录由建表用户自己指定，通常在location中规定
		```		
	
* 创建分区表
	* create table 表名(id int,name string)
	* partitioned by(year string,month string)
	* row format delimited fields terminated by '\t';
	* ![33.png](https://upload-images.jianshu.io/upload_images/14467401-08f1643e9678bba9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 分区表的实质是：在表目录中为数据文件创建分区子目录，以便于在查询时，
	  MR程序可以针对指定的分区子目录中的数据进行处理，缩减读取数据的范围，
	  提高效率
	* ps：可以根据一个及以上来分区，创建一个分区表时--partitioned；
		  查看表分区时--partitions；
		  创建动态分区表时--partition
		  
	
* 查看表分区
	* show partitions 表名;
* 查看现有的表
	* show tables;
* 查看表结构
	* desc 表名;
	* ![desc.png](https://upload-images.jianshu.io/upload_images/14467401-5bb24382830fe47b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 清空表
	* truncate table 表名;
* 查询表数据
	* select * from 表名;
	* select count(*) from man;
	* ![33.png](https://upload-images.jianshu.io/upload_images/14467401-d09f934ce6a01aed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 导入数据：
	* 从hdfs中导入数据
		* load data inpath 'hdfs上的路径' into table 表名;
	* 从本地导入数据
		* load data local inpath '本地路径' into table 表名;
	* ps：load导文件相当于剪切，如果使用了 OVERWRITE 关键字，则目标表（或者分区）中的内容会被覆盖	
* 修改表名
	* alter table 表名 rename to 新表名;
* 增加/改变/替换列
	* alter table 表名 add columns (sex string);
	* alter table 表名 change sex gender string;
	* alter table 表名 replace columns (id string,name string);
	* ps：替换，这两列将之前所有的都替换掉
* 删除表
	* drop table 表名;
	* ps：hive会从元数据库中清除关于这个表的信息；
	      从hdfs中删除这个表的表目录；
* 删除分区
	* alter table 表名 drop partition(sex='man');
* 增加分区
	* alter table 表名 add partition(sex='man');
* 插入数据
	* 普通插入
		* insert into 表名 values('1','zl');
	* 将其他表的数据添加到一个空表
		* insert into 表名 select * from man;
	* 将一张表数据直接插入新表中
		* create table 新表名 as select * from man;
	
* 静态分区
	* insert into zlpart partition(gender='woman')
	* select id,name,gender from persons;
* 动态分区
	* 使用场景：
		* 当想对数据进行分区的时候，你能拿到的数据却未必是已经分好区的文件，
		  并不能直接load data就能用，这时就经常使用动态分区解决这种问题给你
		  如下文件，把数据加入到按月份分区的表中
		  
		* ![如下文件.png](https://upload-images.jianshu.io/upload_images/14467401-aee73aaf0ffb31e9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 
	* 实现：
		```
		1.将混乱的数据传入一个表中；
		2.创建对应的分区表
		  create table zlpart(id int,name string) 
		  partitioned by (gender string)
		  row format delimited fields terminated by '\t';
		3.向分区表动态插入数据
		  insert into zlpart partition(gender)
		  select id,name,gender from persons;
		3.1如果要进行动态分区，就不要再partition(month)中给分区设置固定值，
		   不然就不是动态分区了
		3.2默认使用的是严格模式，不允许动态分区，需要在命令行执行
		   set hive.exec.dynamic.partition.mode=nonstrict
		3.3使用动态分区会将查询结果集的最后一个作为分区条件，所以select查询要注意
		```
 		
		

	