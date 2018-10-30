## HDFS原理
* [参考ppt，需要请下载~~](https://zmonely.github.io/zmOnely/thirdWeek/hdfs.docx)
* hadoop的组成
	* HDFS  分布式文件系统
	* YARN  资源管理调度
	* MapReduce 计算框架(离线)
* HDFS前言
	* 设计思想
		* 将大文件、大批量文件，分布式存放在大量服务器上，以便于采取分而治之的方式对海量数据进行运算分析
	* 在大数据系统中作用
		* 为各类分布式运算框架（如：mapreduce，spark，tez）提供数据存储服务
* 概念
	* 它是一个文件系统，用于存储文件，通过统一的命名空间——目录树来定位文件；
	* 它是分布式的，由很多服务器联合起来实现其功能，集群中的服务器有各自的角色
* 特性
	```
	（1）HDFS中的文件在物理上是分块存储(block)，块的大小可以通过配置参数(dfs.blocksize)
	     来规定，默认大小在hadoop2.x版本中是128M，老版本中是64M
	（2）HDFS文件系统会给客户端提供一个统一的抽象目录树，客户端通过路径来访问文件，
		 形如：hdfs://namenode:port/dir-a/dir-b/dir-c/file.data
	（3）目录结构及文件分块信息(元数据)的管理由namenode节点承担，namenode是HDFS集群主
		 节点，负责维护整个hdfs文件系统的目录树，以及每一个路径（文件）所对应的block块信息
		 (block的id，及所在的datanode服务器)
	（4）文件的各个block的存储管理由datanode节点承担，datanode是HDFS集群从节点，每一个block
		 都可以在多个datanode上存储多个副本（副本数量也可以通过参数设置dfs.replication）
	（5）HDFS是设计成适应一次写入，多次读出的场景，且不支持文件的修改
	```
* hdfs的工作机制
	* 概述
	```
	1.HDFS集群分为两大角色：NameNode、DataNode、(Secondary Namenode)
	2.NameNode负责管理整个文件系统的元数据
	3.DataNode 负责管理用户的文件数据块
	4.文件会按照固定的大小（blocksize）切成若干块后分布式存储在若干台datanode上
	5.每一个文件块可以有多个副本，并存放在不同的datanode上
	6.Datanode会定期向Namenode汇报自身所保存的文件block信息，而namenode则会负责
	  保持文件的副本数量
	7.HDFS的内部工作机制对客户端保持透明，客户端请求访问HDFS都是通过向namenode申
	  请来进行
	```
* HDFS写数据流程
	* 概述
	```
	客户端要向HDFS写数据，首先要跟namenode通信以确认可以写文件并获得接收文件block
	的datanode，然后，客户端按顺序将文件逐个block传递给相应datanode，并由接收到block
	的datanode负责向其他datanode复制block的副本
	```
	* 步骤解析
	```
	1、根namenode通信请求上传文件，namenode检查目标文件是否已存在，父目录是否存在
	2、namenode返回是否可以上传
	3、client请求第一个 block该传输到哪些datanode服务器上
	4、namenode返回3个datanode服务器ABC
	5、client请求3台dn中的一台A上传数据（本质上是一个RPC调用，建立pipeline），A收到
	   请求会继续调用B，然后B调用C，将真个pipeline建立完成，逐级返回客户端
	6、client开始往A上传第一个block（先从磁盘读取数据放到一个本地内存缓存），以packet
	   为单位，A收到一个packet就会传给B，B传给C；A每传一个packet会放入一个应答队列等待
	   应答
	7、当一个block传输完成之后，client再次请求namenode上传第二个block的服务器
	```
	* 步骤图
	* ![6.png](https://upload-images.jianshu.io/upload_images/14467401-d960d06e2c35276f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* HDFS读数据流程
	* 概述
	```
	客户端将要读取的文件路径发送给namenode，namenode获取文件的元信息（主要是block的存放位置信息）
	返回给客户端，客户端根据返回的信息找到相应datanode逐个获取文件的block并在客户端本地进行数据追
	加合并从而获得整个文件
	```
	* 详细步骤解析
	```
	1、跟namenode通信查询元数据，找到文件块所在的datanode服务器
	2、挑选一台datanode（就近原则，然后随机）服务器，请求建立socket流
	3、datanode开始发送数据（从磁盘里面读取数据放入流，以packet为单位来做校验）
	4、客户端以packet为单位接收，现在本地缓存，然后写入目标文件
	```
	* 步骤图
	* ![7.png](https://upload-images.jianshu.io/upload_images/14467401-ed65afb62ac5b345.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* NAMENODE工作机制
	* NAMENODE职责
		* 负责客户端请求的响应
		* 元数据的管理（查询，修改）
	* 元数据管理
		* namenode对数据的管理采用了三种存储形式：
			* 内存元数据(NameSystem)
			* 磁盘元数据镜像文件
			* 数据操作日志文件（可通过日志运算出元数据）	
	* 元数据存储机制
		* 内存中有一份完整的元数据(内存meta data)
		* 磁盘有一个“准完整”的元数据镜像（fsimage）文件(在namenode的工作目录中)
		* 用于衔接内存metadata和持久化元数据镜像fsimage之间的操作日志（edits文件）
			* ps：当客户端对hdfs中的文件进行新增或者修改操作，操作记录首先被记入edits日志
			      文件中，当客户端操作成功后，相应的元数据会更新到内存meta.data中	
	* 元数据的checkpoint
		* 概述
			* 每隔一段时间，会由secondary namenode将namenode上积累的所有edits和一个最新的fsimage
			  下载到本地，并加载到内存进行merge（这个过程称为checkpoint）
		* checkpoint的附带作用
			* namenode和secondary namenode的工作目录存储结构完全相同，所以，当namenode故障
			  退出需要重新恢复时，可以从secondary namenode的工作目录中将fsimage拷贝到namenode
			  的工作目录，以恢复namenode的元数据	
		* checkpoint操作的触发条件配置参数
		* ![9.png](https://upload-images.jianshu.io/upload_images/14467401-d5592267d239d4f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 过程图
		* ![8.png](https://upload-images.jianshu.io/upload_images/14467401-a8e787dff97c27ab.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 元数据的目录说明
<<<<<<< HEAD
* DATANODE的工作机制
	* 概述
		* Datanode工作职责：
			* 存储管理用户的文件块数据
			* 定期向namenode汇报自身所持有的block信息（通过心跳信息上报，即心跳机制）
			```
			<property>
				<name>dfs.blockreport.intervalMsec</name>
				<value>3600000</value>
				<description>Determines block reporting interval in milliseconds.</description>
			</property>
			```
	* Datanode掉线判断时限参数
		* datanode进程死亡或者网络故障造成datanode无法与namenode通信，namenode不会立即把该节点判定为死亡，
		  要经过一段时间，这段时间暂称作超时时长;
		* HDFS默认的超时时长为10分钟+30秒;
		* 如果定义超时时间为timeout，则超时时长的计算公式为：
		  timeout = 2 * heartbeat.recheck.interval + 10 * dfs.heartbeat.interval
		  而默认的heartbeat.recheck.interval 大小为5分钟，dfs.heartbeat.interval默认为3秒
		* ps：hdfs-site.xml 配置文件中的heartbeat.recheck.interval的单位为毫秒，dfs.heartbeat.interval
		  的单位为秒，所以，假如heartbeat.recheck.interval设置为5000（毫秒），dfs.heartbeat.interval
		  设置为3秒，（默认），则总的超时时间为40秒	
		```
		<property>
			<name>heartbeat.recheck.interval</name>
			<value>2000</value>
		</property>
		<property>
			<name>dfs.heartbeat.interval</name>
			<value>1</value>
		</property>
		```
* HDFS的shell操作		
	* 前缀 
		* hadoop fs 命令
	* 常用命令参数
	* ![4.png](https://upload-images.jianshu.io/upload_images/14467401-08a2d904e65e5a8d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![5.png](https://upload-images.jianshu.io/upload_images/14467401-7594d5edb3699160.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* hadoop fs -appendToFile ~/input/append.txt /input/sources.txt
		* ps：本地文件 远程文件  ，将本地文件追加到远程文件
	* ![6.png](https://upload-images.jianshu.io/upload_images/14467401-f8ee91c647e2bee4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![7.png](https://upload-images.jianshu.io/upload_images/14467401-1a832150f3ca2b06.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![8.png](https://upload-images.jianshu.io/upload_images/14467401-cb88bdcc42b7b297.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![9.png](https://upload-images.jianshu.io/upload_images/14467401-5075dcf100f72490.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
=======
	
## HDFS的shell操作		
* 前缀 
	* hadoop fs 命令
* 常用命令参数
* ![4.png](https://upload-images.jianshu.io/upload_images/14467401-08a2d904e65e5a8d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* ![5.png](https://upload-images.jianshu.io/upload_images/14467401-7594d5edb3699160.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* hadoop fs -appendToFile ~/input/append.txt /input/sources.txt
	* ps：本地文件 远程文件  ，将本地文件追加到远程文件
* ![6.png](https://upload-images.jianshu.io/upload_images/14467401-f8ee91c647e2bee4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* ![7.png](https://upload-images.jianshu.io/upload_images/14467401-1a832150f3ca2b06.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* ![8.png](https://upload-images.jianshu.io/upload_images/14467401-cb88bdcc42b7b297.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* ![9.png](https://upload-images.jianshu.io/upload_images/14467401-5075dcf100f72490.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
>>>>>>> 4882011654d5c180f1dfb8897cac1b3fdac6298a

		

















