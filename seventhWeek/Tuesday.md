## ajax&&Springboot的SSM框架

* 处理eclipse的缓存问题 四大步骤
	* 1.右键clean
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-c648dce15ec8f558.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 2.project clean
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-e10f90924534d332.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 3.项目导出war包
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-b1c00b75b4d121ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 4.右键publish
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-0a0297817b9d895f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 终极方法：
		* tomcat删除再重新配置

* 转为json
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-6840c44c134ab43d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 效果
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-046bc9e544422b34.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ps：JSON就是一串字符串，{} 大括号表示对象，[] 中括号表示数组，数据以"key":value的形式表示
	      举例来说，[{"name":"Michael"},{"name":"Jerry"}] 表示包含两个对象的数组；
	* 目前比较常用的是jackson、fastjson和Gson，有一个叫toJSONString的静态方法，用来将对象或集合
	  转为json字符串	  
  
#### jsp是能执行java代码的html

* linux安装tomcat
	* 解压压缩包
	* 将war包导入/home/hadoop/apache-tomcat-8.5.35/webapps下
	* ./startup.sh 启动tomcat
	* 到浏览器中http://172.18.24.198:8080/ 检查是否成功
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-197971579d22ff3b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* ajax
	* ps：异步，客户端请求服务器的时候，ajax会帮助另外开一个浏览器，将要查询的结果传回来，
	      供使用，举例来说，当你注册一个用户时，输入用户名，会提示你用户名是否存在，这就是
		  异步的效果，无需等待，ajax会帮你后台查询并返回结果
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-aeeba91b8d9e7b21.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 完成注册功能
		* ajax.html
			
			* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-7b305eda4f855738.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

			* aa()
			* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-84c0fd5e17868e6c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

			* suc()
			* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-5c05b266e62707d5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

			* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-e0906622563a7175.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-2fe9d576b40ec9e9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* ps：以上在script脚本中
			* 页面实现
			* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-e7a52ec3e1ea61e3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

		* RegServlet.java
			* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-3d69d20991b2e9c2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* UserssDao.java
			* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-90ba0c7d7648ed5b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* ssm框架搭建
* 实现查询数据库中所有的数据
	* 1.创建springboot项目
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-e388219736a24b1c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-98987642794fe49d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 2.修改pom.xml把需要引入的dependencies，plugin加入
	* 3.逆向工程(帮助创建工程固定包和类，还有要生成的xml放的位置)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a6307a2545f7ccda.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

		* generatorConfig.xml
		* ps：进入文件中，将数据库连接和一些包和类名改为自己所需即可
		* 运行
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-322a62912ebaa5f1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 4.创建一个util包，里面创建一个MyMapper类
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-f121600f857193af.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 5.application.yml
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-faea856737150343.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 6.在FirstbootApplication中设置boot项目的主入口	
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-6c546c6069a90eb4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-39e1b93f649d7ed3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 7.在Controller包中创建UserController类
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-31a99f30e87329af.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ps：将要使用的dao层接口定义成对应的controller的属性，加上@Autowired注解
	* 效果
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-faed72c840049429.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)














