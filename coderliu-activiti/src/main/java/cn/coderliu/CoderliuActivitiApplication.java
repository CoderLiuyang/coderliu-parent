package cn.coderliu;

import cn.coderliu.annotation.EnableResourceServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
@EnableResourceServer
public class CoderliuActivitiApplication {

    public static void main(String[] args) {
        SpringApplication.run(CoderliuActivitiApplication.class, args);
    }

}
