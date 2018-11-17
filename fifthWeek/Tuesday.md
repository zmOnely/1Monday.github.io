## Hive基础
* [参考文档，需要请下载~~](https://zmonely.github.io/zmOnely/fifthWeek/hive.docx)
* [参考ppt，需要请下载~~](https://zmonely.github.io/zmOnely/fifthWeek/Hive03.ppt)
* 定义
	* Hive是基于Hadoop的一个数据仓库工具，可以将结构化的数据文件映射为一张数据库表，
	并提供类SQL查询功能，Hive底层是将SQL语句转换为MapReduce任务运行
* 使用原因
	* 操作接口采用类 SQL 的语法，提供快速开发的能力
	* 避免了写MapReduce，减少开发人员的学习成本
	* 功能扩展很方便
* 特点
	* 可扩展性：Hive可以自由的扩展集群的规模，而且一般情况下不需要重启服务
	* 延展性：Hive支持自定义函数UDF，用户可以根据自己的需求来实现自己的函数
	* 容错：良好的容错性，可以保障即使有节点出现问题，SQL语句仍可完成执行
* 用户接口
	* CLI：shell终端命令行，最常用（学习，调试，生产）
	* JDBC/ODBC：是Hive的基于JDBC操作提供的客户端，用户通过这连接至 Hive Server Web UI，通过浏览器访问Hive
	* Web GUI
* 元数据存储	
	```
	通俗的讲，元数据就是存储在Hive中的数据的描述信息，Hive中的元数据通常包括：
	表的名字，表的列和分区及其属性，表的属性（内部表和外部表），表的数据所在
	目录；
	Metastore默认存在自带的Derby数据库中；缺点就是不适合多用户操作，并且
	数据存储目录不固定，数据库和Hive所在的机器绑定，极度不方便管理；
	通常将元数据存储在我们自己创建的MySQL数据库（本地或远程）当中
	```
* 执行流程
	```
	HiveQL通过命令行或者客户端提交，经过Compiler编译器，运用 Metastore中的元
	数据进行类型检测和语法分析，生成一个逻辑方案(logical plan)，然后通过优化
	处理，产生一个MapReduce任务
	```
* Hive和Hadoop关系
	* ![22.png](https://upload-images.jianshu.io/upload_images/14467401-5756a909a9aa301a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* Hive依赖于HDFS存储数据，Hive将HQL转换成MapReduce执行，所以说Hive是基于Hadoop的
	一个数据仓库工具，实质就是一款基于HDFS的MapReduce计算框架
* Hive和RDBMS的对比
	* ![22.png](https://upload-images.jianshu.io/upload_images/14467401-460178fd80e03790.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* Hive具有SQL数据库的外表，但应用场景完全不同，Hive只适合用来做批量海量数据统计分析
* Hive的数据存储
	```
	1.Hive中所有的数据都存储在HDFS中，没有专门的数据存储格式
	2.只需要在创建表的时候告诉 Hive数据中的列分隔符和行分隔符，
	  Hive 就可以解析数据
	3.Hive 中包含以下数据模型：
		1.db：在hdfs中表现为${hive.metastore.warehouse.dir}
		  目录下一个文件夹
		2.table：在hdfs中表现所属db目录下一个文件夹
		3.external table：与table类似，不过其数据存放位置可
		  以在任意指定路径
		4.partition：在hdfs中表现为table目录下的子目录
		5.bucket：在hdfs中表现为同一个表目录下根据hash散列之
		  后的多个文件 桶
	```
* inoutput的示例
* 读取两个文件，使用自定义inputformat一次性读取出来，然后在map中进行解析，最终将合法
  的记录以<文件，记录>的形式输出到success.log中，不合法的记录以<文件，记录>的形式输出
  到error.log中,不执行reduce
* 代码请参考car工程  
	
	
	
	
	
	
	