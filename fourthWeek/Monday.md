## MapReduce
* 在本地文件夹操作
* ![11.png](https://upload-images.jianshu.io/upload_images/14467401-22212472f6091b4d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 若在hdfs上操作
* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-0f33ce577adaaf14.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 分区的使用
	* 题目说明：待处理的文件是手机号，上行流量..，将其通过区号进行分组，
	* 假如"134"是北京，"135"是大连，"136"是上海，剩下放在一个组
	* 步骤
	```
	1.设置setPartitionerClass和setNumReduceTasks,注意数量问题
	2.创建分区的类,继承Partition类,实现getPartition方法
	3.根据自己的业务逻辑,通过对key,value,count的操作利用返回值来得到当前
	  这个map输出的内容要进哪个分区
	```
	* ![13.png](https://upload-images.jianshu.io/upload_images/14467401-bda1b0448c35b87c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![14.png](https://upload-images.jianshu.io/upload_images/14467401-ef4383c4e15d49a9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 自定义类的序列化方法的重写
	* 1.如果在context.write(key,value)中要提交的key，value是自定义的类，要对类进行序列化
	* 如果自定义的类是key，实现WritableComparable接口；是value，实现Writable接口
	* 2.key要排序的，所以必须提供compareTo方法，泛型要不要加根据实际情况
	* 3.调用者 `<` 传入者，返回1，降序
	* ![21.png](https://upload-images.jianshu.io/upload_images/14467401-8bcd28a52ec277e1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* key排序问题
	* eg：按总流量进行排序，把上次计算之后的输出文件作为下一个mr的输入，多mr串行
	* map()方法
	* ![map.png](https://upload-images.jianshu.io/upload_images/14467401-a28a76c31343d697.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* reduce()方法
	* ![reduce.png](https://upload-images.jianshu.io/upload_images/14467401-3aea374efa594032.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 自定义类实现核心部分
	* ![bean.png](https://upload-images.jianshu.io/upload_images/14467401-0415d209e76542b4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* driver()方法 略