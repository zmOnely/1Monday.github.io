* echarts把数据进行可视化的展示
	* 1.引入js
		* <script src="https://unpkg.com/echarts@4.2.0-rc.2/dist/echarts.min.js"></script>

	* 2.创建一个div，作为容器给echarts用
	
	* 3.init方法
		* var myChart = echarts.init(document.getElementById('main'));
	* 4.将数据加到配置中
		* 从echarts官网参考
	* 5.将配置对象设置给mychart这个echarts的对象继续使用，即知道要怎么进行展示
		* myChart.setOption(option);

* springboot打jar包在idea运行的方式
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-91bd0773195a8a0c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-31043e192e419d6c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-32407cf30efbe4d2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 在hadoop上运行的方式

	* 1.将日志存放位置改变，重新打jar包(直接打就行，可以覆盖)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-1deffd1ae58edcce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 2.将jar包传到hadoop的~目录下，或者建一个文件夹存放
	* 3.输入命令，执行
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-8a53582844170aa9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 4.浏览器查看结果  
		* 本虚拟机IP:端口号/html名称
		* http://172.18.24.198:8080/testCharts.html
	* hadoop查看日志
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-dce3aaad96a92f7f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 使用弊端：
	* java -jar 包的路径，可以启动springboot的项目，但是只要停止进程，或者关闭会话，
	  项目也会随之停止
	* 解决弊端的方法
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-bbd8877a874e4dcf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 设置使用不同环境下的配置文件
	* eg：application-dev.yml
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-6797d65a36b04e91.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 这样设置，知道除了application.yml还要帮你使用哪些配置文件，所以我们就可以将生产环境
	，开发环境不同的配置在不同的配置文件中写好，需要使用的时候更改active即可，application
	只存放公共的，不根据环境需要改变的配置
* 跨域请求问题
	* 跨域请求，域即为域名(ip+端口号)，任何一项不同都为跨域，ajax请求默认
	  不允许，如果要实现跨域请求，找到对应的想跨域请求的方法，设置如下图所示即可
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-9739639b484654b4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### mybatis
* 需求
	* 根据传入的用户名查找对应的数据，返回一个list集合
	* 查询条件的类型
		* 1.字符串类型
		* 2.数字类型
		* 3.自定义类型
		* UserssMapper.java(dao层接口声明抽象方法)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-4ef544812e8b0a66.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

		* UserssMapper.xml(在对应的xml文件中创建对应的标签通过id将这个标签和dao层的方法关联起来)	
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-7fc9cb33f81198f0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

		* UserssController.java
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-2fecdce377e82c3d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	
* 联表查询(一对多)	
	* 实现核心
		* 设置resultMap通过设置的映射将结果集中的字段放入对应的类型的属性中；
		* 如果想在一方得到多方，在一方设置一个属性是集合类型的来存储多方数据；
		* 在resultMap当中，要将结果集中的数据放入到多方的属性集合中，普通标签不
		好用，要使用collection的标签，在标签中设置集合中每个对象的属性用哪个字段
		进行赋值
	* UserssMapper.java
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-c9a750e5daf6453c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* UserssMapper.xml
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a53d7dd3995fc850.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-6e0c03aac062c5dc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* UserssController.java
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-45770257be807dd0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* ajax一点
	* 表单form有一个方法，serialize()，可以将所有前端输入的注册信息串成一行，
	  但是input标签要设置name属性！！
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-00ba46565527d42c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
  
