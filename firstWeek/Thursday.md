* vi编辑器
* [相关参考ppt，需要请点击，进行下载~~](https://zmonely.github.io/zmOnely/firstWeek/vi.ppt)
	* 概述
	* vi编辑器是Linux中常用的文本编辑器
		* vi编辑器
	* 类Unix系统中默认的文本编辑器
	* vi可以执行输出、删除、查找、替换、块操作等众多文本操作，而且用户可以根据自己的需要对其进行定制
	* 维护Linux系统中的各种配置文件
		* vim编辑器
	* vi编辑器的增强版本，习惯上也称为vi
	* 工作模式
	* 三种模式
		* 命令模式-----一般模式
			* 插入命令
			* ![插入模式.png](https://upload-images.jianshu.io/upload_images/14467401-3918f03466eff784.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* 定位命令
			* ![定位命令.png](https://upload-images.jianshu.io/upload_images/14467401-b5e47a5ecd838b45.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
				* h:左移一个字符
				* l:右移一个字符
				* j:下移一行
				* k:上移一行
				* $:移至行尾
				* 0:移至行首
				* nG:移到第n行
			* 删除命令
				* dd:删除当前行
				* ndd:删除光标所在当前行向下数n行
				* D:删除当前行光标所在的位置后面的字符
				* x:向后删除光标所在位置的字符
				* X:向前删除光标前面的字符
				* nX:删除前面的n个字符，光标所在的字符将不会被删
			* 复制和粘贴命令
				* yy或Y:复制当前行
				* nyy或nY：复制以下n行
				* p:在光标后面插入buffer中的内容
				* P:在光标前面插入buffer中的内容
			* 替换和撤销命令
				* r:取代光标所在处的字符
				* R:从光标所在处开始替换字符，按esc结束
				* u:撤销上一步操作
		* 插入模式
		* 末行模式-----底行模式
			* 查找操作
				* :set nu	设置行号
				* :set nonu	取消行号
				* :n	移到第n行
				* :/查找的关键字
			* 替换操作
				* :s /old/new	将当前行中查找到的第一个字符“old” 串替换为“new”
				* :s /old/new/g	将当前行中查找到的所有字符串“old” 替换为“new”
				* :#,# s/old/new/g 	在行号“#,#”范围内替换所有的字符串“old”为“new”
				* :% s/old/new/g	在整个文件范围内替换所有的字符串“old”为“new”
				* :%s/old/new	查找文件中所有行第一次出现的old，替换为new
			* 其他命令
				* :W[文件路径]保存当前文件
				* :q 如果未对文件做改动则退出
				* :q! 放弃存储并退出
				* :wq或:x 保存退出
	* 不同模式之间的切换 
	* ![vi工作模式.png](https://upload-images.jianshu.io/upload_images/14467401-d74af935810e7d9c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 可视模式
	* v：可视模式
	* V：可视行模式
	* Ctrl+v：可视块模式
	* ps：
	* 在所有可视模式中，d和x键可以用删除选定的内容，在可视块模式中，选中所需行，按I键输入内容，之后按两次esc键，可在所有选定行光标处添加同样的内容
* 用户和组
	* 前言
		* Linux系统
		* linux操作系统是一个多用户操作系统，它允许多用户同时登录到系统上并使用资源，系统会根据账户来区分每个用户的文件，进程，任务和工作环境，使得每个用户工作都不受干扰
		* 配置文件
		* 保存用户信息的文件：/etc/passwd
		* 保存密码的文件：/etc/shadow
		* 保存用户组的文件：/etc/group
		* 保存用户组密码的文件：/etc/gshadow
		* 用户配置文件：/etc/default/useradd
	* 简介
		* 用户在系统中是分为角色的，通过UID来识别角色
			* root用户，系统唯一，可以操作系统任何文件和命令，拥有最高权限，UID=0 
			* 虚拟用户(系统账户)，不具有登录系统能力，但却是系统运行不可缺少的用户。如：bin、daemon、ftp、mail等，UID为1---499之间
			* 普通真实用户，可以登录系统，权限有限，靠管理员创建，UID为500—60000之间
		* 系统用户
			* 1 – 99：由distributions自行创建的系统账号
			* 100 – 499：若用户有系统账号需求时，可以使用的UID
		* 为了更好地管理用户，出现组group的概念
			* 基本组（私有组） 当用户创建文件和文件夹时，默认属于私有组
			* 附加组（公共组）
	* 用户管理
		* 用户管理配置文件
			* 用户账号文件--/etc/passwd
				* 用于保存用户的账号基本信息
				* 每一行对应一个用户的账号记录，一行有7个段位，用“:”隔开
				* ![账号管理.png](https://upload-images.jianshu.io/upload_images/14467401-4e19eac8a4c0cff4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* 用户密码文件--/etc/shadow
				* 用于保存密码字串、密码有效期等信息
				* 每一行对应一个用户的密码记录
				* ![密码管理.png](https://upload-images.jianshu.io/upload_images/14467401-900f8b9f26c130df.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 命令
			* useradd 添加用户命令
				* -u 指定组ID（uid）
				* -g 指定所属的组名（gid）
				* -G 指定多个组，用逗号“，”分开（Groups）
				* -c 用户描述（comment）
				* -e 失效时间（expire date）
				* eg：
				* useradd -u 888 -g users -G sys,root -c "hr zhang" zhangsan passwd zhangsan
			* passwd [选项] <用户名>
				* -d：清空用户的密码，使之无需密码即可登录
				* -l： 锁定用户帐号.
				* -S：查看用户帐号的状态（是否被锁定）
				* -u：解锁用户帐号
				* -x:    最大密码使用时间（天）
				* -n:    最小密码使用时间（天）
			* usermod 修改已有用户属性
				* -l 修改用户名 （login）usermod -l a b（b改为a）
				* -g 添加组 usermod -g sys tom
				* -G添加多个组 usermod -G sys,root tom
				* –L 锁定用户账号密码（Lock）
				* –U 解锁用户账号（Unlock）
			* userdel 删除用户命令
				* -r 删除账号时同时删除目录（remove）
	* 组管理
		* 组管理配置文件
			* 用户组文件 /etc/group
				* 保存组账号基本信息
				* 文件每一行表示一组记录，包括组名、GID和组的成员，（组成员显示次组成员）
				* ![组管理.png](https://upload-images.jianshu.io/upload_images/14467401-c8db84f018dc51ce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* 用户组密码文件
				* 保存组账号的密码信息
					* 用户组
					* 用户组密码，如果是空或者有“！”，表示没有密码
					* 用户组管理者
					* 组成员，用逗号“，”隔开
		* 命令		
			* groupadd 添加组账号
				* -g 指定gid
			* groupmod [选项] <用户名> 修改用户组的属性
				* -g：设置想要使用的GID
				* -o：使用已经存在的GID
				* -n：设置想要使用的群组名称
			* groupwd [选项] <用户名> 添加/删除组成员
				* -a：向组内添加一个用户
				* -d：从组内删除一个用户成员
				* -M：定义组成员列表，以逗号分隔
			* groupdel <组账号名> 删除组账号
			* ps：
		    * 只能删除那些没有被任何用户指定为主组的组
			* groups [用户名] 显示用户所属组
* 文件及目录权限管理
	* 权限和权限值
		* 读：读取文件的内容；列出目录里的对象
		* 写(w)：允许修改文件；在目录里面新建或者删除文件
		* 执行(x)：允许执行文件；允许进入目录里
	* ![权限.png](https://upload-images.jianshu.io/upload_images/14467401-cfebcf37323be099.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 数字权限
		* 读：4 
		* 写：2
		* 执行：1		
	* chmod 修改文件权限命令
		* 格式：
		* 1.chmod [ugoa] [+-=] [rwx] file/dir 
			* ps：u:属主  g:属组  o:其他用户  a:所有用户
			+:添加权限  -:删除权限  =:赋予权限
		* 2.chmod nnn file/dir 设置文件或目录权限 
		* eg：
		* 1.chmod  u+x  a.txt
		* 2.chmod  750  b.txt
	* chown 改变文件所属
		* chown 用户名 file/dir 属主
		* chown :用户名 file/dir 属组
		* chown  用户名:用户名 file/dir 属主:属组
		* -R：递归的修改指定目录下所有文件、子目录的归属
		
			
			
	