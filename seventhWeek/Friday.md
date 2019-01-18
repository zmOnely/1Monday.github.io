## ZooKeeper
### 配置运行伪zookeeper
* 1.将zookerper压缩包导入/home/hadoop下，解压
* 2.mkdir zk，将解压好的zookeeper-3.4.6文件夹移动到zk文件夹中
	* mv zookeeper-3.4.6 zk/
	* ps：此步骤为了不影响之后在本台设备上安装zookeeper完全分布式
* 3.将文件夹改名为zk1
    mv zookeeper-3.4.6/ zk1	
* 4.在复制两份zk1，命名为zk2,zk3
	cp zk1/ zk2; 
	cp zk1/ zk3;
	![image.png](https://upload-images.jianshu.io/upload_images/14467401-b81d4eb0908af545.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 5.分别配置
	* 在/home/hadoop/zk/zk1/conf下
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a22ac4db0b6cd682.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 6.添加上id			
	* echo "1" >> /home/hadoop/zk/zk1/zkData/myid
	* ps：""里面的数字和配置中的server.#要保持一致，三个都进行配置

* 7.开启服务
	* 在/home/hadoop/zk下
	* zk1/bin/zkServer.sh start
* 8.查看效果
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-c461c8dbe6dc4ce7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ps：这样即为成功

	
### 配置完全分布式的zookeeper
* 1.将zookerper压缩包导入/home/hadoop下，解压
* 2.配置
	* cd /home/hadoop/zookeeper-3.4.6/conf
	* cp zoo_sample.cfg zoo.cfg
	* vim zoo.cfg 进行更改
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-7df0bec4486da587.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 3.cd .. 退回/home/hadoop/zookeeper-3.4.6	
	* mkdir zkdata
	* echo "1" >> zkdata/myid
* 4.将三台进行相同的操作后进行启动
	* 在/home/hadoop/zookeeper-3.4.6下
	* bin/zkServer.sh start
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-eb1499dd594000db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 5.查看状态
	* bin/zkServer.sh status
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-eca49ade07041a4b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 6.查看日志信息(当有错误时)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-6c493b021213cb54.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 通过xshell操作zookeeper	

* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a53f5c0fbd0d121c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-3e110c2eaf597280.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* ps：这样既可以输入命令进行操作
* create [-e/-s/-e -s] path value
	* -e：创建临时模式
	* -s：创建序列模式
	* eg：
	* create -e /eph lin
	* create /name my
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-dec4713c3b40a9da.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* get path 获取信息
* set path 要改成什么样子 
	* set /name my
	* ps：每次更改后，随之版本号(dataVersion)也更改
* rmr path 删除信息
	* rmr /name
	
### 通过java操作zookeeper	
* 实现
	* 1.创建一个maven工程
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-3a11c26d8f2526e9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-52622d5cdf7d1dde.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ps：之后一直next，finish即可
	* 2.等待maven下载好所有的文件	
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-e6f4d76478be45f1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ps：如果还有报错，可以让maven重新检查一遍，将没有的包下载
	* 3.修改配置(pom.xml)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a55be20c04e8280c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		```
		<dependency>
		  <groupId>org.apache.zookeeper</groupId>
		  <artifactId>zookeeper</artifactId>
		  <version>3.4.6</version>
		</dependency>
		```
		* 将这段话粘贴到图片代码下面
	* 4.正式干活
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-f7d68b0a5ea709ee.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-c8a2ad846204e262.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-f90add4d8ef67713.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-88c3c8d10c0d2fe1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-73ad9c81d471d1d1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-e9672f89b036acf1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	
	
	
	
	
	
	
	
	
	