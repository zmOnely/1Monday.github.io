## git使用

* 直接从远程仓库进行克隆
	* ps：笔记在Monday
* 在本地创建仓库,然后将内容同步到远程仓库
	* cd Desktop/ 进入桌面
	* mkdir 文件名 创建一个文件夹
	* cd 文件名 进入到我创建的文件下
	* git init 初始化生成git仓库,生成.git文件夹
	* ![1.png](https://upload-images.jianshu.io/upload_images/14467401-810dc5c3d9e61f12.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![2.png](https://upload-images.jianshu.io/upload_images/14467401-86f48207d2fc44f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* touch 文件名 创建文件，进行操作
	* ![3.png](https://upload-images.jianshu.io/upload_images/14467401-ba9c1c45e7ba7435.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* git add 要上传的文件
	* git commit -m "提交的信息"
	* git remote add origin 要连接的远程仓库的地址
		* 因为刚开始初始化的仓库并不知道接下来的代码要提交到哪个远端仓库中
		* eg:
		* git remote add origin git@github.com:zmOnely/more.git
	* ![4.png](https://upload-images.jianshu.io/upload_images/14467401-50fb4cf5c002607b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)	
	* git pull origin master
		* 第一次要将代码上传到远端空的仓库是不需要进行拉取操作的,之后的每一次推送前要都先进行pull的操作
		* 要是第一次上传到有文件的仓库，第一次也要进行拉取操作
		* ![6.png](https://upload-images.jianshu.io/upload_images/14467401-77c86ff4a3e62bfb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* 如果git pull之后是下图这样，是因为上传到了非空的仓库中，只需要执行上图的命令解决
		* ![5.png](https://upload-images.jianshu.io/upload_images/14467401-0b7d95822ba95bc3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* git push -u origin master
		* 只有第一次需要执行，以后的操作都是默认往master这个主分支上面进行操作
		* ![7.png](https://upload-images.jianshu.io/upload_images/14467401-8370041ece618806.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 默认情况下哪个账号创建的仓库，只有本人能提交东西上来，如果想要多人开发需要邀请别人成为协作者
或者通过创建组织、团队来实现多人共同维护一个仓库
或者通过创建组织、团队来实现多人共同维护一个仓库
* 代码冲突的问题的解决
	* git stash对我们的本地代码进行入栈操作
	* git pull 将我们远端仓库的代码拉取下来
	* git stash pop将我们的本地代码进行出栈,远端代码和本地代码有冲突的部分会出现
		* （<<<<<<
		* xxxxxxxx
		* ========
		* xxxxxxxx
		* >>>>>>>）
		* 这样,我们只需要将<,=,>都删掉,然后将冲突代码都改成我们最终想要的样子保存重新提即可
		* ![git.jpg](https://upload-images.jianshu.io/upload_images/14467401-884dd681e6ce72d4.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)





