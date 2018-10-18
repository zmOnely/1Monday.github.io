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
* Linux命令
	* 帮助
		* 内部命令：属于Shell解析器的一部分
	    cd 切换目录（change directory）
	    pwd 显示当前工作目录（print working directory）
	    help 帮助
		* 外部命令：独立于Shell解析器之外的文件程序
	    ls 显示文件和目录列表（list）
	    mkdir 创建目录（make directoriy）
	    cp 复制文件或目录（copy）
		* 查看帮助文档
	    内部命令：help + 命令（help cd）
	    外部命令：man + 命令（man ls）
	* 基本命令
		* 目录操作指令
			* pwd (Print Working Directory) 查看工作目录
			* cd (Change Directory) 切换工作目录
			* ls 列表显示目录内容
			-l:详细信息显示
			-a:显示所有子目录和文件的信息，包括隐藏文件
			-A:类似于“-a”，但不显示“.”和“..”目录的信息
			-R:递归显示内容
			* mkdir 创建新的目录 (Make Directory)
			* du 统计目录及文件的空间占用情况(estimate file space  usage)
			-a：统计时包括所有的文件，而不仅仅只统计目录
			-h：以更易读的字节单位（K、M等）显示信息
			-s：只统计每个参数所占用空间总的大小
		* 文件操作命令
			* touch 新建空文件，或更新文件时间标记
			* file 查看文件类型
			* cp 复制(copy)文件或目录
			格式：cp  [选项]   源文件或目录  目标文件或目录
			-r：递归复制整个目录树
			-p：保持源文件的属性不变
			-f：强制覆盖目标同名文件或目录
			-i：需要覆盖文件或目录时进行提醒
			* rm 删除文件或目录
			-f：强行删除文件，不进行提醒
			-i：删除文件时提醒用户确认
			-r：递归删除整个目录树
			* 
		

		
		
		
		
	   

	

	
		
