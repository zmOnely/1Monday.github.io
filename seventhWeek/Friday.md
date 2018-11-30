### 配置运行伪zookeeper
* 1.将zookerper压缩包导入/home/hadoop下，解压
* 2.mkdir zk，将解压好的zookeeper-3.4.6文件夹移动到zk文件夹中
    mv zookeeper-3.4.6 zk/
* 3.将文件夹改名为zk1
    mv zookeeper-3.4.6/ zk1	
* 4.在复制两份zk1，命名为zk2,zk3
	cp zk1/ zk2; cp zk1/ zk3
	![image.png](https://upload-images.jianshu.io/upload_images/14467401-b81d4eb0908af545.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 5.分别配置
	* 在/home/hadoop/zk/zk1/conf下
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a22ac4db0b6cd682.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 6.添加上id			
	* echo "1" >> /home/hadoop/zk/zk1/zkData/myid
	* ps：""里面的数字和配置中的server.#要保持一致，三个都配置上
	* server.1=192.168.197.148:2888:3888
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
	* echo "2" >> zkdata/myid
* 4.将三台进行相同的操作后进行启动
	* bin/zkServer.sh start(/home/hadoop/zookeeper-3.4.6)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-eb1499dd594000db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 5.查看状态
	* bin/zkServer.sh status
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-eca49ade07041a4b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 6.查看日志信息(当有错误时)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-6c493b021213cb54.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	
* 通过xshell操作zookeeper	
	
* 通过java操作zookeeper	
	
	
	
	
	
	
	
	
	