package cn.coderliu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients
@SpringBootApplication
public class CoderliuGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(CoderliuGatewayApplication.class, args);
    }

}
