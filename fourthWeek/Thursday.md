## MapReduce
* Reduce的join
	* 例子：订单货物，order是主表
	* ps：join就像mysql中的外连接，把哪个表作为主表，就以谁为主
	* ![job.png](https://upload-images.jianshu.io/upload_images/14467401-83203f4e5dc13660.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* order文档
	* ![order.png](https://upload-images.jianshu.io/upload_images/14467401-d65d5df22a87cd7d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* goods文档
	* ![goods.png](https://upload-images.jianshu.io/upload_images/14467401-d7eba424a1b82f5c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* map方法执行后的结果
	* ps：俩输出文件，这是我手动整合排序之后的，为了理解
	* ![11.png](https://upload-images.jianshu.io/upload_images/14467401-714aa981621fcaad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 最终效果
	* ![结果.png](https://upload-images.jianshu.io/upload_images/14467401-afec292baceec8ce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* mapper
	* ![map.png](https://upload-images.jianshu.io/upload_images/14467401-a9fa2be3f0120265.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* reducer
	* ![reduce.png](https://upload-images.jianshu.io/upload_images/14467401-5b8ec58e96064cf8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* javabean核心
	* ![setgoods.png](https://upload-images.jianshu.io/upload_images/14467401-4a2d074479c0f1f6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-a5ac2dece9725517.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	
	