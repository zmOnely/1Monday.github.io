## Flume 日志采集系统
* 理论知识在文档~~

* 实例
	* 从网络端口采集数据--netcat，下沉到logger
	* 监视文件夹--spooldir
	* 从avro端口接收数据，下沉到logger
	* 用tail命令获取数据，下沉到hdfs
	* 从tail命令获取数据发送到avro端口，另一个节点可配置一个avro源来中继数据，
	  发送外部存储

* netcat流程
	* cd flume
	* mkdir myconf 准备之后用
	* cd conf
	* cp flume-env.sh.template flume-env.sh
	* vim flume-env.sh 配置java环境
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-2ded1ea8beb6eb84.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 复制一个会话，cd flume
	* 在新会话里，cd flume --> cd myconf
	* vim netcat  新建一个文件，将压缩包中的netcat-logger粘贴进去
	* 回到之前的会话，一定要在flume路径下，否则之后的都用相对路径，可能会出错
	* bin/flume-ng agent --conf --conf-file myconf/netcat(自己的文件路径) --name a2
	  -Dflume.root.logger=INFO,console
	* ![2.png](https://upload-images.jianshu.io/upload_images/14466577-ea9132aae50de207.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-76f6146277db35d5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 在另外一个会话中
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-4dd77bfdcc742fef.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 输入hello，观察另一个会话结果
	* ![1.png](https://upload-images.jianshu.io/upload_images/14466577-eaedd65cd2aa21c5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-09166b4bd2bc916a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-e36365f95f3162c5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* spooldir
	* cd flume
	* cd myconf 
	* vim spooldir.conf
	* 复制个会话，创建一个待监控的文件夹
	* mkdir test
	* 回到之前的会话，将test文件夹路径粘贴到spooldir.conf指定位置中
	* 在flume路径下启动
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a89f0b97ad0558cf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-f7b9d03a21431d84.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 测试效果
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-efe9ff84beecbd65.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a3835ac1127fcc88.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ps：不能写同名文件，否则不会报错，但会炸，整体不好用
* spooldir-hdfs.conf
	* ps：下沉地是hdfs
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-61f7f503749acaf4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 效果
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-77f98dd5aa4e8f9a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* avro串联 avro-hdfs.conf
	* vim tail-avro.conf
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-f5cd8fcc233dbedb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* vim avro-log.conf
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-56e70d6f7340a7bb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 启动
	* 提供两个都在flume路径下的会话，先开接收的，再开发送的
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-d973a7f0eda689aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-05c680269e2f8185.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 向avro.log中输入数据
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-34d8e104fa53bda5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 
	
	
	
* ![图片1.png](https://upload-images.jianshu.io/upload_images/14467401-ca5d892c61426803.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	