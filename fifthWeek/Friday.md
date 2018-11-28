## Hive函数
* 字符串转换
	* select cast('2017-08-15' as date);
	
* 向上取整
	* select ceil(5.1);

* 向下取整
	* select floor(5.1);

* 取最大值（单行函数）
	* select greatest(1,6,9);
* 字符串截取
	* select substr('2015-09-05',4);
	* select substring('2015-09-05',4);
		* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-f52e7010faf48859.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		* ps：4代表从第四个字符开始取，从1开始
	* select substring('2015-09-05',6,9);
	* select substr('2015-09-05',1,7);
		
	* select split('172.18.24.198','`\\`.');
		* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-9ae1e4c2ad3b1038.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 拼接
	* select concat('a','b');
	* ps：将a，b拼接在一起
	* select concat_ws('-','a','b');
	* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-e276b984d9a8528b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 日期
	* select current_date();
	* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-f3be22963d962a7a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* select current_timestamp();
	* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-714b38aaeec657f5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* select unix_timestamp();
	* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-86eb5562c978f56a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* select from_unixtime(unix_timestamp());
	* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-edc934a518f2fcee.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-6138bf92133d0df0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-7b4bfcfaa1e1e736.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* if
	* select name ,if(actors[0]='刘亦菲','look','no look') m movies;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-42918704c1bf85e0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-d5666ff2ee67364b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* contains
	* select array_contains(actors,'刘亦菲') from movies;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-58a6ac652d754b9c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* case when
	* select name,money,
	* case 
	* when money <= 1000 then '潜力股'
	* when money <= 10000 then '小资'
	* when money >= 10000 then '狗大户'
	* end ahh,dep
	* from company_emp;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-53f3d6773c93806d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* 源表
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-e9eac7eb407849c1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 创建数组
	* select array(3,7,5);
* 排序
	* select sort_array(array(3,7,5));
	* ![12.png](https://upload-images.jianshu.io/upload_images/14467401-e1b6a6e7bc3c8fe5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* size
	* select family,size(family) from maps;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-a2ba63cf636da209.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* select map_keys(family),family from maps;
	* ![851321370811434798.png](https://upload-images.jianshu.io/upload_images/14467401-94cbccec3d4a7db8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 查找有姐姐的所有信息
	* select name,family['sister'] 
	* from maps 
	* where array_contains(map_keys(family),'sister'); 
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-ab7a39d774fd842e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* count
	* select count(if(money > 10000,1,null)) from company_emp;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-242aeae131389362.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* select gender,count(if(status='jiuye',1,null)) 
	* from students group by gender;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-b61ae3bf2bf5b60b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ps：count(null)，这代表count的结果为0
	* 源表
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-2cf93db5b26b6529.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* collect_set
	* select id,name,collect_set(sub) from subject group by id,name;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-11c124d2130dd75b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-16b94fbe030472f5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

	* ps：这是table_exp表
* explode 炸裂 将数组中的元素单列取出
	* select explode(subjs) from table_exp;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-37116411d901043d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* lateral view
	* select * from table_exp
	* lateral view explode(subjs) sj as subs;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-d2a6a73fd53b79f1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* json_tuple
	* json_lin表
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-d63e8a3d52060bf4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* select json_tuple(jsonstr,'movie','rate','uid') as (mov,rate,uid)
	* from json_lin;
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-0bb9af5cce596412.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* top
	* topn表
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-0138b0dce8f647bc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	```
	select id,name,age,gender
	from
	(select id,age,name,gender,
	row_number() over(partition by gender order by age desc) as rank 
	from topn) res
	where rank <= 2;
	```
	* ![image.png](https://upload-images.jianshu.io/upload_images/14467401-73199c5f863006bf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	
* 需求：将源表的数据改为最终表的形式
* ![表.png](https://upload-images.jianshu.io/upload_images/14467401-4be40d510da2bb6f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 思路第一步
	```
	select a.*,sum(cnt) 
	from 
	(select name,time,sum(amount) acount from work group by name,time) a
	join
	(select name,time,sum(amount) cnt from work group by name,time) b
	on a.name=b.name;
	```
	* ![51.png](https://upload-images.jianshu.io/upload_images/14467401-a47ade8fe83af428.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	
	* 思路第二步
	```
	select a.*,sum(cnt) 
	from 
	(select name,time,sum(amount) acount from work group by name,time) a
	join
	(select name,time,sum(amount) cnt from work group by name,time) b
	on a.name=b.name
	group by a.name,a.time,a.acount;
	```
	* ![52.png](https://upload-images.jianshu.io/upload_images/14467401-49ac24cf0eb60c81.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 思路第三步
	```
	select a.*,sum(cnt) 
	from 
	(select name,time,sum(amount) acount from work group by name,time) a
	join
	(select name,time,sum(amount) cnt from work group by name,time) b
	on a.name=b.name
	where a.time >= b.time
	group by a.name,a.time,a.acount;
	```
	* ![53.png](https://upload-images.jianshu.io/upload_images/14467401-54f00b1cb30469b7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
	* 第二方法
	```
	select name,time,cnt,sum(cnt) 
	over(partition by name order by time
	rows between unbounded preceding and current row) as sum
	from 
	(select name,time,sum(amount) cnt
	from work
	group by name,time) aa;
	```

