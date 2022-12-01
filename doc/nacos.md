# nacos说明文件

1. 领域模型

   1. namespace:实现隔离，默认public （通常用于多环境隔离）
   2. group:暂时没用到官方废弃
   3. service:微服务名，对应的服务的注册名spring.application.name
   4. cluster:对指定微服务进行虚拟分组
   5. instance: 服务实例

2. 配置文件中配置

   ```
   spring:
     cloud:
       nacos:
         discovery:
           #指定地址
           server-addr: 192.168.42.130:8848
           namespace: xxx
           cluster-name: xxx
     application:
       #服务名称
       name: xxx
   ```

3. 元数据

   1. 服务级别 （暂无实际应用）

   2. 集群级别 （暂无实际应用）

   3. 实例级别 

      ```
      spring:
        cloud:
          nacos:
            discovery:
              metadata:
                asd: asdf
                kg: asdf
      ```

      