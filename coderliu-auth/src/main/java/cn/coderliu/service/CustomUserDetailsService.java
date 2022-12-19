package cn.coderliu.service;


import org.springframework.core.Ordered;
import org.springframework.security.core.userdetails.UserDetailsService;


/**
 * 用户认证
 */
public interface CustomUserDetailsService extends UserDetailsService, Ordered {

    default boolean support(String clientId, String grantType) {
        return true;
    }

    default int getOrder() {
        return 0;
    }


}
