package cn.coderliu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class CoderliuBusinessApplication {

    public static void main(String[] args) {
        SpringApplication.run(CoderliuBusinessApplication.class, args);
    }

}
