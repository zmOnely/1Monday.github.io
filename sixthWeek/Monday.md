* 窗口分区函数row_number() over()
	* 需求：将连续三天及以上有销售额的店铺进行展示
	```
	1.根据店铺进行分区,根据时间进行升序排序,生成行号
	  select *,row_number() over(partition by name order by times) 
	  as row_num from shop
	2.将得到的临时表中的times-row_num得到的差值如果相同表示是连续的,
	  因为要从上一次查询结果的临时表中读取数据,所以需要把上次的临时表
	  作为这次要from的表来用
	  select *,date_sub(times,row_num) as diff
	  from
	  (select *,row_number() over(partition by name order by times) 
	  as row_num from shop) as first
	3.将查询到的临时表再作为临时表进行from的表,从这个表中我们以店铺名
	  和剪出来的结果进行group分组，总分组的结果中取出店铺名和分组的记
	  录的个数,也就得到了这个店铺连续销售了几天
	  select name,count(*)
	  from
	  (select *,date_sub(times,row_num) as diff
	  from
	  (select *,row_number() over(partition by name order by times) 
	  as row_num from shop) as first) as res
	  group by name,diff
	4.根据需求将结果中连续销售三天及以上的店铺进行展示,所以需要对分组的结
	  果进行条件筛选,直接使用where不合适,所以我们需要使用having来对分组后
	  的结果进行筛选
	  select name,count(*) as res_count
	  from
	  (select *,date_sub(times,row_num) as diff
	  from
	  (select *,row_number() over(partition by name order by times)
	  as row_num from shop) as first) as res
	  group by name,diff having res_count >= 3
	```
* 创建自定义函数UDF(user definid function)步骤
	```
	1.需求分析
	2.写Java类继承UDF,实现evaluate方法
	3.对写好的代码进行单元测试
	4.将代码打成jar包上传到hive所在的服务器上
	5.在hive命令行界面通过add jar 自己的jar包的位置来讲我们的jar包真正的
	  加入到hive的运行时classpath中去,这样才能找到我们的类
	6.创建临时函数
	  create temporary function 方法名 as '全类名'
	  create temporary function biggest_in_three as 'com.lanou.util.MyUDF';

	```
* 实现
	* eg：
	* 求三个数最大值，并且返回下标
	* 1.类继承UDF类，需要导入jar包，jar包路径：

	* ![1.png](https://upload-images.jianshu.io/upload_images/14466577-8ba54f50bae40f3f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 2.写代码
	* ![image.png](https://upload-images.jianshu.io/upload_images/14466577-c2f2bb33f1c54467.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
  
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-f3de5c40683c4585.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



* 安装使用flume
	* 1.将apache-flume-1.6.0-bin.tar.gz压缩包传到/home/hadoop
	* 2.tar -zxf ... 解压
	* 3.![image.png](https://upload-images.jianshu.io/upload_images/14467401-7497179e6d19e21e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)	
	* 4.![image.png](https://upload-images.jianshu.io/upload_images/14467401-93f6275a551d2f72.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-f6e0cde6b912094a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 使用--netcat
	* 1.在flume目录下 mkdir myconf
	* 2.cd myconf/
	* 3.vim netcat.conf
	* 4.解压flume-conf，例子在里面，将其拷贝进netcat.conf
	* 5.复制会话，cd flume 注意路径问题！！
	* 6.```
		bin/flume-ng agent --conf conf --conf-file myconf/netcat.conf 
		--name a2 -Dflume.root.logger=INFO,console

		bin/flume-ng agent --conf conf --conf-file 自己创建的文件的路径
		--name a2 [-Dflume.root.logger=INFO,console](为了在控制台打印)
		```
	* 7.成功展示
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-69ffe2cfef2c657c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 8.回到在myconf路径下的那个会话
		* sudo yum install -y telnet
		* telnet localhost 55555 (相当于开启了和55555端口的聊天)
		* 发送一个hello，效果如下
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-5fd8aa496a0d5e46.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 另一端效果如下
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-e397befbaeafac77.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
