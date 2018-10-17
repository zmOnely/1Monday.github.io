git使用

一、如果是直接从远程仓库进行克隆
	1.git clone 仓库路径
	2.创建自己的文件
	3.git add 要上传的文件
	4.git commit -m "提交的信息"
	5.git pull(因为你不知道什么时候远端代码会跟本地仓库版本不匹配，所以要提交之前先进行拉取再推送)
	6.git push

二、如果是自己在本地创建仓库，然后将内容同步到远程仓库
在桌面下
mkdir 文件名
进入到我创建的文件下
cd 文件名
	1.git init (初始化生成git仓库，生成.git文件夹)
	2.操作自己的文件
	3.git add 要上传的文件
	4.git commit -m "提交的信息"
	5.git remote add origin 要连接的远程仓库的地址
因为刚开始初始化的仓库并不知道接下来的代码要提交到哪个远端仓库中
eg:
git remote add origin git@github.com:zmOnely/more.git
	6.git pull origin master
	第一次要将代码上传到远端空的仓库是不需要进行拉取操作的，之后的每一次推送前要都先进行pull的操作
如果没进行push指令进行默认的分支选择,直接使用git pull命令会失效
	7.git push -u origin master
只有第一次需要执行以后的操作都是默认往master这个主分支上面进行操作才需要加，以后push,和pull都只需要git push/pull就好了

三、默认情况下哪个账号创建的仓库，只有本人能提交东西上来，如果想要多人开发需要邀请别人成为协作者，
或者通过创建组织、团队来实现多人共同维护一个仓库

四、如果遇到需要解决代码冲突的问题
	1.git stash对我们的本地代码进行入栈操作
	2.git pull 将我们远端仓库的代码拉取下来
	3.git stash pop将我们的本地代码进行出栈
远端代码和本地代码有冲突的部分会出现
<<<<<<
xxxxxxxx
========
xxxxxxxx
>>>>>>>
这样,我们只需要将<,=,>都删掉，然后将冲突代码都改成我们最终想要的样子保存重新提交就好了




