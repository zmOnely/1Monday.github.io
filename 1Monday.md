git仓库的使用
一、在git中的准备工作
1.创建一个新仓库，命名必须是**.github.io形式
2.选择一个主题
二、git Bash命令的步骤
1.cd ~
跳转到当前用户的home目录
2.pwd
查看当前路径
eg;
/c/Users/Administrator
3.cd Desktop
进入到桌面下
ps：打上De，按tab键自动补全
4.ssh-keygen -t rsa -C "邮箱名"
创建公钥到C:\Users\Administrator\.ssh，然后打开id_rsa.pub，将其中的公钥复制，
打开git用户的setting下的SSH and GPG keys，创建一个新的SSH钥匙，将公钥复制。
5.git clone 博客名
博客名获取：打开git仓库，点击Clone or download，选择使用SSH，复制博客名
eg：
git@github.com:zmOnely/1Monday.github.io.git
6.ls
查看桌面下的文件
7.cd 仓库名
进入到仓库中
eg：
cd zmOnely.github.io/
8.ls
查看一下仓库中的文件
9.git status
查看状态
10.touch 文件名.md
在仓库中创建一个文件
eg：touch 1Monday.md
11.git status
查看创建的状态
12.git add 1Monday.md
将新创建的文件暂时添加到缓存中
13.git status
查看状态
14.git config --global user.email "邮箱"
登录邮箱
15.git config --global user.name "文件名"
16.git commit -m "名"
提交
17.git push -u origin master
将文件全部放到仓库中
三、实现效果展示
![1.png](https://upload-images.jianshu.io/upload_images/14467401-2ef46bb856a00c4c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)