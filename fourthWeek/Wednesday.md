## MapReduce
* Yarn原理
	* 概述
		* Yarn是一个资源调度平台，负责为运算程序提供服务器运算资源，相当于一
		个分布式的操作系统平台，而mapreduce等运算程序则相当于运行于操作系统之
		上的应用程序
	* 几点说明
	```
	1、yarn并不清楚用户提交的程序的运行机制，yarn只提供运算资源的调度
	 （用户程序向yarn申请资源，yarn就负责分配资源）
	2、yarn中的主管角色叫ResourceManager
	3、yarn中具体提供运算资源的角色叫NodeManager
	4、这样一来，yarn其实就与运行的用户程序完全解耦，就意味着yarn上可以运行
	   各种类型的分布式运算程序（mapreduce只是其中的一种），比如mapreduce、
	   storm程序，spark程序，tez ……，所以，spark、storm等运算框架都可以整合在
	   yarn上运行，只要他们各自的框架中有符合yarn规范的资源请求机制即可，Yarn
	   就成为一个通用的资源调度平台
	```
	* ![yarn原理.png](https://upload-images.jianshu.io/upload_images/14467401-00de320b1eebb4a6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![yarn.png](https://upload-images.jianshu.io/upload_images/14467401-c1c24c2f82e269df.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* qq好友示例
	```
	A:B,C,D,F,E,O
	B:A,C,E,K
	C:F,A,D,I

	ps：a的好友有后面这些，b的好友也是，需求是找出俩俩对应的共同好友
	格式为：A-B:C,E  B-C:A-B
	提示：用两次mr  (work工程的user类)
	```	