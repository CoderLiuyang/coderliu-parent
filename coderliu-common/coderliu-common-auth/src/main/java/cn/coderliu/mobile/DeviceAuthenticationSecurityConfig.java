package cn.coderliu.mobile;

import cn.coderliu.service.FeihuangUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.stereotype.Component;

/**
 * @ClassName: DeviceAuthenticationSecurityConfig
 * @Description: 设备信息相关配置处理
 * @Author: liu
 * @Date: 2020/9/8 2:26 下午
 * @Version: V1.0
 **/
@Component
public class DeviceAuthenticationSecurityConfig extends SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity> {

    @Autowired
    private FeihuangUserDetailsService userDetailsService;

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Override
    public void configure(HttpSecurity http) {
        //mobile provider
        DeviceAuthenticationProvider provider = new DeviceAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setRedisTemplate(redisTemplate);
        http.authenticationProvider(provider);
    }
}
