package cn.coderliu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;


@EnableFeignClients
//@EnableResourceServer
@SpringBootApplication
public class CoderliuGenerateApplication {

    public static void main(String[] args) {
        SpringApplication.run(CoderliuGenerateApplication.class, args);
    }

}
