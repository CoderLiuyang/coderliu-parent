package cn.coderliu.admin.feign;

import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.common.R;
import cn.coderliu.common.ServiceNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * admin调用服务
 */
@FeignClient(contextId = "adminFeignService", value = ServiceNameConstants.ADMIN_SERVICE)
public interface AdminFeignService {


    /**
     * 通过用户名获取用户信息
     * @param userName 用户名
     * @return
     */
    @PostMapping("/sysUser/getUserDetail")
    R<GetUserDetailVo> getUserDetail(@RequestParam("userName") String userName);

}
