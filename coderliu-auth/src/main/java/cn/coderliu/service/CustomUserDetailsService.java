package cn.coderliu.service;


import cn.coderliu.model.LoginUser;
import org.springframework.security.core.userdetails.UserDetailsService;


/**
 * 用户认证
 */
public interface CustomUserDetailsService extends UserDetailsService {

    LoginUser loadUserByWebApp(String username, String password);
}
