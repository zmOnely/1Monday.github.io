## MapReduce
* driver详解
* ![driver.png](https://upload-images.jianshu.io/upload_images/14467401-7a3b041774152a10.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* Combiner原理与使用
	* combiner类
	* ![combiner.png](https://upload-images.jianshu.io/upload_images/14467401-0380f3d766237990.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* reduce类
	* ![reduce.png](https://upload-images.jianshu.io/upload_images/14467401-32d6d9127c8685a9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* driver类
	* ![job.png](https://upload-images.jianshu.io/upload_images/14467401-f720b78a286aa791.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 关于combiner的几点说明
		* 1.意义是对每一个maptask的输出进行局部汇总，以减小网络传输量
		* 2.combiner是MR程序中Mapper和Reducer之外的一种组件，父类是Reducer
		* 3.combiner和reducer的区别在于运行的位置：
			* combiner是在每一个maptask所在的节点运行
			* reducer是接收全局所有Mapper的输出结果
			* ps：比如平均数的例子，我们输入的文件是avg.txt，avg1.txt，combiner的作用是把每个
			* 文件里面的数算平均，最后把这个平均数传给reduce，而reduce作用是将combiner传来的
			* 每个文件的平均数最后再算平均数输出
		* 4. combiner能够应用的前提是不能影响最终的业务逻辑，输出kv应该跟reducer的输入kv类型要
		* 对应起来
	* ![Combiner原理.png](https://upload-images.jianshu.io/upload_images/14467401-057ed3bdf5f64e44.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* mr原理
* ![mapreduce原理.png](https://upload-images.jianshu.io/upload_images/14467401-acebf77302455a22.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* ![图片1.png](https://upload-images.jianshu.io/upload_images/14467401-260a2f61c82bfddc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)	
	* 结构
		* MRAppMaster：负责整个程序的过程调度及状态协调
		* mapTask：负责map阶段的整个数据处理流程
		* ReduceTask：负责reduce阶段的整个数据处理流程
	* 流程解析
		```
		1、一个mr程序启动的时候，最先启动的是MRAppMaster，MRAppMaster启动后根据本次job的描述信息，
		   计算出需要的maptask实例数量，然后向集群申请机器启动相应数量的maptask进程
		2、maptask进程启动之后，根据给定的数据切片范围进行数据处理，主体流程为：
		a)利用客户指定的inputformat来获取RecordReader读取数据，形成输入KV对
		b)将输入KV对传递给客户定义的map()方法，做逻辑运算，并将map()方法输出的KV对收集到缓存
		c)将缓存中的KV对按照K分区排序后不断溢写到磁盘文件
		3、MRAppMaster监控到所有maptask进程任务完成之后，会根据客户指定的参数启动相应数量的
		   reducetask进程，并告知reducetask进程要处理的数据范围（数据分区），Reducetask进程
		   启动之后，根据MRAppMaster告知的待处理数据所在位置，从若干台maptask运行所在机器上
		   获取到若干个maptask输出结果文件，并在本地进行重新归并排序，然后按照相同key的KV为
		   一个组，调用客户定义的reduce()方法进行逻辑运算，并收集运算输出的结果KV，然后调用
		   客户指定的outputformat将结果数据输出到外部存储
		```
	* maptask--切片机制
		* 1.每一个切片分配一个maptask
		* 2.切片定义在InputFormat类中的getSplit()方法
		* 3.切片大小，默认等于block大小
		* 4.切片时不考虑数据集整体，而是逐个针对每一个文件单独切片
		* 有俩文件，320M，10M，要分成四个切片
		* 5.切片大小设置
		```
		maxsize（切片最大值）：
		参数如果调得比blocksize小，则会让切片变小，而且就等于配置的这个参数的值
		minsize （切片最小值）：
		参数调的比blockSize大，则可以让切片变得比blocksize还大
		```
		* ![split.png](https://upload-images.jianshu.io/upload_images/14467401-cf744aac83c41829.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ![maptask.png](https://upload-images.jianshu.io/upload_images/14467401-92476927a70d5e8f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* map经验之谈请参考文档
	* reducetask并行度的决定
	```
	reducetask的并行度同样影响整个job的执行并发度和执行效率，但与maptask的并发数
	由切片数决定不同，Reducetask数量的决定是可以直接手动设置：
	默认值是1，手动设置为4
	job.setNumReduceTasks(4);
	如果数据分布不均匀，就有可能在reduce阶段产生数据倾斜
	注意： 
	reducetask数量并不是任意设置，尽量不要运行太多的reduce task
	对大多数job来说，最好reduce的个数最多和集群中的reduce持平，
	或者比集群的 reduce slots小；这个对于小集群而言，尤其重要
	```
	* mr程序运行模式
		* 本地运行模式
		```
		（1）mapreduce程序是被提交给LocalJobRunner在本地以单进程的形式运行
		（2）而处理的数据及输出结果可以在本地文件系统，也可以在hdfs上
		（3）本地模式非常便于进行业务逻辑的debug，只要在eclipse中打断点即可
		（4）写一个程序，不要带集群的配置文件
		（本质是你的mr程序的conf中是否有mapreduce.framework.name=local
		以及yarn.resourcemanager.hostname参数）
		ps：如果在windows下想运行本地模式来测试程序逻辑，需要在windows中配置环境变量，
		    请参考第三周笔记
		```
		* 集群运行模式
		```
		（1）将mapreduce程序提交给yarn集群resourcemanager，分发到很多的节点上并发执行
		（2）处理的数据和输出结果应该位于hdfs文件系统
		（3）提交集群的实现步骤：
		将程序打成JAR包，然后在集群的任意一个节点上用hadoop命令启动
		hadoop jar wordcount.jar cn.itcast.bigdata.mrsimple.WordCountDriver inputpath outputpath
		
		在yarn-site.xml的配置：
		<property>
			<name>yarn.resourcemanager.address</name>
			<value>namenodes:8032</value>
		</property>
		<property>
			<name>yarn.resourcemanager.scheduler.address</name>
			<value>namenodes:8030</value>
		</property>
		<property>
			<name>yarn.resourcemanager.resource-tracker.address</name>
			<value>namenodes:8031</value>
		</property>		
		```
		* ![31.png](https://upload-images.jianshu.io/upload_images/14467401-229fafd58b850844.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		