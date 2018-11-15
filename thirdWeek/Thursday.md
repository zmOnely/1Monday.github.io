## MapReduce入门
* [参考ppt，需要请下载~~](https://zmonely.github.io/zmOnely/thirdWeek/MapReduce.docx)
* 概述
	* MapReduce是一种并行编程模型，用于对大规模数据集（大于1TB）的并行处理；
	* Hadoop中实现了MapReduce框架，为用户提供MapReduce程序的开发接口和运行环境
	* Map(映射)：对一些独立元素组成的列表的每一个元素进行指定的操作，可以高度并行
	* Reduce(化简)：对一个列表的元素进行合并
	* Hadoop MapReduce 是Google MapReduce的克隆版
* 特点
	* 易于编程
	* 良好的拓展性
	* 高容错性
	* 适合PB级以上海量数据的离线处理
	* 不适合实时计算和流式计算
		* 实时计算
			* 在毫秒级或者秒级内返回结果
		* 流式计算
			* MapReduce的输入数据集是静态的，不能动态变化
			* MapReduce自身的设计特点决定了数据源必须是静态的
* MapReduce的原因
	* 由于单机上无法处理海量数据，因为内存受限，磁盘受限，运算能力又受限；
	* 所以hadoop的hdfs文件系统来解决海量数据存储问题，而hadoop的MapReduce用
	  来解决海量数据计算的问题，将分布式计算的复杂交由MapRedcue			
* 编程模型
	* MapReduce将作业整个运行过程分为两个阶段：
		* Map阶段
			* 由一定数量的Map Task组成
				* 输入数据格式解析：InputFormat
				* 输入数据处理：Mapper
				* 数据分区：Partitioner
		* Reduce阶段
			* 由一定数量的Reduce Task组成
				* 数据远程拷贝
				* 数据按照key排序
				* 数据处理：Reducer
				* 数据输出格式：OutputFormat
* 一个典型例子--WordCount				
	* 应用场景
		* 搜索引擎中，统计最流行的K个搜索词
		* 统计搜索词频率，帮助优化搜索词提示
		* ![51.png](https://upload-images.jianshu.io/upload_images/14467401-8a2999adce1c405c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 详细分析
		* 1.将文件拆分成splits，并将文件按行分割形成<key,value>对，这一步由MapReduce框架
		    自动更新完成，其中偏移量(即key值)包括了回车所占的字符数
		* ![52.png](https://upload-images.jianshu.io/upload_images/14467401-ea8911c332872a10.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 2.将分割好的<key,value>对交给用户定义的map方法进行处理，生成新的<key,value>对
		* ![53.png](https://upload-images.jianshu.io/upload_images/14467401-9c8d8eb8e7857a02.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 3.得到map方法输出的<key,value>对后，Mapper会将它们按照key值进行排序，并执行Combine
		    过程，将key至相同value值累加，得到Mapper的最终输出结果
		* ![54.png](https://upload-images.jianshu.io/upload_images/14467401-d65b40ce94750a82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* Reducer先对从Mapper接受的数据进行排序，再交由用户自定义的reduce方法进行处理，
		  得到新的<key,value>对，并作为WordCount的输出结果
		* ![55.png](https://upload-images.jianshu.io/upload_images/14467401-c768bebc0fbd1ba6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 * 小结
	* 使用MapReduce，我们需要写三个部分，Mapper区的map()方法，Reducer区的reduce()方法，Reducer区的reduce
	  Driver区的main()方法	
	* ![1.jpg](https://upload-images.jianshu.io/upload_images/14467401-a0c19f951e8661ad.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![2.jpg](https://upload-images.jianshu.io/upload_images/14467401-15029c57bc80c360.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![56.png](https://upload-images.jianshu.io/upload_images/14467401-dfb6348e3631c931.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![1.jpg](https://upload-images.jianshu.io/upload_images/14467401-6b360c96daaf5b68.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![1.jpg](https://upload-images.jianshu.io/upload_images/14467401-2ce4ed9d1aff5ccf.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	
	
		