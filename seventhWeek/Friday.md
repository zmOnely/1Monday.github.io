### ��������αzookeeper
* 1.��zookerperѹ��������/home/hadoop�£���ѹ
* 2.mkdir zk������ѹ�õ�zookeeper-3.4.6�ļ����ƶ���zk�ļ�����
    mv zookeeper-3.4.6 zk/
* 3.���ļ��и���Ϊzk1
    mv zookeeper-3.4.6/ zk1	
* 4.�ڸ�������zk1������Ϊzk2,zk3
	cp zk1/ zk2; cp zk1/ zk3
	![image.png](https://upload-images.jianshu.io/upload_images/14467401-b81d4eb0908af545.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 5.�ֱ�����
	* ��/home/hadoop/zk/zk1/conf��
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a22ac4db0b6cd682.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 6.�����id			
	* echo "1" >> /home/hadoop/zk/zk1/zkData/myid
	* ps��""��������ֺ������е�server.#Ҫ����һ�£�������������
	* server.1=192.168.197.148:2888:3888
* 7.��������
	* ��/home/hadoop/zk��
	* zk1/bin/zkServer.sh start
* 8.�鿴Ч��
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-c461c8dbe6dc4ce7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ps��������Ϊ�ɹ�

	
### ������ȫ�ֲ�ʽ��zookeeper
* 1.��zookerperѹ��������/home/hadoop�£���ѹ
* 2.����
	* cd /home/hadoop/zookeeper-3.4.6/conf
	* cp zoo_sample.cfg zoo.cfg
	* vim zoo.cfg ���и���
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-7df0bec4486da587.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 3.cd .. �˻�/home/hadoop/zookeeper-3.4.6	
	* mkdir zkdata
	* echo "2" >> zkdata/myid
* 4.����̨������ͬ�Ĳ������������
	* bin/zkServer.sh start(/home/hadoop/zookeeper-3.4.6)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-eb1499dd594000db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 5.�鿴״̬
	* bin/zkServer.sh status
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-eca49ade07041a4b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 6.�鿴��־��Ϣ(���д���ʱ)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-6c493b021213cb54.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	
* ͨ��xshell����zookeeper	
	
* ͨ��java����zookeeper	
	
	
	
	
	
	
	
	
	