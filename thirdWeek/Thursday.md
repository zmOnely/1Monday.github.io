## MapReduce入门
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
	