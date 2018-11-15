### MapReduce的使用
* ps：我们该做的工作，代码是怎样的？
* 例一：统计手机号，上行流量
* 步骤
	* 第一步
		* 创建一个类，写map方法
		* ![map.png](https://upload-images.jianshu.io/upload_images/14467401-c737c6bbc50b7d4c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 第二步
		* 创建一个类，写reduce方法
		* ![reduce.png](https://upload-images.jianshu.io/upload_images/14467401-8799891fdee9ff89.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 第三步
		* 修改main类
		* ![main.png](https://upload-images.jianshu.io/upload_images/14467401-0ca6adb273616393.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 例二：统计手机号，上行流量，下行流量，总流量
* 步骤
	* 第一步 
		* 要根据数据进行建模，俗称创建实体类
			* 标准的javaBean，+ toString()方法 + [有参构造]
	* 第二步
		* 创建一个类，写map方法
			* 要考虑map方法的形参怎么写，map方法当中怎么对数据进行切割筛选
			* 将数据放入自定义的实体类当中
			* 考虑好map方法输出的key与value，将结果写入磁盘
			* ps：
				* 自定义的实体类一定要支持序列化serializale，serializale是java提供的序列化方法；
				* hadoop更建议使用hadoop自身提供的writableComparable接口来实现序列化与反序列化，
				  此接口需要实现write（）写入文件和readFields（）从文件中读取的方法，否则在
				  reduce阶段获取不到数据，但一定要注意readFields（）方法中调用read方法的时候一定
				  要按照写入的顺序进行读取，对我们属性进行赋值，否则会导致输出结果数据错乱			      
		* ![map.png](https://upload-images.jianshu.io/upload_images/14467401-71b35c66577f8058.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 第三步
		* 创建一个类，写reduce方法
			* reduce当中要注意形参和输出位置，以及在driver区对应好reduce要输出的类型
			* 将map的输出结果进行循环相加
		* ![reduce.png](https://upload-images.jianshu.io/upload_images/14467401-40c232bea8638b43.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 第四步
		* 修改main类
			* 注意各个对应类
		* ![main.png](https://upload-images.jianshu.io/upload_images/14467401-241105953f649dbe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		
		
			