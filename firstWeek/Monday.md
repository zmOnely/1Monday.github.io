* git仓库的使用 
* 在git中的准备工作
	* 创建一个新仓库
	* 选择一个主题
* git Bash命令的步骤
	* cd ~ 跳转到当前用户的home目录
	* pwd 查看当前路径
		* eg：
		* /c/Users/Administrator
	* cd Desktop 进入到桌面下
		* ps：打上De，按tab键自动补全
		* ![1.png](https://upload-images.jianshu.io/upload_images/14467401-850d242a60c49af9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ssh-keygen -t rsa -C "邮箱名"
		* 创建公钥到C:\Users\Administrator\.ssh，然后打开id_rsa.pub，将其中的公钥复制，
		* 打开git用户的setting下的SSH and GPG keys，创建一个新的SSH钥匙，将公钥复制
		* ![2.png](https://upload-images.jianshu.io/upload_images/14467401-6c12ba297d3035bd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* git clone 博客名
		* 博客名获取：打开git仓库，点击Clone or download，选择使用SSH，复制博客名
		* eg：
		* git@github.com:zmOnely/1Monday.github.io.git
		* ![3.png](https://upload-images.jianshu.io/upload_images/14467401-394555108514004a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ls 查看桌面下的文件
	* cd 仓库名 进入到仓库中
		* eg：
		* cd zmOnely.github.io/
	* ls 查看一下仓库中的文件
		* ![4.png](https://upload-images.jianshu.io/upload_images/14467401-aee10feb8f2a86d8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* git status 查看状态
	* touch 文件名.md 在仓库中创建一个文件
		* eg：touch Monday.md OR > Monday.md
	* git add Monday.md 将新创建的文件暂时添加到缓存中
		* ![5.png](https://upload-images.jianshu.io/upload_images/14467401-79ba26d7bcbb42f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* git status 查看状态
	* git config --global user.email "邮箱" 登录邮箱
	* git config --global user.name "文件名"
	* ![6.png](https://upload-images.jianshu.io/upload_images/14467401-8874fd05f89c957a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* git commit -m "要提交的内容" 提交
	* ![7.png](https://upload-images.jianshu.io/upload_images/14467401-d12d3938d8957219.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* git pull 将远程和本地的内容统一
		* ps：这个步骤最好每次执行下，否则可能会出现git push时这样的错误
		* ![pull.png](https://upload-images.jianshu.io/upload_images/14467401-f7c0ac3a9bbd6e10.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* git push -u origin master 将文件全部传到远程仓库中
		*ps：第一次执行这样写，以后的每次执行直接git push 
		* ![8.png](https://upload-images.jianshu.io/upload_images/14467401-15ab741b6861937e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
