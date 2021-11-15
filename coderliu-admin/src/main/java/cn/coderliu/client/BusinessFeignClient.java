package cn.coderliu.client;

import org.springframework.cloud.openfeign.FeignClient;

/**
 * @author liu
 */
@FeignClient(name = "coderliu-business")
public interface BusinessFeignClient {
}
