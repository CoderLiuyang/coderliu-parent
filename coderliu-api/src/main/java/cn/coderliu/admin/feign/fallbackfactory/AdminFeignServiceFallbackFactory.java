package cn.coderliu.admin.feign.fallbackfactory;

import cn.coderliu.admin.feign.AdminFeignService;
import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class AdminFeignServiceFallbackFactory implements FallbackFactory<AdminFeignService> {


    @Override
    public AdminFeignService create(Throwable cause) {
        log.error("rcs服务失败:{}", cause.getMessage());
       return new AdminFeignService() {
            @Override
            public R<GetUserDetailVo> getUserDetail(String userName) {
                return null;
            }

       };
    }
}
