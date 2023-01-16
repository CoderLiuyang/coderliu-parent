package cn.coderliu.admin.feign;

import cn.coderliu.admin.feign.fallbackfactory.AdminFeignServiceFallbackFactory;
import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.admin.vo.GetUserVo;
import cn.coderliu.common.R;
import cn.coderliu.common.ServiceNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * admin调用服务
 */
@FeignClient(contextId = "adminFeignService", value = ServiceNameConstants.ADMIN_SERVICE, fallbackFactory = AdminFeignServiceFallbackFactory.class)
public interface AdminFeignService {


    /**
     * 通过用户名获取用户信息
     *
     * @param userName 用户名
     * @return
     */
    @PostMapping("/user/getUserDetail")
    R<GetUserDetailVo> getUserDetail(@RequestParam("userName") String userName);

    /**
     * 通过用户名获取用户信息
     *
     * @param userName 用户名
     * @return
     */
    @GetMapping("/user/{id}")
    R<GetUserVo> get(@PathVariable("id") String id);

}
