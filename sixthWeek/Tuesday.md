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
	
* DUOYI
> ###### **Flume日志采集工具**
>
> **Author:oldsheep**

### Flume核心工作机制

----

![1546833671543](C:\Users\ThinkPad\Pictures\typora\1546833671543.png)



### Flume安装及实战

----

##### 1/ 系统要求

>Flume 1.6.x要求使用java 1.6+



##### 2/ 安装

>上传:...
>
>解压:`tar zxvf apache-flume-1.6.0-bin.tar.gz -C root/apps`
>
>修改配置文件:
>
>`cd /root/apps/flume-1.6.0/conf`
>
>`mv flume-env.sh.template flume-env.sh`
>
>`vim flume-env.sh`

```properties
export JAVA_HOME=/usr/local/java/jdk1.8.0_141/
# 注意：输入路径的时候，可以在vi的命令行模式下输入：r! echo /usr/[制表符号会有提示]
```

##### 3/ 案例

**案例一：从一个网络端口获取数据，然后将数据输出到控制台：**

![1546832964317](C:\Users\ThinkPad\Pictures\typora\1546832964317.png)

```properties
# Name the components on this agent
a1.sources = r1 
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = netcat
a1.sources.r1.bind = hdp-nd-01
a1.sources.r1.port = 52020

# Describe the sink
a1.sinks.k1.type = logger

# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
```

启动：`bin/flume-ng agent -n a1 -c conf/ -f myagent/netcat-logger.conf -Dflume.root.logger=INFO,console`

>Note： 
>
>如果没有安装telnet使用yum安装一下telnet服务；
>
>建议把yum改成网络yum源；

发送数据：`telnet hdp-nd-01 52020`



**案例二：从文件下采集文件到hdfs**

![1546845085874](C:\Users\ThinkPad\Pictures\typora\1546845085874.png)

编辑Agent文件：

```properties
# Name the components on this agent
a1.sources = r1
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = spooldir
a1.sources.r1.spoolDir = /root/logs
a1.sources.r1.fileHeader = true

# Describe the sink
a1.sinks.k1.type = hdfs
a1.sinks.k1.hdfs.path = hdfs://hdp-nd-01:9000/doit03/flume/%Y-%m-%d/
a1.sinks.k1.hdfs.filePrefix = events-
# 因为路径上需要时间，所以useLocalTimeStamp在Event的header中放入一个timestamp时间戳
a1.sinks.k1.hdfs.useLocalTimeStamp=true


# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
```

注意异常：

![1546845175011](C:\Users\ThinkPad\Pictures\typora\1546845175011.png)

> 解决方案：提前创建好监控的文件夹



![1546845206252](C:\Users\ThinkPad\Pictures\typora\1546845206252.png)

> 解决方案：在sink组件的配置中添加`hdfs.useLocalTimeStamp=true`



> 不能在监控的文件夹下方同名的文件，不然会报错；
>
> 解决办法就是删掉同名的文件，重启Flume。



**案例三：将一个实时别写的文件数据，采集到Kafka**

![1546845663457](C:\Users\ThinkPad\Pictures\typora\1546845663457.png)

编辑Agent配置文件：

```properties
# Name the components on this agent
a1.sources = r1
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = exec
a1.sources.r1.command = tail -F /root/logs/access.log

# Describe the sink
a1.sinks.k1.type = org.apache.flume.sink.kafka.KafkaSink
a1.sinks.k1.topic = flume
a1.sinks.k1.brokerList = hdp-nd-01:9092,hdp-nd-02:9092,hdp-nd-03:9092
a1.sinks.k1.requiredAcks = 1
a1.sinks.k1.batchSize = 20

# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
```

启动Flume: `bin/flume-ng agent -n a1 -c conf -f myagent/exec-kakfa.conf`

编写一个shell脚本，用来往`root/logs/access.log`写入数据：

```shell
while true
do
echo `date` >> /root/logs/access.log
sleep 0.5
done
```

> note:
>
> ​    通过观察发现，kafka主题下只有一个分区有数据，其他的分区没有数据，这对kafka来说是及其不好的，因为集群中只有一个节点在干活。
>
> ​    解决方案就是的使用拦截器(UUID Interceptor)了.
>
>  
>
> `tail -F`和`tail -f`的区别：
>
> tail -F监控文件的时候，文件可以删除；删除之后，如果重新创建这个文件，还是继续监控；
>
> tail -f监控文件的时候，文件可以删除，但是删除之后如果重新创建这个文件，不会继续监控；





**案例四： 多级Agent串联**



![1546848990019](C:\Users\ThinkPad\Pictures\typora\1546848990019.png)

编辑hdp-nd-01的agent配置：

```properties
# Name the components on this agent
a1.sources = r1
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = exec
a1.sources.r1.command = tail -F /root/logs/access.log

# Describe the sink
a1.sinks.k1.type = avro
a1.sinks.k1.hostname = hdp-nd-02
a1.sinks.k1.port = 4545

# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
```

编辑hdp-nd-02的Agent配置：

```properties
# Name the components on this agent
a1.sources = r1
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = avro
a1.sources.r1.bind = hdp-nd-02
a1.sources.r1.port = 4545

# Describe the sink
a1.sinks.k1.type = logger

# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
```

启动Agent:

> 先启动hdp-nd-02的Agent: `bin/flume-ng agent -n a1 -c conf/ -f myagent/avro-logger.conf`
>
> 启动hdp-nd-01的Agent: `bin/flume-ng agent -n a1 -c conf/ -f myagent/exec-avro.conf`



**案例五：Flume的高可用, k1和k2只能有一个工作**

![1546851966413](C:\Users\ThinkPad\Pictures\typora\1546851966413.png)



编辑hdp-nd-01的Agent配置：

```properties
# Name the components on this agent
a1.sources = r1
a1.sinks = k1 k2
a1.channels = c1

# k1和k2谁的优先级高谁先工作
a1.sinkgroups = g1
a1.sinkgroups.g1.sinks = k1 k2
a1.sinkgroups.g1.processor.type = failover
a1.sinkgroups.g1.processor.priority.k1 = 5
a1.sinkgroups.g1.processor.priority.k2 = 10
a1.sinkgroups.g1.processor.maxpenalty = 10000

# Describe/configure the source
a1.sources.r1.type = exec
a1.sources.r1.command = tail -F /root/logs/access.log

# Describe the k1
a1.sinks.k1.type = avro
a1.sinks.k1.hostname = hdp-nd-02
a1.sinks.k1.port = 4141

# Describe the k2
a1.sinks.k2.type = avro
a1.sinks.k2.hostname = hdp-nd-03
a1.sinks.k2.port = 4141


# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
a1.sinks.k2.channel = c1
```

编辑hdp-nd-02的Agent配置文件：

```properties
# Name the components on this agent
a1.sources = r1
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = avro
a1.sources.r1.bind = hdp-nd-02
a1.sources.r1.port = 4141

# Describe the sink
a1.sinks.k1.type = hdfs
a1.sinks.k1.hdfs.path = hdfs://hdp-nd-01:9000/doit03/ha


# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
```

编辑hdp-nd-03的Agent配置文件：

```properties
# Name the components on this agent
a1.sources = r1
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = avro
a1.sources.r1.bind = hdp-nd-03
a1.sources.r1.port = 4141

# Describe the sink
a1.sinks.k1.type = hdfs
a1.sinks.k1.hdfs.path = hdfs://hdp-nd-01:9000/doit03/ha


# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
```

启动顺序：

> 分别先启动`hdp-nd-02`和`hdp-nd-03`的`flume`;
>
> 然后启动`hdp-nd-01`的`flume`；
>
> 停止`hdp-nd-03`的`flume`进程，观察到`hdp-nd-02`开始工作；



**案例六：拦截器的使用Interceptor**

> **Timestamp Interceptor:**
>
> 往Event的`header`里面放一个key=timestamp  value=时间(毫秒)
>
> ` headers:{timestamp=1546848454265}`



> **Host Interceptor:**
>
> 往Event的`header`里面放一个key=hostname value=ip
>
> `headers:{hostname=10.172.50.61}`



> **Static Interceptor:**
>
> 往Event的`header`里面放一对固定的key-value
>
> `headers:{teacher=oldsheep}`



> **UUID Interceptor:**
>
> 往Event的`header`里面放一个指定的key, value=UUID, UUID拦截器可以解决Kafka sink下沉数据的时候数据分布不均匀问题，但是`headerName`的值必须等于`key`
>
> `headers:{key=475a7f33-3de2-44ca-909e-55cafcbd9dbf}`
>
> ```properties
> # Name the components on this agent
> a1.sources = r1
> a1.sinks = k1
> a1.channels = c1
> 
> # Describe/configure the source
> a1.sources.r1.type = exec
> a1.sources.r1.command = tail -F /root/logs/access.log
> 
> a1.sources.r1.interceptors = i4
> a1.sources.r1.interceptors.i4.type = org.apache.flume.sink.solr.morphline.UUIDInterceptor$Builder
> a1.sources.r1.interceptors.i4.headerName = key
> 
> # Describe the sink
> a1.sinks.k1.type = org.apache.flume.sink.kafka.KafkaSink
> a1.sinks.k1.topic = flume
> a1.sinks.k1.brokerList = hdp-nd-01:9092,hdp-nd-02:9092,hdp-nd-03:9092
> a1.sinks.k1.requiredAcks = 1
> a1.sinks.k1.batchSize = 20
> 
> # Use a channel which buffers events in memory
> a1.channels.c1.type = memory
> a1.channels.c1.capacity = 1000
> a1.channels.c1.transactionCapacity = 100
> 
> # Bind the source and sink to the channel
> a1.sources.r1.channels = c1
> a1.sinks.k1.channel = c1
> ```

**案例七：Interceptor实战**

目录下有三个正在被写的日志文件，现在要求将采集到的日志文件的内容存储到hdfs，不同的数据存储到不同的目录下：

![1546855827496](C:\Users\ThinkPad\Pictures\typora\1546855827496.png)

编辑Agent配置文件：

```properties
# Name the components on this agent
a1.sources = r1 r2 r3
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = exec
a1.sources.r1.command = tail -F /root/logs/web.log
a1.sources.r1.interceptors = i4
a1.sources.r1.interceptors.i4.type = static
a1.sources.r1.interceptors.i4.key = type
a1.sources.r1.interceptors.i4.value = web

a1.sources.r2.type = exec
a1.sources.r2.command = tail -F /root/logs/access.log
a1.sources.r2.interceptors = i3
a1.sources.r2.interceptors.i3.type = static
a1.sources.r2.interceptors.i3.key = type
a1.sources.r2.interceptors.i3.value = access

a1.sources.r3.type = exec
a1.sources.r3.command = tail -F /root/logs/nginx.log
a1.sources.r3.interceptors = i2
a1.sources.r3.interceptors.i2.type = static
a1.sources.r3.interceptors.i2.key = type
a1.sources.r3.interceptors.i2.value = nginx

# Describe the sink
a1.sinks.k1.type = hdfs
# %{type}是一个动态的表达式，从header去取key=type的值
a1.sinks.k1.hdfs.path = hdfs://hdp-nd-01:9000/doit03/%Y-%m-%d/%{type}
a1.sinks.k1.hdfs.filePrefix = events-
# 因为路径上需要时间，所以useLocalTimeStamp在Event的header中放入一个timestamp时间戳
a1.sinks.k1.hdfs.useLocalTimeStamp=true

# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sources.r2.channels = c1
a1.sources.r3.channels = c1
a1.sinks.k1.channel = c1
```

编写shell生成数据:

```shell
while true
do
echo `date` >> /root/logs/web.log
echo `date` >> /root/logs/access.log
echo `date` >> /root/logs/nginx.log
sleep 0.5
done
```

启动Flume:

```shell
bin/flume-ng agent -n a1 -c conf -f myagent/muli-exec-hdfs.conf
```

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	