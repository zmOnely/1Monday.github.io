## MapReduce
* Map的join
	* 几点说明
		* 1.不用reduce，直接在driver区设置缓存文件路径
		* 2.主表路径是在运行时写入的，从表路径是在driver区中设置的
	* setup
	* ![setup.png](https://upload-images.jianshu.io/upload_images/14467401-0c7403a17015b555.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	
	* mapper
	* ![map.png](https://upload-images.jianshu.io/upload_images/14467401-fea04475314efe53.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* driver
	* ![job.png](https://upload-images.jianshu.io/upload_images/14467401-c62c0d8ae22ccec5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* ![job1.png](https://upload-images.jianshu.io/upload_images/14467401-3f66f2bc9236f416.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* bean
	* ![bean.png](https://upload-images.jianshu.io/upload_images/14467401-950138be5b3efa4e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 用于setup方法为从从表中取出的goods信息赋值的setGoods方法
	* ![setgoods.png](https://upload-images.jianshu.io/upload_images/14467401-389fe7e07d9a317f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 用于map方法的setOrder方法
	* ![setorder.png](https://upload-images.jianshu.io/upload_images/14467401-d05df74dbf640db8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 用于map方法追加order中缺少的goods信息的setGoods方法
	* ![setgoods.png](https://upload-images.jianshu.io/upload_images/14467401-52301b20fbf3806b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 分组
	* 需求：获取每个订单中商品价格最高的所有信息，即将所有信息根据oid分组，取出每组中的
	  价格最高的商品信息  
	* 原始数据
	* ![data.png](https://upload-images.jianshu.io/upload_images/14467401-8584a14a5f9d34ca.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 最终效果
	* ![res.png](https://upload-images.jianshu.io/upload_images/14467401-ebfe6602cc4fd113.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* bean
	* ![bean1.png](https://upload-images.jianshu.io/upload_images/14467401-5059ac2fd8c7a8e3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![bean.png](https://upload-images.jianshu.io/upload_images/14467401-f1af47994ef36dce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![setOrder.png](https://upload-images.jianshu.io/upload_images/14467401-2dcc4077b5d6b1df.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* mapper
	* 
	* reduce
	* ![reduce.png](https://upload-images.jianshu.io/upload_images/14467401-71581a87e60596b6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 分组自定义类
	* ![group.png](https://upload-images.jianshu.io/upload_images/14467401-c2950b5e3e714886.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* driver
	* ![job.png](https://upload-images.jianshu.io/upload_images/14467401-35ff6bc8133ff919.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ps：如果不想在key或者value中输出数据，就使用NullWritable，请注意看图中代码
	