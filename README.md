### 简单介绍

coderliu-parent 基于SpringCloud-Alibaba的微服务架构，提供整微服务解决方案。
基于时下经典技术组合（SpringCloud-Alibaba套件、Spring-Authorization-Server、MyBatis-plus、Jwt、Vue等），作者结合了多个火热的微服务框架（ruoyi、pig、renren）和自身工作经验理解取其精华去其糟粕，最后形成了一套高度抽象可以面向业务的微服务架构。内置模块如：部门管理、角色用户、菜单及按钮授权、数据权限、系统参数、日志管理、代码生成等。在线定时任务配置；支持集群，支持多数据源，支持分布式事务。
#主要特性

- 完全响应式布局（支持电脑、平板等所有主流设备）
- 强大的一键生成功能(从数据库设计到接口一键动态生成、一键上传接口文档)
- 支持按钮及数据权限，可自定义数据权限。
- Maven多项目依赖，模块及插件分项目，尽量松耦合，方便模块升级、增减模块。
- 集成flowable工作流

  ### 技术选型
- 基础选型

| Middleware | Version |
|------------|---------|
| JDK        | 11      |
| MySQL      | 8+      |
| Redis      | 7+      |
| node       | 10.0 +  |
| npm        | 6.0 +   |

- 阿里巴巴组件版本依赖参照（https://github.com/alibaba/spring-cloud-alibaba/wiki/%E7%89%88%E6%9C%AC%E8%AF%B4%E6%98%8E）

| Model                             | Version    |
|-----------------------------------|------------|
| Spring Cloud Alibaba Version      | 2021.0.5.0 |
| Spring Cloud Version              | 2021.0.5   |
| Spring Boot Version               | 2.7.11     |
| Nacos Version                     | 2.2.0      |
| SpringAuthorizationServer Version | 0.4.0      |

- 其他组件版本

| Model                | Version |
|:---------------------|---------|
| FastJson Version     | 1.2.83  |
| Hutool Version       | 5.8.10  |
| mybatis-plus Version | 3.5.3   |
| dynamic-ds Version   | 3.6.1   |

### 内置功能

- 用户管理：用户是系统操作者，该功能主要完成系统用户配置。
- 部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
- 岗位管理：配置系统用户所属担任职务。
- 菜单管理：配置系统菜单，操作权限，按钮权限标识等。
- 角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
- 字典管理：对系统中经常使用的一些较为固定的数据进行维护。

### 个人微信

![image-20240107201608752](.\doc\img\2.png)
### 技术交流群

![image-20240107201608751](.\doc\img\1.png)
