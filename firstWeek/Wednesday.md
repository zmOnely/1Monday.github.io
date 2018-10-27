## Linux
* [相关参考ppt，需要请点击，进行下载~~](https://zmonely.github.io/zmOnely/firstWeek/Linux.ppt)
* 虚拟机的目录结构
* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-3afb713864b364f7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
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
		* 结果展示格式：切换前的运行级别 当前的运行级别
		* init 临时切换运行级别
		* eg: 将运行级别切换成3
		* init 3
		* ![runlevel.png](https://upload-images.jianshu.io/upload_images/14467401-6a192f691df5e2e1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 网络配置
	* 查看主机名
		* hostname 查看主机名
	* 修改主机名
		* hostname 名字 临时修改(一次性修改,重启之后变回原来)
		* ![hostname.png](https://upload-images.jianshu.io/upload_images/14467401-df14dcc7728968f0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* vim  /etc/hostname 永久修改
		* ps:按回车之后会进入一个界面，按"i",使其处于可以插入状态，写上新的名字，":wq"保存退出
	* 测试网络连接
		* ping [选项] 目标主机
		* eg:
		* ping www.baidu.com
		* ps:按Ctrl+C中止测试
		* ![ping.png](https://upload-images.jianshu.io/upload_images/14467401-22b8a0049aaa8790.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 查看网络接口信息
		* ifconfig 查看所有活动网络接口的信息
		* ![ifconfig.png](https://upload-images.jianshu.io/upload_images/14467401-906113ba33c0fe20.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ifconfig 网络接口名 查看指定网络接口信息
		* ![ifconfig1.png](https://upload-images.jianshu.io/upload_images/14467401-39e708ccbc6a359a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ps:ifconfig不能用，使用yum命令进行下载 
		* yum install -y net-tools 
		* yum命令相当于Linux系统的应用商店，下载安装各种需要的软件，"install"意思是安装
	* 设置防火墙
		* systemctl status firewalld 查看防火墙状态
		* ![防火墙.png](https://upload-images.jianshu.io/upload_images/14467401-659af90c4bc43076.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* systemctl stop firewalld 临时关闭centos7防火墙
		* systemctl disable firewalld 永久关闭防火墙，开机也不会启动
	* 设置网络信息
		* vi  /etc/sysconfig/network-scripts/ifcfg-ens33
		* ps:会进入到如图界面，修改即可
		* ![设置网信.png](https://upload-images.jianshu.io/upload_images/14467401-4b57a968781a6617.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 设置SELinux
		* 查看SElinux，可能返回的结果有三种
		* Enforcing：强制模式，代表记录安全警告且阻止可疑行为
		* Permissive：宽容模式，代表记录安全警告但不阻止可疑行为
		* Disable：关闭
		* 当前有效
		* setenforce [ Enforcing `|` Permissive `|` 1`|`0]
		* 该命令可以立即改变SELinux运行状态，在Enforcing 和Permissive 之间切换,关机重启之后失效
		* 永久有效
		* vi  /etc/selinux/config 
		* 将SELINUX=enforcing修改为SELINUX=disabled，重启生效
		* ![selinux.png](https://upload-images.jianshu.io/upload_images/14467401-3c013c0651b8890d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 虚拟机网络配置图	
* ![虚拟机网络配置图.png](https://upload-images.jianshu.io/upload_images/14467401-9a5e668357b59663.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* Linux命令
	* 帮助
		* 内部命令：属于Shell解析器的一部分
			* cd 切换目录（change directory）
			* pwd 显示当前工作目录（print working directory）
			* help 帮助
		* 外部命令：独立于Shell解析器之外的文件程序
			* ls 显示文件和目录列表（list）
			* mkdir 创建目录（make directoriy）
			* cp 复制文件或目录（copy）
		* 查看帮助文档
			* 内部命令：help + 命令（help cd）
			* 外部命令：man + 命令（man ls）
	* 基本命令
		* 目录操作指令
			* pwd (Print Working Directory) 查看工作目录
			* cd (Change Directory) 切换工作目录
			* ls 列表显示目录内容
				* -l:详细信息显示
				* -a:显示所有子目录和文件的信息，包括隐藏文件
				* -A:类似于“-a”，但不显示“.”和“..”目录的信息
				* -R:递归显示内容
			* mkdir 创建新的文件夹 (Make Directory)
			* du 统计目录及文件的空间占用情况(estimate file space  usage)
			* 格式：du	[选项] [目录或文件名]
				* -a：统计时包括所有的文件，而不仅仅只统计目录
				* -h：以更易读的字节单位（K、M等）显示信息
				* -s：只统计每个参数所占用空间总的大小
				* ![du.png](https://upload-images.jianshu.io/upload_images/14467401-181d030d98e700be.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 文件操作命令
			* touch 新建空文件 ">"和其类似
			* file 查看文件类型
			* ![file.png](https://upload-images.jianshu.io/upload_images/14467401-e43b7531ea6f72aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* cp 复制(copy)文件
			* 格式：cp  [选项]  源文件或目录  目标文件或目录
				* -r：递归复制整个目录树
				* -p：保持源文件的属性不变
				* -f：强制覆盖目标同名文件或目录
				* -i：需要覆盖文件或目录时进行提醒
			* rm 删除文件或目录
				* -f：强行删除文件，不进行提醒
				* -i：删除文件时提醒用户确认
				* -r：递归删除整个目录树
			* mv 移动文件或目录  
			* 如果目标位置与源位置相同,则相当于改名
			* 格式：mv  [选项]  源文件  目标文件
		* 可执行文件查找
			 * which 显示系统命令所在目录
			 * ![which.png](https://upload-images.jianshu.io/upload_images/14467401-a1704bd767a57a3a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 查询命令
			* find 
			* ![find.png](https://upload-images.jianshu.io/upload_images/14467401-b1da75567740b952.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
				* -name	根据文件名查找
				* -user	根据文件拥有者查找
				* -group	根据文件所属组寻找文件
				* -perm	根据文件权限查找文件
				* -size	根据文件大小查找文件
				* -type	根据文件类型查找（f-普通文件，c-字符设备文件，b-块设备文件，l-链接文件，d-目录）
				* -o	表达式或
				* -and	表达式与
		* 文件内容操作命令
			* cat 显示出文件的全部内容
			* ![cat.png](https://upload-images.jianshu.io/upload_images/14467401-44b3f49df49b0941.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* more 全屏方式分页显示文件内容 (less)
			* 操作方法
				* 按Enter键向下逐行滚动
				* 按空格键向下翻一屏、按b键向上翻一屏
				* 按q键退出
			* head 	查看文件开头的一部分内容(默认为10行)
			* 格式:head -n 文件名
			* tail 查看文件结尾的少部分内容(默认为10行)
			* 格式：tail -n 文件名
			* wc 统计文件中的单词数量(Word Count)等信息
				* -l：统计行数
				* -w：统计单词个数
				* -c：统计字节数
				* ![wc.png](https://upload-images.jianshu.io/upload_images/14467401-17952db9a63f5e7b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* grep 查找文件里符合条件的字符串
			* 格式:grep  [选项]   <关键字>  <文件…>
				* -c:计算匹配关键字的行数
				* -i:忽略字符大小写的差别
				* ![-i.png](https://upload-images.jianshu.io/upload_images/14467401-b3d6fe8edd00b034.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
				* -n:显示匹配的行及其行号
				* ![-n.png](https://upload-images.jianshu.io/upload_images/14467401-6cc8780de5cfd5d5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
				* -s: 不显示不存在或不匹配文本的错误信息
				* ![-s.png](https://upload-images.jianshu.io/upload_images/14467401-7226cbc1b4fd4169.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
				* -h: 查询多个文件时不显示文件名
				* -l: 查询文件时只显示匹配字符所在的文件名
				！![-l.png](https://upload-images.jianshu.io/upload_images/14467401-0ff9e50a624712ff.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
				* --color=auto:将找到的关键字部分加上颜色显示
				* ![grep.png](https://upload-images.jianshu.io/upload_images/14467401-52d462785582064b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 压缩命令
			* gzip 压缩（解压）文件或目录，压缩文件后缀为gz 
			* bzip2 压缩（解压）文件或目录，压缩文件后缀为bz2 
			* tar 压缩、解压文件
			* 格式:
			* tar [cvf] 压缩名 文件名 （压缩文件）
			* tar [xvf] 文件名.tar    （解压文件）
				* -c：创建.tar 格式的包文件
				* -x：解开.tar格式的包文件
				* -v：输出详细信息
				* -f：表示使用归档文件.....
			


		
		
		
		
		
	   

	

	
		
