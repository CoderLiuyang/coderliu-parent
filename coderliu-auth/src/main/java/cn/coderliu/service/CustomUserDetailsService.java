package cn.coderliu.service;


import cn.coderliu.model.LoginUser;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import org.springframework.core.Ordered;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;


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
