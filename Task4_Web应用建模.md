一、功能建模
=======
author:14130140358赵妍

1、用例图
---------
![image](https://github.com/foolishzhao/web/raw/master/图片2.png)

2.活动图
---------
![image](https://github.com/foolishzhao/web/raw/master/Cache_78ef946d6d7c76f1..jpg)
 
二、内容建模
======= 
author:14130140359肖蜜

1、类图
---------
![image](https://github.com/homilly/web-curriculum--design/blob/master/1.png)

详细设计
---------
![image](https://github.com/homilly/web-curriculum--design/blob/master/dao.png)

![image](https://github.com/homilly/web-curriculum--design/blob/master/Service.png)

![image](https://github.com/homilly/web-curriculum--design/blob/master/domain.png)

![image](https://github.com/homilly/web-curriculum--design/blob/master/utils.png)

![image](https://github.com/homilly/web-curriculum--design/blob/master/web.png)

2.状态图 
---------
* ###  User类状态图：
------
![image](https://github.com/homilly/web-curriculum--design/blob/master/2.png)

* ### information类状态图：
------
![image](https://github.com/homilly/web-curriculum--design/blob/master/3.png)

* ### comment类状态图：
------
![image](https://github.com/homilly/web-curriculum--design/blob/master/4.png)

三、超文本建模
=======
author:14130140358赵妍

1.静态建模（导航类图）
------

* ### common user视角的超文本结构模型
![image](https://github.com/foolishzhao/web/raw/master/超文本3.png)

四、适应性建模
========
author:14130140358赵妍

1.静态适应模型
---------
![image](https://github.com/foolishzhao/web/raw/master/超文本3.png)

静态适应模型是会根据上下文信息的不同变化集，创建面向结果的不同模型或者模型变换。
上图展现了common user 角色的超文本结构，在实际应用中，common user可以根据上下文进行角色的静态适应

2.动态适应模型
---------------
![image](https://github.com/foolishzhao/web/raw/master/DP2.jpg)

动态适应模型是根据不同用户（用户集）的个性化需求，在运行时通过一些转换规则进行相应的变化，来满足用户需求的一种建模方式。与静态适应相比，采用动态适应时要提交一些和上下文相关的内容、超文本和展示模型的转换规则。
上图展示了超文本模型中索引的动态适应。在本系统中WantedInformation可具体化为通过索引选择用户学院，班级，信息种类，以及拥有特别关注功能，用户可以选择特别关注某一类信息，当用户登录到本系统时，特别关注信息首先推送，还可以定制服务将用户账号与手机号绑定，特别关注信息将会第一时间推送到用户的手机上


四：适应性建模

author:14130140398 陈曦
----------
1:静态建模 　　
针对不同的上下文来为用户展示不同的模型，同时还要注意不同模型的变化以及后期可能的模型数量的增加。 　
静态建模如下所示（引用自超文本的静态建模）：
![image](https://github.com/supervicchen/vic/blob/master/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202017-06-19%20%E4%B8%8A%E5%8D%889.13.54.png)
2:动态建模 
主要展示用户个性化的动态适应,采用动态适应时与静态适应不同，它需要提交一些上下文相关内容，超文本等。
下面展示的是索引的动态适应。
![image](https://github.com/supervicchen/vic/blob/master/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202017-06-19%20%E4%B8%8A%E5%8D%889.23.00.png)






