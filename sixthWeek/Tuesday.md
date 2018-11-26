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
	* bin/flume-ng agent --conf --conf-file conf/netcat(自己的文件名) --name a2
	  -Dflume.root.logger=INFO
	* ![2.png](https://upload-images.jianshu.io/upload_images/14466577-ea9132aae50de207.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 在另外一个会话中
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-4dd77bfdcc742fef.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 输入hello，观察另一个会话结果
	* ![1.png](https://upload-images.jianshu.io/upload_images/14466577-eaedd65cd2aa21c5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-09166b4bd2bc916a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
