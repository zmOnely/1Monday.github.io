* 虚拟机的目录结构
![image.png](https://upload-images.jianshu.io/upload_images/14467401-3afb713864b364f7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 重启命令
	* reboot
	* shutdown -r now 立刻重启(root用户使用)
	* shutdown -r 10 十分钟后自动重启(root用户使用)
	* shutdown -c 如果是通过shutdown命令设置重启的话，可以用此命令取消重启
* 关机命令
	* halt 立刻关机
	* poweroff 立刻关机
	* shutdown -h now 立刻关机(root用户使用)
	* shutdown -h 10 10分钟后自动关机(root用户使用)
* Linux运行级别
	* 配置文件: /etc/inittab
	![运行级别.png](https://upload-images.jianshu.io/upload_images/14467401-b2d7ca6f5802ecf9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 命令
		* runlevel 查看运行级别
		结果展示格式：切换前的运行级别 当前的运行级别
		* init 临时切换运行级别
		eg: 将运行级别切换成3
		init 3
* 网络配置
	* 查看主机名
		* hostname 查看主机名
	* 修改主机名
		* hostname 名字 临时修改(一次性修改,重启之后变回原来)
		* vi /etc/hostname 永久修改
		ps:按回车之后会进入一个界面，按"i",使其处于可以编写状态，写上新的名字，":wq"保存退出
	* 测试网络连接
		* ping [选项] 目标主机
		eg:
		ping www.baidu.com
		ps:按Ctrl+C中止测试
	* 查看网络接口信息
		* ifconfig 查看所有活动网络接口的信息
		* ifconfig 网络接口名 查看指定网络接口信息?????????????例子
		ps:Ifconfig不能用，使用yum命令 
		yum install net-tools yum命令相当于Linux系统的应用商店，下载安装各种需要的软件,"install"意思是安装
	* 设置防火墙
		* service firewalld status 查看防火墙状态
		* systemctl stop firewalld 临时关闭centos7防火墙
		* systemctl disable firewalld 禁止开机启动
	* 设置网络信息
		* vi /etc/sysconfig/network-scripts/ifcfg-ens33 ??????????
	* 设置SELinux
		* 查看SElinux，可能返回的结果有三种
		Enforcing：强制模式，代表记录安全警告且阻止可疑行为
		Permissive：宽容模式，代表记录安全警告但不阻止可疑行为
		Disable：关闭
		* 当前有效
		setenforce	[ Enforcing | Permissive| 1| 0 ]
		该命令可以立即改变SELinux运行状态，在Enforcing 和Permissive  之间切换,关机重启之后失效
		* 永久有效
		修改配置文件/etc/selinux/config,将SELINUX=enforcing修改为SELINUX=disabled重启生效

	
		
		
* 虚拟机网络配置图	
![虚拟机网络配置图.png](https://upload-images.jianshu.io/upload_images/14467401-9a5e668357b59663.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	

	
		
