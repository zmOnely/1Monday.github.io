* vi编辑器
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
		* :q! 放弃存储名退出
		* :wq或:x 保存退出
	* 不同模式之间的切换 
	* ![vi工作模式.png](https://upload-images.jianshu.io/upload_images/14467401-d74af935810e7d9c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 可视模式
	*  v：可视模式
	* V：可视行模式
	* Ctrl+v：可视块模式
	* 注意
	* 在所有可视模式中，d和x键可以用删除选定的内容，在可视块模式中，选中所需行，按I键输入内容，之后按两次esc键，可在所有选定行光标处添加同样的内容

	