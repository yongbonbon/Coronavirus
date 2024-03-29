# Coronavirus
基于SpringBoot及thymeleaf搭建的疫情信息管理系统
疫情信息管理系统旨在通过信息化手段记录跟踪本地区密切接触者、受感染者、危重症病人、治愈者以及死亡者，以密切接触者为开始一直到感染者治愈或者死亡，记录其基本信息、感染源、核算记录以及发病情况等信息，在通过信息化可视化手段展示本地区疫情发展情况，统计各个人群的数量，每个人群所占比例。

本系统的技术环境为： JDK1.8 SpringMvc SpringSecurity SpringBoot Mysql Mybatis Thymeleaf  echarts


## 系统功能模块

疫情信息管理系统应当具备两种对象，疫情管理员对象可以对确诊患者、密切接触者、死亡患者、治愈患者的信息进行管理操作，系统管理员对象在疫情管理员对象的功能基础上可以对系统登录用户进行增删改查。针对需求分析设计了具体模块，系统功能模块图如下图所示。

![image-20200915171800896](/img/image-20200915171800896.png)

抗疫管理员登录后可以进行确诊患者管理、密切接触者管理、死亡管理、治愈管理，同时可以看到数据面板的数据变化与动态图。系统管理员除了拥有抗疫管理者的权限，还可以对抗疫管理员进行管理。

密切接触者可以转换成确诊患者；确诊患者可以转换成死亡患者或者治愈患者，业务流程图如下图2-1。

![image-20200915171919142](/img/image-20200915171919142.png)

## 系统界面

###  登录界面

系统管理员可以通过登录界面输入登录账号和登录密码，点击登录按钮即可进入系统界面，如下图3-1所示。

![img](/img/clip_image002.jpg)



### 数据面板界面

进入到系统之后的首页即是数据面板页面，数据面板页面罗列了目前确诊人数、累计确诊人数、治愈人数、治愈率、现存隔离人数、累计隔离人数、死亡人数、死亡率等信息，可以点击各模块的更多信息进入相关页面。下方则有疫情发展趋势图与比例图展示各个时间段疫情状况与各个人群的比例关系，如下图3-2所示。

![img](/img/clip_image004.jpg)

 

###  确诊患者管理界面

确诊患者管理界面将当前确诊患者列出显示其基本信息，左下角显示共有多少确诊患者，并可选择每页显示多少条数据，数据右侧则是对相应确诊患者进行管理操作，可以查看详情，查看确诊患者详情信息、将当前确诊患者转为治愈、将当前确诊患者转为死亡，如下图所示。

 
![img](/img/clip_image006.jpg)



 

###  患者详情界面

患者详情界面详细的展示了患者的基本信息如下：姓名、年龄、性别、身份证等，治疗信息如下：感染源、是否重症、住院时间、发病症状、诊治医院、信息备注，以及相应的核酸检测及ct检测历史，如下图所示。

![img](/img/clip_image008.jpg)



   系统管理员界面可查看管理员信息、添加管理员、对管理员进行删除、将普通管理员设置为系统管理员操作，如下图所示。

![img](/img/clip_image010.jpg)



 

###  新建密切接触者界面

新建密切接触者界面包含两部分，一是添加密切接触者的基本信息如下图所示，点击下一步则跳转到添加隔离信息界面如下图所示

![img](/img/clip_image012.jpg)

 

![img](/img/clip_image014.jpg)
