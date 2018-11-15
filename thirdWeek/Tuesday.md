### 在Windows上配置Hadoop的hdfs
* 第一步：加插件
	* 将hadoop-eclipse-plugin-2.7.3.jar引入eclipse文件夹下的plugins下，打开eclipse
	* 如果没有DFS Locations文件夹，将此插件继续引入dropins文件夹中重启eclipse即可
* 第二步：
	* ![41.png](https://upload-images.jianshu.io/upload_images/14467401-095228f57660bf6e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 第三步：
	* ![42.png](https://upload-images.jianshu.io/upload_images/14467401-9b07fed88be67287.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	
### 在Windows上配置Hadoop的mapreduce
* 第一步
	* 把hadooponwindows-master文件夹下的etc和bin直接移动到hadoop-2.7.3包中，直接覆盖原来的
* 第二步
	* 将hadoop-2.7.3包下的bin下的hadoop.dll和winutils移到C:\Windows\System32下
* 第三步
	* 配置hadoop环境
	* ![43.png](https://upload-images.jianshu.io/upload_images/14467401-2d3da635980b6492.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 第四步
	* 打开cmd命令窗口，输入"hadoop"或者"hadoop version"命令检测是否配置成功，若不成功，继续下一步
	* ps：人品不好需要重启电脑生效
* 第五步	
	* 配置文件
		* 在F:\hadoop-2.7.3\etc\hadoop下
		* 配置hadoop-env.cmd，如图 
		* ![46.png](https://upload-images.jianshu.io/upload_images/14467401-ac950a63cfc8e51e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 配置hdfs-site.xml，如图 
		* ![45.png](https://upload-images.jianshu.io/upload_images/14467401-243850e543d56d1d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 第六步
	* 执行第四步成功后，在cmd中输入"hadoop namende -format" 初始化
* 第七步
	* start-all.cmd 启动
* 第八步
	* jps检查或在浏览器输入"namenode的ip+50070"检测是否成功
	