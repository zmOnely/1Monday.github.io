## shell编程    
```
[相关参考ppt，需要请点击，进行下载~~](https://zmonely.github.io/zmOnely/secondWeek/shell.ppt)
```
* shell简介
	* 概述
		* Shell是一个功能强大的编程语言，易编写，易调试，灵活性较强
		* Shell是解释执行的脚本，在shell中可以直接调用Linux系统命令
	* 基本格式
		* 代码写在普通文本文件中，通常以.sh结尾
			* eg：
			* vim helloworld.sh
		* 脚本第一行是固定需要的，表明用哪一种shell解析器来执行我们的这个脚本程序
			* #!/bin/bash
			* echo “hello world!”
	* 执行方式
		* sh方式 
			* 直接指定用系统默认的bash shell解释执行
			* sh hello.sh
		* source方式 即'.'点命令	
			* 使Shell读入指定的Shell程序文件并依次执行文件中的所有语句
			* 通常用于重新执行刚修改的初始化文件，使之立即生效，而不必注销并重新登录
			* . helloworld.sh
		* 直接用文件名执行该文件
			* ./helloworld.sh
			* /root/helloworld.sh
			* ps：1.有两种方式，不过这两种方式的执行，都需要该文件有执行权限，所以在执行之前，我们要更改他的执行权限
			* 2.要写成 ./test.sh，而不是 test.sh，运行其它二进制的程序也一样，直接写 test.sh，linux 系统会去 PATH 
			里寻找有没有叫 test.sh 的，而只有 /bin, /sbin, /usr/bin，/usr/sbin 等在 PATH 里，你的当前目录通常不在 PATH 
			里，所以写成 test.sh 是会找不到命令的，要用 ./test.sh 告诉系统说，就在当前目录找
* bash基本功能
	* 简介
		* Bash是GNU计划的一个组件，与Unix上的Bourne Shell完全兼容，是其增强版本；支持命令行输入、操作历史、快捷键、
		输入输出重定向、管道、变量等功能
	* 命令
		* history
			* 在Bash中输入history指令可以查询用户的过往操作
			* 历史命令会默认保存1000条，可以在环境变量配置文件中/etc/profile进行修改
			* History表存储在内存中，在用户logout时会记录入用户家目录的.bash_history文件中，在下次login时载入
			* -c 清除历史命令
			* -w 把缓存中的历史命令写入历史命令保存文件  保存位置：~/.bash_history
		* 补全命令
			* 按“Tab”就会自动补全；连续两下[Tab] 可以输出以前面字母开头的所有命令
		* cut 截取命令 
			* 显示文件中的某一列
			* 格式 
				* cut  <选项>   文件
			* -d 指定分隔符
			* -f 依据 -d 的分隔字符将一段信息分割成为数段，用 -f 取出第几段的意思
				* echo $PATH `|` cut -d ':' -f 5 按照：来分组，找出第五组
			* -c 指定几个字符对应的列			

	* 命令的别名
		* 概述
			* 用户可以为某一个复杂的指令创建一个简单的别名，当用户使用这个别名时，系统就会自动找到并执行这个别名对应的真实指令，从而提高工作效率
		* 用法
			* 用户可以键入alias指令，来查询当前已经定义的alias列表，也可直接创建
				* alias la='ls -a'
			* 用户也可以用unalias来取消一条别名记录
				* unalias la
			* ps：重新登录后失效
	* 各种符号
		* 管道符 `|`
			* 将左侧的命令输出结果，作为右侧命令的处理对象
			* 格式
				* cmd1 `|` cmd2 [cmd3 `|` cmdn]
			* cat test.txt `|` wc -l
		* 通配符
			* ![1.png](https://upload-images.jianshu.io/upload_images/14467401-1ca86758cff223cc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 其他特殊符号
			* ![2.png](https://upload-images.jianshu.io/upload_images/14467401-ca3c2af0f3ab1151.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 常用热键
			* ![5.png](https://upload-images.jianshu.io/upload_images/14467401-608b1a32f036d03e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* shell编程
* 概述
	*  Linux环境中，Shell不仅是常用的命令解释程序，而且是高级编程语言，用户可以通过编写
	Shell程序来完成大量任务的自动化
	* Shell编程语言，它有变量、关键字以及各种控制语句，比如if、case、while、for等语句，支持函
    数模块，有自己的语法结构
* shell中的变量
	* 系统变量
		* $HOME,$PWD,$SHELL,$USER等，可以用set命令查看，即set可以显示当前所有变量
	* 用户自定义变量	
		* 格式
			* 变量名=变量值
			* STR="hello,shell"
		* 规则
			* 变量与变量内容以一个等号来连结
			* 等号两侧不能有空格
			* 变量名以字母或下划线开头，区分大小写，建议全大写
		* 有关于
			* unset 变量名 撤销变量
			* readonly B=2 声明静态的变量 B=2 ，不能撤销
			* export 变量名 可把变量提升为全局环境变量，可供其他shell程序使用
		* 赋值时的引号问题
			* 双引号：允许通过$符号引用其变量值
			* 单引号：禁止引用其他变量值，$视为普通字符
			* 反撇号：命令替换，提取命令执行后的输出结果，一般用$()代替
		* read 命令	
			* read  [-p  "提示信息"]  变量名
			* read -p "please input your name: " NAME
	* 特殊变量
		* ![4.png](https://upload-images.jianshu.io/upload_images/14467401-6ea0acc9a426cb19.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 运算符
	* 加法运算：+
	* 减法运算： -
	* 乘法运算： \*  !!!注意需要转义
	* 除法运算： /
	* 求模（取余）运算： % 
* 算术运算
	* eg：（2+3）x4
	* expr `expr 2 + 3` \* 4
* 条件测试
	* test命令
	* 用途
		* 测试特定的表达式是否成立，当条件成立时，测试语句的返回值为0，否则为其他数值
	* 格式
		* test 条件表达式
		* [ 条件表达式 ]
	* 文件测试
		* 格式 
			* [  操作符  文件或目录  ]
			* ps：[]前后一定要有空格！！
		* 常用测试操作符	
		```
		-d：测试是否为目录（Directory）
		-e：测试目录或文件是否存在（Exist）
		-f：测试是否为文件（File）
		-b:  该文件是否存在且为一个块设备文件
		-c:  该文件是否存在且为一个字符设备文件
		-S: 该文件是否存在且为一个Socket文件
		-p:  该文件是否存在且为一个FIFO(pipe)文件
		-L:  该文件是否存在且为一个链接文件
		```
		* eg：（返回1表示条件不成立，返回0表示条件成立）
		```
		[root@master ~]# [ -d /etc/hosts ]
		[root@master ~]# echo $?
		1
		[root@master ~]# [ -e /etc/hosts ]
		[root@master ~]# echo $?
		0
		```
	* 条件测试
		* 文件权限测试
			* 格式
				* [  操作符  文件或目录  ]
			* 常用测试操作符	
			```
			-r：测试当前用户是否有权限读取（Read）
			-w：测试当前用户是否有权限写入（Write）
			-x：测试当前用户是否有权限执行（eXcute）
			-u： 测试该文件是否存在且具有suid属性
			-g： 测试该文件是否存在且具有sgid属性
			-k： 测试该文件是否存在且具有sticky bit属性
			-s ：测试该文件是否存在且为非空文件
			```
			```
			* eg：查看 /root/install.log 是否具有读的权限，有的话，输出yes，没有则输出no
			[ -r /root/install.log ] && echo "yes" || "echo no"
			```	
	* 数值比较
		* 格式
			* [  整数1  操作符  整数2  ]
		* 常用操作符
		```
		-eq：等于（Equal）
		-ne：不等于（Not Equal）
		-gt：大于（Greater Than）
		-lt：小于（Lesser Than）
		-le：小于或等于（Lesser or Equal）
		-ge：大于或等于（Greater or Equal）
		```
		```
		[ $2 -gt 1 ] && echo "too many"
		```
	* 字符串比较
		* 格式
			* [ 字符串1  =  字符串2 ]
			* [ 字符串1  != 字符串2 ]
			* [ -z  字符串 ]
		* 常用操作符
		```
		=：字符串内容相同
		!=：字符串内容不同，! 号表示相反的意思
		-z：字符串内容为空
		-n： string 判定字符串是否为非空，若string为空字符串，则为false
		ps： -n 亦可省略 

		```
		```
		aa=abc  bb=123
		[ $aa == $bb ] && echo "yes" || echo "no"
		[ $aa != $bb ] && echo "yes" || echo "no"
		name=Tammy
		[ -z $name ] && echo "yes" || echo "no"
		[ -n $name ] && echo "yes" || echo "no"
		```
* 控制流程
	* if语句结构
		* 单分支结构
			* 语法
			* if  条件测试操作
				* then   命令序列
			* fi
		* 双分支结构
			* 语法
			* if  条件测试操作
				* then   命令序列
				* else   命令序列
			* fi
		* 多分支结构		
		```
		#!/bin/bash
		read -p "please input your name:" NAME
		if [ $NAME = root ]
        then
                echo "hello ${NAME},  welcome !"
        elif [ $NAME = hadoop]
                then
                        echo "hello ${NAME},  welcome !"
        else
                echo "SB, get out here !"
		fi
		```
	* case语句结构
		* 语法
		
		```
		case  变量值  in
		模式1)
			命令序列1
			;;
		模式2)
			命令序列2
			;;
　			……
		*)
			默认命令序列
		esac
		
		```
		
		
		

			
	
			
			
		
		