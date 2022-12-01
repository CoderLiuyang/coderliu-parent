## 架构相关文档

1. 版本依赖关系

   1. Spring Cloud Alibaba Version 2021.0.4.0
   2. Spring Cloud Version  2021.0.4
   3. Spring Boot Version  2.6.11
   4. Sentinel Version 1.8.5
   5. Nacos Version 2.0.4
   6. RocketMQ Version 4.9.4 
   7. Seata Version 1.5.2

2. 中间件的安装

   1. nacos安装（访问地址http://ip:8848/nacos）

   ```
   wget https://github.com/alibaba/nacos/releases/download/2.0.4/nacos-server-2.0.4.tar.gz
   tar -zxvf nacos-server-2.0.4.tar.gz
   ./nacos/bin/startup.sh -m standalone
   ```

   