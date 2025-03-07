package cn.coderliu;

import cn.coderliu.annotation.EnableResourceServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
@EnableResourceServer
public class CoderliuChatApplication {

    public static void main(String[] args) {
        SpringApplication.run(CoderliuChatApplication.class, args);
    }

}
