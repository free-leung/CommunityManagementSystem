# 社团管理系统

#### 项目介绍
本系统是针对大学生社团群体组织活动的管理系统，适用于高校的社团组织。

#### 需求说明
##### 1.管理员操作:  
（1）增加社团：增加社团时需指定社长和副社长。  
（2）删除社团：删除社团时级联删除关联的内容。  
（3）修改社团：修改社团的社长。  
（4）查看所有社团：需要分页、模糊查询功能。  
（5）查看审核列表：需要分页。  
（6）审核申请社团：通过后进入增加社团页面，增加这个社团。  
（7）查询所有用户：针对不同的社团可进行模糊查询。  

##### 2.社长操作:  
（1）发布社团活动：在相应的社团发布社团活动。（创建相应的社团活动保存到审核表，审核通过后通过审核表中的信息来增加活动到社团活动表）  
（2）添加组。  
（3）修改社团内每组成员上限：例如把某组的人员上限从10改为15。  
（4）调度社团成员到不同组：例如把某社团成员的组号从1组改为2组。  
（5）任命组长。  
（6）查看所有本社团成员：可以通过所在系、专业、班级筛选。  
（7）查看所有本社团活动列表：按日期降序排列，需要分页。  
（8）查看活动的签到表：按签到顺序升序排列。  
（9）删除社团成员。  
（10）删除该社团篮子中的作品。  
（11）查看个人信息。  
（12）修改密码。  

##### 3.组长操作（除部分特殊权限外，也有和普通学生一样的操作）：  
（1）发布活动签到表。  
（2）查看该组签到情况。  
（3）查看个人信息。  
（4）修改密码。  

##### 4.普通学生操作:  
（1）参加社团活动。  
（2）签到：在活动时间范围内才可以签到成功。  
（3）请假：在活动开始前才可以请假成功。  
（4）查看个人信息。  
（5）发表社团作品到社团篮子。  
（6）修改密码。  


#### 数据表设计
##### 管理员表(admin)
|adminId(PK)|username|password|
|:-:|:-:|:-:|
|1|admin|admin|

##### 学生表(student)
|studentId(PK)|username|password|positionId(FK)|associationId(FK)|groupId(FK)|
|:-:|:-:|:-:|:-:|:-:|:-:|
|1|T2016209101|123456|1|1|1|
|2|T2016209102|123456|1|2|3|

##### 社团职位表(association-position)
|positionId(PK)|positionName|
|:-:|:-:|
|1|社长|
|2|副社长|
|3|组长|
|4|普通成员|

##### 学生信息表(student-info)
|studentId(FK)|name|sex|borndate|address|phone|explain|classid(FK)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|1|XXX|男|1999-09-09|江西省XX市XX县|139XXXXXXXX|这个人很懒，什么也没有写|1|
|2|XXX|男|1999-09-09|江西省XX市XX县|137XXXXXXXX|这个人很懒，什么也没有写|1|

##### 系表(department)
|deptId(PK)|deptName|
|:-:|:-:|
|1|信息工程系|
|2|机电工程系|

##### 专业表(major)
|majorId(PK)|majorName|deptId(FK)|
|:-:|:-:|:-:|
|1|软件技术|1|
|2|物联网应用技术|1|

##### 班级表(class)
|classId(PK)|classNumber|grade|majorId(FK)|
|:-:|:-:|:-:|:-:|
|1|1|2016|1|
|2|2|2016|1|

##### 社团表(association)
|associationId(PK)|name|explain|
|:-:|:-:|:-:|
|1|篮球社|欢迎来到篮球社这个大家庭！|
|2|足球社|足球社是你最想要的运动天地！|

##### 社团分组表(association-group)
|groupId(PK)|associationId(FK)|groupNumber|
|:-:|:-:|:-:|
|1|1|1|
|2|1|1|
|3|2|1|


##### 社团篮子(association-basket)
|workId(PK)|associationId(FK)|title|explain|sourceFile|studentId(FK)|
|:-:|:-:|:-:|:-:|:-:|:-:|
|1|1|2018-9-15一组VS二组篮球赛|这场比赛非常精彩|video/XXX.mp4|1|


##### 社团活动表(association-activity)
|activityId(PK)|activityName|explain|activityBegin|activityEnd|associationId(FK)|statusId(FK)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|1|篮球基本功训练|为了提高社团成员的球感|2018-06-24 18:30:00|2018-06-24 20:30:00|1|2|
|2|足球基本功训练|为了提高社团成员的控球的训练|2018-07-22 19:00:00|2018-07-22 21:00:00|2|2|


##### 审核状态表(audit-status)
|statusId(PK)|statusName|
|:-:|:-:|
|1|待审核|
|2|已通过|
|3|未通过|

##### 签到表(signin)
|signinId(PK)|title|activityId(FK)|studentId(FK)|typeId(FK)|signinTime|
|:-:|:-:|:-:|:-:|:-:|:-:|
|1|篮球训练|1|1|1|2018-06-24 18:30:55|

##### 签到类型表(signin-type)
|typeId(PK)|typeName|
|:-:|:-:|
|1|签到|
|2|请假|


#### 数据表关系图
暂无
