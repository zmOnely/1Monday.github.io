## 安装azkaban步骤：
* 1.将azkaban-executor-server-2.5.0.tar.gz；存放了执行器
      azkaban-sql-script-2.5.0.tar.gz；存放azkaban运行需要的sql
	  (sql倒完了这就没用了)
	  azkaban-web-server-2.5.0.tar.gz；存放web服务器
	  create-all-sql-2.5.0.sql 完整的sql文件，只执行它就可以
	  压缩包解压  
* 2.azkaban-executor-2.5.0 启动，关闭执行器  start/shutdown
    azkaban.properties
     
	 azkaban-web-2.5.0 启动，关闭服务器
	 azkaban.properties 设置时间，设置mysql的信息，jetty密码等同于ssl的密钥
	 azkaban-users.xml 设置登录azkaban的用户及其权限
	 
	
	  