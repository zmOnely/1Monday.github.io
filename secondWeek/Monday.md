## sed
* 格式
	* sed [选项] [动作] filename
* 选项
	* -n 安静的输出
* 结合动作的命令
	* p 输出
		* sed -n 'p' lll.txt
		* ![s1.png](https://upload-images.jianshu.io/upload_images/14467401-eaee043e6b8bd686.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* sed -n '3p' lll.txt 
		* sed -n '1,5p' lll.txt
		* sed -n '5，$p' lll.txt 
		* ![s2.png](https://upload-images.jianshu.io/upload_images/14467401-991ff68026be7c25.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* ps：数字代表输出第几行
		* sed -n '1~2p' lll.txt
			* 输出第一行第三行第五行...
		* sed -n '3~2p' lll.txt
			* 输出第三行第五行第七行...
			* 第一个数字含义起始行，第二个数字是跨多少行	
	* a 向下新增 （代表向第一行后面，也就是第二行插入）		
		* sed '1a tttttttttt ' lll.txt
		* sed '1,5a tttttttttt ' lll.txt
		* ![s3.png](https://upload-images.jianshu.io/upload_images/14467401-f5ee363ddd03f763.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
			* ps；不写数字就是往每一行的后面插入一行
	* i 向上新增	
		* sed 'i 1111111111' lll.txt
		* sed '2i 1111111111' lll.txt
		* sed '2,$i 1111111111' lll.txt
		* ![s4.png](https://upload-images.jianshu.io/upload_images/14467401-602a1658446f459c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* c 替换 可以分行替换
		* sed 'c 1121111111' lll.txt
		* ![s5.png](https://upload-images.jianshu.io/upload_images/14467401-e80d71596db64a18.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* d 删除
		* sed 'd' lll.txt  全删
		* sed '1,3d' lll.txt
		* ![s6.png](https://upload-images.jianshu.io/upload_images/14467401-96c475b5c918d274.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* sed '/^$/d' lll.txt 删除空行
		* ![s11.png](https://upload-images.jianshu.io/upload_images/14467401-fd162290829d0827.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* s 取代 经常配合正则进行操作
	* 格式：sed 's/old/new/' filename
		* sed 's/hhhhhhhhh/ggggggggggg/' lll.txt
			* ps：它只将每行的找到的第一个换掉
			* ![s8.png](https://upload-images.jianshu.io/upload_images/14467401-02968e954380e259.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* sed 's/hhhhhhhhh/oooooo/g' lll.txt
			* ps：它会换掉所有匹配的
		* sed 's/l.*l/ppp/g' lll.txt
			* ps：会把l...l之间的所有换为ppp
			* ![s9.png](https://upload-images.jianshu.io/upload_images/14467401-263796d98c37c6ed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 高级操作 
	* | 管道符 
	* 可执行多条指令，将左侧的命令输出结果，作为右侧命令的处理对象
		* eg：
		* ll | sed -n 'p'
		* ![s7.png](https://upload-images.jianshu.io/upload_images/14467401-91fcbee59c9da7d6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* {} 可以进行多个动作，动作之间用";"分开
		* sed '{10,15d;s/hadoop1/h1/}' /etc/passwd
		* ![s13.png](https://upload-images.jianshu.io/upload_images/14467401-f62657d29491d824.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* sed -n '{p;n}' /etc/passwd 隔一行输出一行
	* & 替换  	
		* sed 's/^hadoop/&h1/' /etc/passwd 会将老名新名一起输出
	* s配合正则使用
		* sed 's/^[a-z]/\u&/' /etc/passwd
		* ps:将所有首字母变为大写，如果没有&，那首字母不会出现
	* () 分组功能
		* 首先分组的序号是从1开始的并且是按照从左到右的顺序排的
	要获取使用\分组的序号来进行获取，例如\1就是个占位符	
		* eg：
		* sed 's/\([a-z0-9_-]*\):x:\([0-9]*\):\([0-9]*\):.*$/user:\1 userid:\2 groupid:\3/'
	* 综合使用
		* ifconfig ens33 | sed -n '/inet /p' | sed 's/inet //' | sed 's/ net.*$//'
		* 将ip地址提取出来
		* ![s12.png](https://upload-images.jianshu.io/upload_images/14467401-8a0244223c4dbdac.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### sed和awk都是行读取
## awk
### awk常规格式
* 格式
	* awk options选项 'command' filename
* 选项
	* -F 设置分隔符
### awk的拓展格式	
* 格式
	* awk options选项 'BEGIN{} command END{}' filename
* 命令
	* awk -F ':' '{print NR}' /etc/passwd
		* NR 行号 输出passwd的行号
	* awk -F ':' '{print "line:"NR,"col:"NF,"user:"$1}' /etc/passwd
		* ps：输出行号，列数，每一行的信息都是以“:”来进行分组的，$1表示第一组，也就是用户名
		* ![2.png](https://upload-images.jianshu.io/upload_images/14467401-c85a79d4b675fe28.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* awk -F ':' '{printf("line:%3s col:%s user:%s\n",NR,NF,$1)}' /etc/passwd
		* ps：格式进行对齐
		* ![3.png](https://upload-images.jianshu.io/upload_images/14467401-986ffa6321d552ca.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* awk -F ':' '$1~/^h.*/{printf ("line:%3s col:%s uid:%4s user:%s\n",NR,NF,$3,$1)}' /etc/passwd	
		* ![4.png](https://upload-images.jianshu.io/upload_images/14467401-ba788a1552df8d52.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* awk -F ':' 'BEGIN{print "line col uid user"} {printf("%3s %s %4s %s\n",NR,NF,$3,$1)}' /etc/passwd
		* ![5.png](https://upload-images.jianshu.io/upload_images/14467401-e2dbdc0f79918261.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
    * awk -F ':' 'BEGIN{print "line col uid user"} {printf("%3s %s %4s %s\n",NR,NF,$3,$1)} END{print"-----"FILENAME"-----"}' /etc/passwd
		* ![6.png](https://upload-images.jianshu.io/upload_images/14467401-b26c3ff935834fdb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ll | awk 'BEGIN{size=0} {size+=$5} END{print size}'
		* ![7.png](https://upload-images.jianshu.io/upload_images/14467401-e7eeab120630c478.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* awk 'BEGIN{count=0} {count++} END{print count}' /etc/passwd
		* ![8.png](https://upload-images.jianshu.io/upload_images/14467401-62bdca0bd51fa242.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* awk 'BEGIN{count=0} $1!~/^$/{count++} END{print count}' /etc/passwd
		* 判断不是空行才数量加1
	* awk -F ':' 'BEGIN{count=0} {if($3>100) name[count++]=$1} END{for(i=0;i<count;i++) print i,name[i]}' /etc/passwd	
		* ![10.png](https://upload-images.jianshu.io/upload_images/14467401-de851c892005c4b9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

		
	
	
	
	
