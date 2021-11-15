package cn.coderliu.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author liu
 */
@RestController
@RequiredArgsConstructor
public class DiscoveryClientController {

    private DiscoveryClient discoveryClient;



    @GetMapping("test")
    public void test(){
        List<ServiceInstance> instances = discoveryClient.getInstances("coderliu-business");

        System.out.println(instances);
    }
}
