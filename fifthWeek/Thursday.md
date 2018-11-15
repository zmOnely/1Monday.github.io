## Hive的jdbc接口的一些命令
* 动态分区--两个分区的使用

	* 1.创建一个普通的表
		* create table zlbir(id int,name string,year string,month string)
		* row format delimited fields terminated by '\t';

	* 2.将数据导入表中
		* load data inpath '/dbdata/bir.log' into table zlbir;

	* 3.创建一个分区表
		* create table births(id int,name string)
		* partitioned by (year string,month string)
		* row format delimited fields terminated by '\t';

	* 4.设置解除严格模式
		* set hive.exec.dynamic.partition.mode=nonstrict;

		* ![43.png](https://upload-images.jianshu.io/upload_images/14467401-2aadd9b7bd6f54d2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 5.将普通表数据加入到分区表中
		* insert into births partition(year,month)
		* select id,name,year,month from zlbir;

		* ![42.png](https://upload-images.jianshu.io/upload_images/14467401-ac4fc16bde9dcdcf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 分桶表

	* 1.创建一个普通的表
		* create table zorder(oid string,orderno string,price int,gid int)
		* row format delimited fields terminated by '\t';

	* 2.将数据加进去
		* load data inpath '/dbdata/order.log' into table zorder;

	* 3.创建分桶表
		* create table orderbucket(oid string,orderno string,price int,gid int)
		* clustered by(gid) into 3 buckets
		* row format delimited fields terminated by '\t';

	* 4.设置允许分桶
		* set hive.enforce.bucketing=true;

	* 5.将普通表中数据加入分桶表，进行分桶
		* insert into orderbucket
		* select * from zorder;
	* ps：最大的作用是用来提高 join 操作的效率	
* 分组
	* 1.创建一个普通的表
		* create table company_emp(id int,name string,money int,dep string)
		* row format delimited fields terminated by '\t';
		* ![company.png](https://upload-images.jianshu.io/upload_images/14467401-45f7d9c1e9fde0a5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 2.将数据导入表中
		* load data inpath '/dbdata/company.log' into table company_emp;

	* 3.将表根据职位进行分组
		* select dep,avg(money)
		* from company_emp
		* group by dep;
		* ![cc.png](https://upload-images.jianshu.io/upload_images/14467401-3c3fd3cacdc6f92a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ps：
	```
	1.使用分组就不再是逐行执行模式了，会根据分组的key以分组
	  模式执行，所以数据都是一组一组的，没法调用除了分组key
	  和聚合函数（属性）之外的单独属性
	2.使用聚合函数得到的结果默认的字段名不好使，要进行调用可
	  以取个别名，就可以在条件中使用了
	```
* hiving
	* 对分组中的数据进行条件筛选
	* select dep,avg(money) avg_money
	* from company_emp
	* group by dep
	* having avg_money>1000
* 排序

	* order by
		* 会对输入做全局排序，因此只有一个reducer，
		  只有一个 reduce task的结果，比如文件名是000000_0，
		  会导致当输入规模较大时，需要较长的计算时间
		* select * from goods order by gid;  
		* ![yuan.png](https://upload-images.jianshu.io/upload_images/14467401-2a552a6bbb7099c7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* eg：
		
		* 获取按分数倒序的前三个学生
	    * select name,score from s_student order by score desc limit 3;
		
	* sort by
		* 不是全局排序，其在数据进入reducer前完成排序，
	      因此，如果用sort by进行排序，并且设置mapred.reduce.tasks>1，
		  则 sort by只保证每个reducer的输出有序，不保证全局有序
		* set mapreduce.job.reduces=4;
		* select * from goods sort by gid;
		* ![sort.png](https://upload-images.jianshu.io/upload_images/14467401-a18da11885a2d51c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* distribute by
		* 根据指定的字段将数据分到不同的reducer，且分发算法是hash散列
		* ps：和分桶表类似
		* set mapreduce.job.reduces=3;
		* select * from goods distribute by gid;
		* ![by.png](https://upload-images.jianshu.io/upload_images/14467401-6325681c4f2f1ebe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* Cluster by
		* 除了具有distribute by的功能外，还会对该字段进行排序，如果
		  分桶和sort字段是同一个时，此时clustered by = distribute by + sort by，
		  如果要分桶的字段和要排序的字段不一样，就不能使用clustered by
		* select * from goods Cluster by gid;
		* ![cluster.png](https://upload-images.jianshu.io/upload_images/14467401-0ede4412037ba155.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 内连接查询
	* 源表
	* ![goods.png](https://upload-images.jianshu.io/upload_images/14467401-21b20480663aee90.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* ![order.png](https://upload-images.jianshu.io/upload_images/14467401-cca5580e9631074a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 内连接
		* select o.*,g.* from zorder o join goods g on o.gid = g.gid;
		* select o.*,g.* from zorder o inner join goods g on o.gid = g.gid;
		* ![1.png](https://upload-images.jianshu.io/upload_images/14467401-ed98e9b22a6f8f63.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 全连接
		* select o.*,g.* from zorder o full join goods g on o.gid = g.gid;
		* ![full.png](https://upload-images.jianshu.io/upload_images/14467401-eba12300508af43e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 左半连接
		* select o.*,g.* from zorder o left semi join goods g on o.gid = g.gid;
		* ![left.png](https://upload-images.jianshu.io/upload_images/14467401-6b4c6df18e789d3c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* in关键字
	* select * from zorder where o.gid in (select g.gid from goods g);
	* ![in.png](https://upload-images.jianshu.io/upload_images/14467401-45cc51776f004b5e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 数据类型
	* 源表
	* ![2.png](https://upload-images.jianshu.io/upload_images/14467401-5eaf6a2159dbe258.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 数组，日期
		* create table movies(name string,actors array<string>,time date)
		* row format delimited fields terminated by ','
		* collection items terminated by ':';
		* ![map.png](https://upload-images.jianshu.io/upload_images/14467401-32eced0e7365be24.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* map类型
		* create table maps(id int,name string,family map<string,string>,age int)
		* row format delimited fields terminated by ','
		* collection items terminated by '#'
		* map keys terminated by ':';
		* ![23.png](https://upload-images.jianshu.io/upload_images/14467401-d7184cc724e123fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* select name,family['father'] from maps;
		* ![1.png](https://upload-images.jianshu.io/upload_images/14467401-a6a545dae4c3468a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




















